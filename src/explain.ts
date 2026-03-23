import {
  BinaryExpr,
  CTE,
  ColumnDef,
  ColumnTransformer,
  CreateTableStatement,
  CreateViewStatement,
  CreateMaterializedViewStatement,
  CreateDatabaseStatement,
  CreateFunctionStatement,
  CreateIndexStatement,
  CreateDictionaryStatement,
  CreateWorkloadStatement,
  ExplainStatement,
  Expression,
  FromExpr,
  InsertStatement,
  ParallelWithStatement,
  JoinConstraint,
  OrderByItem,
  SampleClause,
  SelectStatement,
  SettingItem,
  Statement,
  StatementsSchema,
  SubqueryFrom,
  TableFunctionRef,
  TableRef,
  WindowSpec,
} from './ast';
import { isCreateTableStatement } from './guards';

const OP_TO_FUNCTION: Record<string, string> = {
  AND: 'and',
  OR: 'or',
  '>': 'greater',
  '<': 'less',
  '>=': 'greaterOrEquals',
  '<=': 'lessOrEquals',
  '=': 'equals',
  '==': 'equals',
  '!=': 'notEquals',
  '<>': 'notEquals',
  '+': 'plus',
  '-': 'minus',
  '*': 'multiply',
  '/': 'divide',
  '%': 'modulo',
  DIV: 'intDiv',
  MOD: 'modulo',
  '<=>': 'isNotDistinctFrom',
  'IS DISTINCT FROM': 'isDistinctFrom',
  'IS NOT DISTINCT FROM': 'isNotDistinctFrom',
};

type ExplainNode = { label: string; children: ExplainNode[] };

function n(label: string, children: ExplainNode[] = []): ExplainNode {
  return { label, children };
}

function render(node: ExplainNode, depth = 0): string {
  const indent = ' '.repeat(depth);
  const suffix = node.children.length > 0 ? ` (children ${node.children.length})` : '';
  const lines = [indent + node.label + suffix];
  for (const child of node.children) {
    lines.push(render(child, depth + 1));
  }
  return lines.join('\n');
}

function normalizeTypeName(type: string): string {
  // Normalize type name for ClickHouse EXPLAIN output:
  // - Collapse whitespace to single space
  // - Strip spaces adjacent to ( and ) outside quoted strings
  // - Add ", " after commas outside quoted strings
  // - Add " = " around bare = outside quoted strings (e.g. Dynamic(max_types=0))
  // - Escape backslashes as \\ and single quotes as \' throughout
  // Process character-by-character to avoid modifying content inside single-quoted strings.
  let result = '';
  let inString = false;
  const s = type.replace(/\s+/g, ' ').trim();
  for (let i = 0; i < s.length; i++) {
    const ch = s[i];
    if (inString) {
      if (ch === '\\') {
        // Double each backslash so the label output shows it correctly
        result += '\\\\';
      } else if (ch === "'") {
        result += "\\'";
        inString = false;
      } else {
        result += ch;
      }
    } else {
      if (ch === "'") {
        result += "\\'";
        inString = true;
      } else if (ch === '(' || ch === ')') {
        result = result.trimEnd();
        // Strip trailing comma before closing paren (e.g. Tuple(a Int, b String,) → Tuple(a Int, b String))
        if (ch === ')' && result.endsWith(',')) result = result.slice(0, -1).trimEnd();
        result += ch;
        if (i + 1 < s.length && s[i + 1] === ' ') i++;
      } else if (ch === ',') {
        result = result.trimEnd();
        result += ', ';
        if (i + 1 < s.length && s[i + 1] === ' ') i++;
      } else if (ch === '=' && result.length > 0 && /[\w']/.test(result[result.length - 1])) {
        result = result.trimEnd() + ' = ';
        if (i + 1 < s.length && s[i + 1] === ' ') i++;
      } else if (ch === '\\') {
        result += '\\\\';
      } else {
        result += ch;
      }
    }
  }
  // Empty Tuple() → Tuple (ClickHouse displays empty tuple type without parens)
  return quoteJsonPaths(result).replace(/\bTuple\(\)/g, 'Tuple');
}

// In JSON type specs, unquoted dotted paths followed by a type name need backtick quoting.
// E.g.: JSON(a.b.c.d Bool) → JSON(`a.b.c.d` Bool)
// Paths after SKIP or REGEXP keywords are NOT quoted.
// Already-backtick-quoted paths are left untouched.
function quoteJsonPaths(s: string): string {
  // Find each JSON(...) section with balanced parens and quote dotted paths inside.
  let result = '';
  let i = 0;
  while (i < s.length) {
    const idx = s.indexOf('JSON(', i);
    if (idx === -1) {
      result += s.slice(i);
      break;
    }
    result += s.slice(i, idx + 5); // include 'JSON('
    i = idx + 5;
    // Find the matching closing paren (balanced)
    let depth = 1;
    const start = i;
    while (i < s.length && depth > 0) {
      if (s[i] === '(') depth++;
      else if (s[i] === ')') depth--;
      i++;
    }
    const inner = s.slice(start, i - 1);
    result += quoteJsonInner(inner) + ')';
  }
  return result;
}

function quoteJsonInner(inner: string): string {
  // Split by top-level commas, process each param, then rejoin with ', '.
  const parts: string[] = [];
  let depth = 0;
  let start = 0;
  for (let i = 0; i < inner.length; i++) {
    const ch = inner[i];
    if (ch === '(' || ch === '[') depth++;
    else if (ch === ')' || ch === ']') depth--;
    else if (ch === ',' && depth === 0) {
      parts.push(inner.slice(start, i).trim());
      start = i + 1;
    }
  }
  parts.push(inner.slice(start).trim());

  const processed = parts.map((part) => {
    // Don't touch SKIP/REGEXP params or settings (word = value)
    if (/^SKIP\s|^REGEXP\s|^\w+ *=/.test(part)) return part;
    // Match an unquoted path (possibly dotted) followed by a space and the type
    const m = part.match(/^([a-zA-Z_%][a-zA-Z0-9_%.]*)(\s+.+)$/);
    if (m && m[1].includes('.')) {
      return '`' + m[1] + '`' + m[2];
    }
    return part;
  });

  return processed.join(', ');
}

function normalizeFloat(value: string): string {
  // Handle special ClickHouse float literals that parseFloat doesn't understand
  if (value === 'inf' || value === '-inf') return value;
  if (value === 'nan' || value === '-nan') return 'nan';
  const f = parseFloat(value);
  // Preserve negative zero
  if (f === 0 && 1 / f === -Infinity) return '-0';
  // Remove the '+' from exponent (e.g. e+307 → e307) to match ClickHouse output
  return f.toString().replace('e+', 'e');
}

function normalizeUInt(value: string): string {
  if (value.startsWith('0x') || value.startsWith('0X')) {
    // Use BigInt to avoid precision loss for large 64-bit hex values
    return BigInt(value).toString();
  }
  if (value.startsWith('0b') || value.startsWith('0B')) {
    return BigInt(value).toString();
  }
  return value;
}

function columnTransformerNode(t: ColumnTransformer): ExplainNode {
  if (t.kind === 'apply') return n('ColumnsApplyTransformer');
  if (t.kind === 'except') {
    // String-pattern EXCEPT has no children; column-list EXCEPT has Identifier children
    if (t.pattern) return n('ColumnsExceptTransformer');
    return n(
      'ColumnsExceptTransformer',
      t.columns.map((c) => n(`Identifier ${c}`)),
    );
  }
  // replace
  return n(
    'ColumnsReplaceTransformer',
    t.items.map((item) => n('ColumnsReplaceTransformer::Replacement', [exprNode(item.expr)])),
  );
}

function transformerListNode(transformers: ColumnTransformer[]): ExplainNode {
  return n('ColumnsTransformerList', transformers.map(columnTransformerNode));
}

function escapeStringValue(value: string): string {
  // The grammar stores strings in pre-escaped form:
  // - \b, \f, \n, \r, \t, \0, \\ are stored as their two-char sequences (backslash + letter)
  //   and should be output as-is (no additional escaping).
  // - \' is stored as a plain single quote and must be re-escaped as \'.
  // - Actual control characters (literal tab, newline, etc.) must be escaped.
  return (
    value
      .replace(/'/g, "\\'") // escape single quotes: ' → \'
      // eslint-disable-next-line no-control-regex
      .replace(/\x08/g, '\\b') // actual backspace → \b
      .replace(/\t/g, '\\t') // actual tab char → \t
      .replace(/\n/g, '\\n') // actual newline → \n
      .replace(/\r/g, '\\r') // actual carriage return → \r
      .replace(/\f/g, '\\f') // actual form feed → \f
      .replace(/\0/g, '\\0')
  ); // actual null byte → \0
}

function literalLabel(expr: Expression & { kind: 'literal' }): string {
  if (expr.type === 'String') return `Literal '${escapeStringValue(expr.value)}'`;
  if (expr.type === 'NULL') return 'Literal NULL';
  if (expr.type === 'Bool') return `Literal Bool_${expr.value}`;
  if (expr.type === 'Float64') return `Literal Float64_${normalizeFloat(expr.value)}`;
  if (expr.type === 'Int64') {
    // ClickHouse represents -0 as UInt64_0
    if (expr.value === '0') return 'Literal UInt64_0';
    return `Literal Int64_${expr.value}`;
  }
  return `Literal UInt64_${normalizeUInt(expr.value)}`;
}

// Inline representation of an expression used inside Array/Tuple literals.
// Returns null if the expression cannot be represented inline (meaning the containing
// array should use the Function form instead of the Literal Array_ form).
function inlineExpr(expr: Expression): string | null {
  // Parenthesized elements force Function form for the containing array/tuple
  if ((expr as Record<string, unknown>).parenthesized) return null;
  switch (expr.kind) {
    case 'literal':
      if (expr.type === 'String') return `'${escapeStringValue(expr.value)}'`;
      if (expr.type === 'NULL') return 'NULL';
      if (expr.type === 'Bool') return `Bool_${expr.value}`;
      if (expr.type === 'Float64') return `Float64_${normalizeFloat(expr.value)}`;
      if (expr.type === 'Int64') return expr.value === '0' ? 'UInt64_0' : `Int64_${expr.value}`;
      return `UInt64_${normalizeUInt(expr.value)}`;
    case 'arrayLiteral': {
      // Empty arrays use Function array form, not literal
      if (expr.elements.length === 0) return null;
      const inlines = expr.elements.map(inlineExpr);
      if (inlines.some((i) => i === null)) return null;
      return `Array_[${inlines.join(', ')}]`;
    }
    default:
      // column refs, function calls, tuples, etc. are not inline-able
      return null;
  }
}

// Inline a tuple literal recursively: only literals and nested tuples-of-literals are inlineable.
// Arrays inside tuples are NOT inlined here — use inlineInValue for IN context.
function inlineTupleLiteral(expr: Expression): string | null {
  if ((expr as Record<string, unknown>).parenthesized) return null;
  if (expr.kind === 'literal') return inlineExpr(expr);
  if (expr.kind === 'tupleLiteral') {
    const inlines = expr.elements.map(inlineTupleLiteral);
    if (inlines.some((i) => i === null)) return null;
    return `Tuple_(${inlines.join(', ')})`;
  }
  return null;
}

// Like inlineExpr but also handles tuple elements recursively — used for IN values
// where tuples can appear as `Tuple_(...)` inside an outer `Literal Tuple_`.
// Arrays inside tuples are NOT inlined (ClickHouse renders them as Function tuple).
function inlineInValue(expr: Expression): string | null {
  // Arrays as IN values are not inlined when they appear inside tuples
  if (expr.kind === 'arrayLiteral') return null;
  const inline = inlineExpr(expr);
  if (inline !== null) return inline;
  if (expr.kind === 'tupleLiteral') {
    const inlines = expr.elements.map(inlineInValue);
    if (inlines.some((i) => i === null)) return null;
    return `Tuple_(${inlines.join(', ')})`;
  }
  return null;
}

// Build WindowDefinition node from a parsed WindowSpec.
// Children: optional ExpressionList(PARTITION BY), optional ExpressionList(ORDER BY with OrderByElements),
// then frame bound expressions (only for non-UNBOUNDED, non-CURRENT_ROW bounds).
function windowDefinitionNode(spec: WindowSpec): ExplainNode {
  const children: ExplainNode[] = [];
  if (spec.partitionBy && spec.partitionBy.length > 0) {
    children.push(n('ExpressionList', spec.partitionBy.map(exprNode)));
  }
  if (spec.orderBy && spec.orderBy.length > 0) {
    children.push(n('ExpressionList', spec.orderBy.map(orderByNode)));
  }
  if (spec.frame) {
    const { start, end } = spec.frame;
    if (start.kind === 'preceding' || start.kind === 'following') {
      children.push(exprNode(start.expr));
    }
    if (end && (end.kind === 'preceding' || end.kind === 'following')) {
      children.push(exprNode(end.expr));
    }
  }
  return n('WindowDefinition', children);
}

// Build a synthetic subquery node for ANY/ALL rewriting:
// SELECT aggFunc(*) FROM (subquery) [with duplicated children]
function syntheticAggSubquery(aggFunc: string, subqueryStmt: Statement): ExplainNode {
  const aggNode = n(`Function ${aggFunc}`, [n('ExpressionList', [n('Asterisk')])]);
  const fromNode = n('TablesInSelectQuery', [
    n('TablesInSelectQueryElement', [
      n('TableExpression', [n('Subquery', [stmtNode(subqueryStmt)])]),
    ]),
  ]);
  // ClickHouse duplicates the select+from children in the synthetic query
  const selectQuery = n('SelectQuery', [
    n('ExpressionList', [aggNode]),
    fromNode,
    n('ExpressionList', [n(`Function ${aggFunc}`, [n('ExpressionList', [n('Asterisk')])])]),
    n('TablesInSelectQuery', [
      n('TablesInSelectQueryElement', [
        n('TableExpression', [n('Subquery', [stmtNode(subqueryStmt)])]),
      ]),
    ]),
  ]);
  return n('Subquery', [n('SelectWithUnionQuery', [n('ExpressionList', [selectQuery])])]);
}

// Rewrite x op ANY/ALL (subquery) to ClickHouse canonical form
function rewriteAnyAll(expr: BinaryExpr): ExplainNode | null {
  if (expr.right.kind !== 'functionCall') return null;
  const fname = expr.right.name.toLowerCase();
  if (fname !== 'any' && fname !== 'all') return null;
  if (expr.right.args.length !== 1 || expr.right.args[0].kind !== 'subqueryExpr') return null;

  const subqueryStmt = expr.right.args[0].query;
  const leftNode = exprNode(expr.left);
  const op = expr.op;
  const isAny = fname === 'any';

  // == ANY → in, != ALL → notIn
  if ((op === '==' || op === '=') && isAny) {
    return n('Function in', [
      n('ExpressionList', [leftNode, n('Subquery', [stmtNode(subqueryStmt)])]),
    ]);
  }
  if ((op === '!=' || op === '<>') && !isAny) {
    return n('Function notIn', [
      n('ExpressionList', [leftNode, n('Subquery', [stmtNode(subqueryStmt)])]),
    ]);
  }

  // == ALL → in with singleValueOrNull, != ANY → notIn with singleValueOrNull
  if ((op === '==' || op === '=') && !isAny) {
    return n('Function in', [
      n('ExpressionList', [leftNode, syntheticAggSubquery('singleValueOrNull', subqueryStmt)]),
    ]);
  }
  if ((op === '!=' || op === '<>') && isAny) {
    return n('Function notIn', [
      n('ExpressionList', [leftNode, syntheticAggSubquery('singleValueOrNull', subqueryStmt)]),
    ]);
  }

  // Comparison ops: determine aggregate function and ClickHouse comparison function
  const compFunc = OP_TO_FUNCTION[op];
  if (!compFunc) return null;

  // ANY: < <= use max, > >= use min
  // ALL: < <= use min, > >= use max
  let aggFunc: string;
  if (isAny) {
    aggFunc = op === '<' || op === '<=' ? 'max' : 'min';
  } else {
    aggFunc = op === '<' || op === '<=' ? 'min' : 'max';
  }

  return n(`Function ${compFunc}`, [
    n('ExpressionList', [leftNode, syntheticAggSubquery(aggFunc, subqueryStmt)]),
  ]);
}

function exprNode(expr: Expression): ExplainNode {
  switch (expr.kind) {
    case 'literal':
      return n(literalLabel(expr));
    case 'columnRef': {
      // Format each column ref part for ClickHouse EXPLAIN output:
      // - ^name (JSON object subcolumn): ^`name`
      // - name[] (JSON array subcolumn): name.:`Array(JSON)`  (expands into two dot-separated parts)
      // - other parts: unchanged
      const formattedParts: string[] = [];
      for (const part of expr.parts) {
        if (part.startsWith('^')) {
          formattedParts.push(`^\`${part.slice(1)}\``);
        } else if (part.endsWith('[]')) {
          formattedParts.push(part.slice(0, -2));
          formattedParts.push(':`Array(JSON)`');
        } else {
          formattedParts.push(part);
        }
      }
      return n(`Identifier ${formattedParts.join('.')}`);
    }
    case 'asterisk': {
      const transformers = expr.transformers;
      if (transformers && transformers.length > 0) {
        return n('Asterisk', [transformerListNode(transformers)]);
      }
      return n('Asterisk');
    }
    case 'qualifiedAsterisk': {
      const qChildren: ExplainNode[] = [n(`Identifier ${expr.parts.join('.')}`)];
      if (expr.transformers && expr.transformers.length > 0) {
        qChildren.push(transformerListNode(expr.transformers));
      }
      return n('QualifiedAsterisk', qChildren);
    }
    case 'tupleExpansion': {
      const teChildren: ExplainNode[] = [];
      if (expr.transformers && expr.transformers.length > 0) {
        teChildren.push(transformerListNode(expr.transformers));
      }
      return teChildren.length > 0 ? n('Asterisk', teChildren) : n('Asterisk');
    }

    case 'queryParam':
      return n(`QueryParameter ${expr.name}:${expr.type}`);
    case 'alias': {
      // Outer alias overrides any inner aliases — only show the outermost alias
      let innerExpr = expr.expr;
      while (innerExpr.kind === 'alias') {
        innerExpr = innerExpr.expr;
      }
      const inner = exprNode(innerExpr);
      return { label: `${inner.label} (alias ${expr.alias})`, children: inner.children };
    }
    case 'arrayLiteral': {
      if (expr.elements.length === 0) {
        return n('Function array', [n('ExpressionList')]);
      }
      const inlines = expr.elements.map(inlineExpr);
      if (inlines.some((i) => i === null)) {
        return n('Function array', [n('ExpressionList', expr.elements.map(exprNode))]);
      }
      return n(`Literal Array_[${inlines.join(', ')}]`);
    }
    case 'tupleLiteral': {
      const inline = inlineTupleLiteral(expr);
      if (inline !== null) return n(`Literal ${inline}`);
      return n('Function tuple', [n('ExpressionList', expr.elements.map(exprNode))]);
    }
    case 'functionCall': {
      // Normalize known function aliases to their canonical names as ClickHouse does
      const FUNC_ALIASES: Record<string, string> = {
        cast: 'CAST',
        datediff: 'dateDiff',
        ltrim: 'trimLeft',
        rtrim: 'trimRight',
        trim: 'trimBoth',
        exists: 'exists',
        grouping: 'grouping',
        substring: 'substring',
        extract: 'extract',
        position: 'position',
      };
      const funcName = FUNC_ALIASES[expr.name.toLowerCase()] ?? expr.name;
      // not(tuple(a,b,c)) — NOT applied directly to a tuple literal: expand the tuple
      if (funcName === 'not' && expr.args.length === 1 && expr.args[0].kind === 'tupleLiteral') {
        const tupleArg = expr.args[0];
        const tupleNode = n('Function tuple', [
          n('ExpressionList', tupleArg.elements.map(exprNode)),
        ]);
        return n('Function not', [n('ExpressionList', [tupleNode])]);
      }
      // COLUMNS('regex') renders as ColumnsRegexpMatcher; COLUMNS(id, ...) as ColumnsListMatcher
      if (funcName.toUpperCase() === 'COLUMNS') {
        const isRegex =
          expr.args.length === 1 &&
          expr.args[0].kind === 'literal' &&
          expr.args[0].type === 'String';
        if (isRegex) return n('ColumnsRegexpMatcher');
        return n('ColumnsListMatcher', [n('ExpressionList', expr.args.map(exprNode))]);
      }
      if (
        funcName.toLowerCase() === 'view' &&
        expr.args.length === 1 &&
        expr.args[0].kind === 'subqueryExpr'
      ) {
        return n(`Function ${funcName}`, [n('ExpressionList', [stmtNode(expr.args[0].query)])]);
      }
      const funcChildren: ExplainNode[] = [];
      const argNodes = expr.args.map(exprNode);
      if (expr.funcSettings) argNodes.push(n('Set'));
      funcChildren.push(n('ExpressionList', argNodes));
      if (expr.params) {
        funcChildren.push(n('ExpressionList', expr.params.map(exprNode)));
      }
      // Window function: add WindowDefinition node for inline OVER (spec) clause
      if (expr.window) {
        funcChildren.push(windowDefinitionNode(expr.window));
      }
      return n(`Function ${funcName}`, funcChildren);
    }
    case 'castExpr': {
      // For :: operator casts, pure literal expressions (no function calls or identifiers)
      // are shown as string literals. Source text is used to preserve original formatting.
      function isPureLiteral(e: Expression): boolean {
        if (e.kind === 'literal') return e.type !== 'NULL' && e.type !== 'Bool';
        if (e.kind === 'arrayLiteral') return e.elements.every(isPureLiteral);
        if (e.kind === 'tupleLiteral') return e.elements.every(isPureLiteral);
        return false;
      }
      function castElemStr(e: Expression): string {
        if (e.kind === 'literal') {
          if (e.type === 'String') return `'${escapeStringValue(e.value)}'`;
          return e.value;
        }
        if (e.kind === 'arrayLiteral') {
          if (e.source !== undefined) return e.source;
          return `[${e.elements.map(castElemStr).join(', ')}]`;
        }
        // tuple
        if (e.kind === 'tupleLiteral') {
          if (e.source !== undefined) return e.source;
          return `(${e.elements.map(castElemStr).join(', ')})`;
        }
        return '';
      }
      function castOperandString(e: Expression): string | null {
        if (!isPureLiteral(e)) return null;
        if (e.kind === 'literal') {
          if (e.type === 'String') return escapeStringValue(e.value);
          return e.value;
        }
        if (e.kind === 'arrayLiteral') {
          // Escape single quotes in source text so they appear as \' in the Literal label
          const src = e.source !== undefined ? e.source.replace(/'/g, "\\'") : null;
          return src ?? `[${e.elements.map(castElemStr).join(', ')}]`;
        }
        if (e.kind === 'tupleLiteral') {
          const src = e.source !== undefined ? e.source.replace(/'/g, "\\'") : null;
          return src ?? `(${e.elements.map(castElemStr).join(', ')})`;
        }
        return null;
      }
      let innerNode: ExplainNode;
      if (expr.operator) {
        const str = castOperandString(expr.expr);
        innerNode = str !== null ? n(`Literal '${str}'`) : exprNode(expr.expr);
      } else {
        innerNode = exprNode(expr.expr);
      }
      return n('Function CAST', [
        n('ExpressionList', [innerNode, n(`Literal '${normalizeTypeName(expr.type)}'`)]),
      ]);
    }
    case 'lambdaExpr': {
      const paramNodes = expr.params.map((p) => n(`Identifier ${p}`));
      // If the lambda body has an alias, ClickHouse moves the alias to the lambda node itself
      let body = expr.body;
      let lambdaAlias = '';
      while (body.kind === 'alias') {
        lambdaAlias = body.alias;
        body = body.expr;
      }
      const label = lambdaAlias ? `Function lambda (alias ${lambdaAlias})` : 'Function lambda';
      return n(label, [
        n('ExpressionList', [
          n('Function tuple', [n('ExpressionList', paramNodes)]),
          exprNode(body),
        ]),
      ]);
    }
    case 'unaryExpr':
      return n('Function not', [n('ExpressionList', [exprNode(expr.expr)])]);
    case 'binaryExpr': {
      // ANY/ALL operator rewriting: x op ANY/ALL (subquery)
      const anyAllResult = rewriteAnyAll(expr);
      if (anyAllResult) return anyAllResult;
      const funcName = OP_TO_FUNCTION[expr.op] ?? expr.op;
      return n(`Function ${funcName}`, [
        n('ExpressionList', [exprNode(expr.left), exprNode(expr.right)]),
      ]);
    }
    case 'naryExpr': {
      const funcName = OP_TO_FUNCTION[expr.op] ?? expr.op;
      return n(`Function ${funcName}`, [n('ExpressionList', expr.operands.map(exprNode))]);
    }
    case 'subqueryExpr':
      // EXPLAIN inside a subquery expression renders as viewExplain
      if (expr.query.kind === 'explain') {
        const veNode = viewExplainSubqueryNode(expr.query);
        return n('Subquery', [veNode]);
      }
      return n('Subquery', [stmtNode(expr.query)]);
    case 'inExpr': {
      const funcName = expr.global
        ? expr.negated
          ? 'globalNotIn'
          : 'globalIn'
        : expr.negated
          ? 'notIn'
          : 'in';
      let valuesNode: ExplainNode;
      if (Array.isArray(expr.values)) {
        if (expr.values.length === 1) {
          const single = expr.values[0];
          // Single tuple value in IN: wrap in Function tuple if inlineable,
          // otherwise render directly (e.g. parenthesized elements)
          if (single.kind === 'tupleLiteral') {
            const inlineResult = inlineInValue(single);
            if (inlineResult !== null) {
              valuesNode = n('Function tuple', [
                n('ExpressionList', [n(`Literal ${inlineResult}`)]),
              ]);
            } else {
              valuesNode = exprNode(single);
            }
          } else {
            valuesNode = exprNode(single);
          }
        } else {
          const inlines = expr.values.map(inlineInValue);
          if (inlines.some((i) => i === null)) {
            // Complex elements: use Function tuple form
            valuesNode = n('Function tuple', [n('ExpressionList', expr.values.map(exprNode))]);
          } else {
            const inline = `(${inlines.join(', ')})`;
            valuesNode = n(`Literal Tuple_${inline}`);
          }
        }
      } else {
        valuesNode = n('Subquery', [stmtNode(expr.values.query)]);
      }
      return n(`Function ${funcName}`, [n('ExpressionList', [exprNode(expr.expr), valuesNode])]);
    }
    case 'columnsExpr': {
      const isRegex =
        expr.args.length === 1 && expr.args[0].kind === 'literal' && expr.args[0].type === 'String';
      const tList =
        expr.transformers && expr.transformers.length > 0
          ? [transformerListNode(expr.transformers)]
          : [];
      if (expr.qualifier) {
        const qualNode = n(`Identifier ${expr.qualifier}`);
        if (isRegex) return n('QualifiedColumnsRegexpMatcher', [qualNode, ...tList]);
        return n('QualifiedColumnsListMatcher', [
          qualNode,
          n('ExpressionList', expr.args.map(exprNode)),
          ...tList,
        ]);
      }
      if (isRegex) {
        return n('ColumnsRegexpMatcher', tList);
      }
      // Column list matcher: ExpressionList of columns, then optional transformer list
      return n('ColumnsListMatcher', [n('ExpressionList', expr.args.map(exprNode)), ...tList]);
    }
    case 'jsonSubcolumn': {
      // JSON subcolumn .:Type access — render as identifier with type annotation
      // ClickHouse always backtick-quotes the type in EXPLAIN output
      const typeStr = `\`${expr.type}\``;
      const inner = exprNode(expr.expr);
      const pathSuffix = expr.path && expr.path.length > 0 ? '.' + expr.path.join('.') : '';
      const label = inner.label + `.:${typeStr}${pathSuffix}`;
      return { label, children: inner.children };
    }
  }
}

// Convert a SampleRatioValue to a SampleRatio label for EXPLAIN output.
// Integers ≥ 1 with no decimal point use integer display (e.g. SampleRatio 100).
// All other values (floats, fractions) use fraction display (e.g. SampleRatio 1 / 10).
function sampleRatioLabel(
  sample: SampleClause['ratio'] | NonNullable<SampleClause['offset']>,
): string {
  if ('den' in sample && sample.den !== undefined) {
    // Fraction form: convert each part to integer
    return `SampleRatio ${Math.round(parseFloat(sample.num))} / ${Math.round(parseFloat(sample.den))}`;
  }
  const numText = sample.num;
  // Pure integer (no decimal, no exponent notation)
  if (/^[0-9]+$/.test(numText)) {
    return `SampleRatio ${numText}`;
  }
  // Float/scientific — convert to fraction
  const lower = numText.toLowerCase();
  if (lower.includes('e-')) {
    const [mantissaStr, expStr] = lower.split('e-');
    const num = Math.round(parseFloat(mantissaStr));
    const den = Math.round(Math.pow(10, parseInt(expStr, 10)));
    return `SampleRatio ${num} / ${den}`;
  }
  if (lower.includes('.')) {
    const dotIdx = lower.indexOf('.');
    const afterDot = lower.substring(dotIdx + 1).replace(/e.*$/, '');
    const decimalPlaces = afterDot.length;
    const digits = lower.replace('.', '').replace(/e.*$/, '');
    const num = parseInt(digits, 10);
    const den = Math.round(Math.pow(10, decimalPlaces));
    return `SampleRatio ${num} / ${den}`;
  }
  // Positive exponent (e.g. 1e1 = 10): integer display
  return `SampleRatio ${Math.round(parseFloat(numText))}`;
}

function tableExpressionNode(ref: TableRef): ExplainNode {
  const id = ref.database ? `${ref.database}.${ref.table}` : ref.table;
  const label = ref.alias ? `TableIdentifier ${id} (alias ${ref.alias})` : `TableIdentifier ${id}`;
  const children: ExplainNode[] = [n(label)];
  if (ref.sample) {
    children.push(n(sampleRatioLabel(ref.sample.ratio)));
    if (ref.sample.offset) children.push(n(sampleRatioLabel(ref.sample.offset)));
  }
  return n('TableExpression', children);
}

function subqueryTableExprNode(from: SubqueryFrom): ExplainNode {
  const aliasStr = from.alias ? ` (alias ${from.alias})` : '';
  // When an EXPLAIN statement is used as a subquery FROM, ClickHouse represents it as
  // Function viewExplain rather than ExplainQuery ast.
  if (from.query.kind === 'explain') {
    return viewExplainNode(from.query, aliasStr);
  }
  const label = from.alias ? `Subquery (alias ${from.alias})` : 'Subquery';
  const children: ExplainNode[] = [n(label, [stmtNode(from.query)])];
  if (from.columnAliases && from.columnAliases.length > 0) {
    children.push(
      n(
        'ExpressionList',
        from.columnAliases.map((col) => n(`Identifier ${col}`)),
      ),
    );
  }
  if (from.sample) {
    children.push(n(sampleRatioLabel(from.sample.ratio)));
    if (from.sample.offset) children.push(n(sampleRatioLabel(from.sample.offset)));
  }
  return n('TableExpression', children);
}

function tableFunctionExprNode(from: TableFunctionRef): ExplainNode {
  const aliasStr = from.alias ? ` (alias ${from.alias})` : '';
  let funcNode: ExplainNode;
  // view(subquery) renders the subquery directly without Subquery wrapper
  if (
    from.name.toLowerCase() === 'view' &&
    from.args.length === 1 &&
    from.args[0].kind === 'subqueryExpr'
  ) {
    funcNode = n(`Function ${from.name}${aliasStr}`, [
      n('ExpressionList', [stmtNode(from.args[0].query)]),
    ]);
  } else {
    const argsNodes = from.args.map(exprNode);
    if (from.settings && from.settings.length > 0) argsNodes.push(n('Set'));
    funcNode = n(`Function ${from.name}${aliasStr}`, [n('ExpressionList', argsNodes)]);
  }
  const children: ExplainNode[] = [funcNode];
  if (from.sample) {
    children.push(n(sampleRatioLabel(from.sample.ratio)));
    if (from.sample.offset) children.push(n(sampleRatioLabel(from.sample.offset)));
  }
  return n('TableExpression', children);
}

function fromAtomExplainNode(from: TableRef | SubqueryFrom | TableFunctionRef): ExplainNode {
  if (from.kind === 'subqueryFrom') return subqueryTableExprNode(from);
  if (from.kind === 'tableFunctionRef') return tableFunctionExprNode(from);
  return tableExpressionNode(from);
}

function joinConstraintNode(constraint: JoinConstraint): ExplainNode {
  if (constraint.kind === 'on') return n('TableJoin', [exprNode(constraint.expr)]);
  return n('TableJoin', [
    n(
      'ExpressionList',
      constraint.columns.map((col) => {
        if (col === '*') return n('Asterisk');
        if (typeof col === 'object' && col.name && col.alias) {
          return n(`Identifier ${col.name} (alias ${col.alias})`);
        }
        return n(`Identifier ${col}`);
      }),
    ),
  ]);
}

type JoinElement =
  | { tag: 'base'; from: TableRef | SubqueryFrom | TableFunctionRef }
  | { tag: 'join'; from: TableRef | SubqueryFrom | TableFunctionRef; constraint?: JoinConstraint }
  | { tag: 'arrayJoin'; expressions: Expression[] };

function flattenFromExpr(from: FromExpr): JoinElement[] {
  if (
    from.kind === 'tableRef' ||
    from.kind === 'subqueryFrom' ||
    from.kind === 'tableFunctionRef'
  ) {
    return [{ tag: 'base', from }];
  }
  if (from.kind === 'joinExpr') {
    return [
      ...flattenFromExpr(from.left),
      { tag: 'join', from: from.right, constraint: from.constraint },
    ];
  }
  // arrayJoin
  return [...flattenFromExpr(from.left), { tag: 'arrayJoin', expressions: from.expressions }];
}

function fromExprNode(from: FromExpr): ExplainNode {
  const elements = flattenFromExpr(from);
  return n(
    'TablesInSelectQuery',
    elements.map((elem) => {
      if (elem.tag === 'base') {
        return n('TablesInSelectQueryElement', [fromAtomExplainNode(elem.from)]);
      }
      if (elem.tag === 'join') {
        const children = [fromAtomExplainNode(elem.from)];
        children.push(elem.constraint ? joinConstraintNode(elem.constraint) : n('TableJoin'));
        return n('TablesInSelectQueryElement', children);
      }
      // arrayJoin
      return n('TablesInSelectQueryElement', [
        n('ArrayJoin', [n('ExpressionList', elem.expressions.map(exprNode))]),
      ]);
    }),
  );
}

function orderByNode(item: OrderByItem): ExplainNode {
  const children = [exprNode(item.expr)];
  if (item.collate !== undefined) {
    children.push(n(`Literal '${item.collate}'`));
  }
  if (item.fillFrom !== undefined) children.push(exprNode(item.fillFrom));
  if (item.fillTo !== undefined) children.push(exprNode(item.fillTo));
  if (item.fillStep !== undefined) children.push(exprNode(item.fillStep));
  if (item.fillStaleness !== undefined) children.push(exprNode(item.fillStaleness));
  return n('OrderByElement', children);
}

function cteNode(cte: CTE): ExplainNode {
  if (cte.kind === 'cteExpr') {
    return exprNode({ kind: 'alias', expr: cte.expr, alias: cte.name });
  }
  return n('WithElement', [n('Subquery', [stmtNode(cte.query)])]);
}

// Build the inner SelectQuery node for a single SELECT statement
function selectQueryNode(stmt: SelectStatement): ExplainNode {
  const children: ExplainNode[] = [];

  // CTEs from WITH clause: original CTEs go before select columns,
  // distributed CTEs (copied from first SELECT in UNION) go after
  const cteNodes =
    stmt.with && stmt.with.length > 0 ? n('ExpressionList', stmt.with.map(cteNode)) : null;
  const isDistributedWith = !!(stmt as Record<string, unknown>).distributedWith;

  if (cteNodes && !isDistributedWith) {
    children.push(cteNodes);
  }

  children.push(n('ExpressionList', stmt.select.map(exprNode)));

  if (stmt.from) children.push(fromExprNode(stmt.from));
  if (stmt.prewhere) children.push(exprNode(stmt.prewhere));
  if (stmt.where) children.push(exprNode(stmt.where));
  if (stmt.groupBy) {
    if (stmt.groupBy.kind === 'groupingSets') {
      children.push(
        n(
          'ExpressionList',
          stmt.groupBy.sets.map((set) => n('ExpressionList', set.map(exprNode))),
        ),
      );
    } else if (stmt.groupBy.kind === 'expressions') {
      // Unwrap ROLLUP/CUBE function calls — their args are used directly as group-by items
      const flatGroupBy = stmt.groupBy.items.flatMap((item) => {
        if (
          item.kind === 'functionCall' &&
          (item.name.toUpperCase() === 'ROLLUP' || item.name.toUpperCase() === 'CUBE')
        ) {
          return item.args;
        }
        return [item];
      });
      children.push(n('ExpressionList', flatGroupBy.map(exprNode)));
    }
  }
  if (stmt.having) children.push(exprNode(stmt.having));
  // WINDOW clause comes before ORDER BY in ClickHouse's explain output
  if (stmt.windows && stmt.windows.length > 0) {
    children.push(
      n(
        'ExpressionList',
        stmt.windows.map(() => n('WindowListElement')),
      ),
    );
  }
  if (stmt.qualify) children.push(exprNode(stmt.qualify));
  let settingsPushed = false;
  if (stmt.orderBy && stmt.orderBy.length > 0) {
    children.push(n('ExpressionList', stmt.orderBy.map(orderByNode)));
    // INTERPOLATE clause (attached to the last WITH FILL item)
    const interpItem = stmt.orderBy.find((item) => item.interpolate !== undefined);
    if (interpItem && interpItem.interpolate !== undefined) {
      // SETTINGS comes before INTERPOLATE in ClickHouse's explain output
      if (stmt.settings && stmt.settings.length > 0) {
        children.push(n('Set'));
        settingsPushed = true;
      }
      const interpNodes = interpItem.interpolate.map((it) => {
        // When no explicit expr, ClickHouse still shows the column identifier as a child
        const children: ExplainNode[] = it.expr ? [exprNode(it.expr)] : [n(`Identifier ${it.col}`)];
        return n(`InterpolateElement (column ${it.col})`, children);
      });
      children.push(n('ExpressionList', interpNodes));
    }
  }
  // LIMIT BY: optional offset, then count, then by-expressions
  if (stmt.limitBy) {
    if (stmt.limitBy.offset) children.push(exprNode(stmt.limitBy.offset));
    children.push(exprNode(stmt.limitBy.count));
    children.push(n('ExpressionList', stmt.limitBy.by.map(exprNode)));
  }
  if (stmt.limit) {
    if (stmt.limit.commaSyntax) {
      children.push(exprNode(stmt.limit.count));
      if (stmt.offset) children.push(exprNode(stmt.offset));
    } else {
      if (stmt.offset) children.push(exprNode(stmt.offset));
      children.push(exprNode(stmt.limit.count));
    }
  } else if (stmt.offset) {
    children.push(exprNode(stmt.offset));
  }
  // DISTINCT ON adds a flag (Literal UInt64_1) and the ON columns after ORDER BY/LIMIT
  if (stmt.distinct && stmt.distinct.kind === 'distinctOn' && stmt.distinct.on.length > 0) {
    children.push(n('Literal UInt64_1'));
    children.push(n('ExpressionList', stmt.distinct.on.map(exprNode)));
  }
  if (!settingsPushed && stmt.settings && stmt.settings.length > 0) {
    children.push(n('Set'));
  }

  // Distributed CTEs go after all other children
  if (cteNodes && isDistributedWith) {
    children.push(cteNodes);
  }

  return n('SelectQuery', children);
}

// Build the ExplainQuery node for an EXPLAIN statement (used when EXPLAIN is at top level)
function explainStmtNode(stmt: ExplainStatement): ExplainNode {
  const type = stmt.explainType ? stmt.explainType.toLowerCase().replace(' ', '_') : 'ast';
  const children: ExplainNode[] = [];
  if (stmt.query) children.push(stmtNode(stmt.query));
  return n(`ExplainQuery ${type}`, children);
}

// Format the EXPLAIN type as the first literal argument to viewExplain.
// PLAN and no-type both map to 'EXPLAIN'; other types map to 'EXPLAIN <TYPE>'.
function explainViewTypeLabel(explainType?: string): string {
  if (!explainType || explainType === 'PLAN') return 'EXPLAIN';
  return `EXPLAIN ${explainType}`;
}

// Format a setting item value as a plain string (for use inside viewExplain Literal)
function formatExplainSettingValue(value: Expression): string {
  if (value.kind === 'literal') {
    if (value.type === 'UInt64') return normalizeUInt(value.value);
    if (value.type === 'Int64') return value.value;
    if (value.type === 'Float64') return normalizeFloat(value.value);
    if (value.type === 'String') return `'${value.value}'`;
    return value.value;
  }
  return '';
}

// Format EXPLAIN settings as the second literal argument to viewExplain (e.g. 'actions = 1')
function explainViewSettingsLabel(settings?: SettingItem[]): string {
  if (!settings || settings.length === 0) return '';
  return settings.map((s) => `${s.name} = ${formatExplainSettingValue(s.value)}`).join(', ');
}

// Build viewExplain SelectWithUnionQuery for an EXPLAIN inside a subquery expression.
function viewExplainSubqueryNode(stmt: ExplainStatement): ExplainNode {
  const typeLabel = explainViewTypeLabel(stmt.explainType);
  const settingsLabel = explainViewSettingsLabel(stmt.settings);
  const innerQuery = stmt.query;
  const exprListChildren: ExplainNode[] = [
    n(`Literal '${typeLabel}'`),
    n(`Literal '${settingsLabel}'`),
  ];
  if (innerQuery) {
    exprListChildren.push(n('Subquery', [stmtNode(innerQuery)]));
  }
  const funcNode = n('Function viewExplain', [n('ExpressionList', exprListChildren)]);
  const innerSelectQuery = n('SelectQuery', [
    n('ExpressionList', [n('Asterisk')]),
    n('TablesInSelectQuery', [n('TablesInSelectQueryElement', [n('TableExpression', [funcNode])])]),
  ]);
  return n('SelectWithUnionQuery', [n('ExpressionList', [innerSelectQuery])]);
}

// Build a Function viewExplain node for an EXPLAIN inside a FROM subquery.
// ClickHouse wraps viewExplain in a synthetic SELECT * FROM viewExplain(...) subquery.
function viewExplainNode(stmt: ExplainStatement, aliasStr: string): ExplainNode {
  const typeLabel = explainViewTypeLabel(stmt.explainType);
  const settingsLabel = explainViewSettingsLabel(stmt.settings);
  const innerQuery = stmt.query;
  const exprListChildren: ExplainNode[] = [
    n(`Literal '${typeLabel}'`),
    n(`Literal '${settingsLabel}'`),
  ];
  if (innerQuery) {
    exprListChildren.push(n('Subquery', [stmtNode(innerQuery)]));
  }
  const funcNode = n('Function viewExplain', [n('ExpressionList', exprListChildren)]);
  const innerSelectQuery = n('SelectQuery', [
    n('ExpressionList', [n('Asterisk')]),
    n('TablesInSelectQuery', [n('TablesInSelectQueryElement', [n('TableExpression', [funcNode])])]),
  ]);
  return n('TableExpression', [
    n(`Subquery${aliasStr}`, [
      n('SelectWithUnionQuery', [n('ExpressionList', [innerSelectQuery])]),
    ]),
  ]);
}

// ── CREATE TABLE explain helpers ──────────────────────────────────────────────

// Convert a structured DataType to an EXPLAIN node tree
function dataTypeToExplainNode(dt: import('./ast').DataType): ExplainNode {
  const baseName = dt.name;

  // Enum types with parsed values
  if (
    /^Enum(?:8|16)?$/i.test(baseName) &&
    dt.args &&
    dt.args.length === 1 &&
    dt.args[0].kind === 'enumValues'
  ) {
    const enumVals = dt.args[0].values;
    // If ALL values have explicit assignments, use EnumDataType (no children)
    const allExplicit = enumVals.every(
      (v) => v.value !== undefined && v.value !== null && v.name !== null,
    );
    if (allExplicit) {
      return n(`EnumDataType ${baseName}`);
    }
    // Otherwise show DataType with ExpressionList children
    const children = enumVals.map((v) => {
      if (v.name === null) return n('Literal NULL');
      if (v.value !== undefined && v.value !== null) {
        const numVal = v.value;
        const numLabel = numVal.startsWith('-') ? `Int64_${numVal}` : `UInt64_${numVal}`;
        return n('Function equals', [
          n('ExpressionList', [
            n(`Literal '${escapeStringValue(v.name)}'`),
            n(`Literal ${numLabel}`),
          ]),
        ]);
      }
      return n(`Literal '${escapeStringValue(v.name)}'`);
    });
    return n(`DataType ${baseName}`, [n('ExpressionList', children)]);
  }
  // Enum without args: EnumDataType
  if (/^Enum(?:8|16)?$/i.test(baseName)) {
    return n(`EnumDataType ${baseName}`);
  }

  // MySQL integer types strip their display width: TINYINT(8) → DataType TINYINT
  const intTypePattern =
    /^(TINYINT|SMALLINT|INT|INTEGER|BIGINT|MEDIUMINT)(\s+(SIGNED|UNSIGNED))?$/i;
  if (intTypePattern.test(baseName) && dt.args) {
    return n(`DataType ${baseName}`);
  }

  // No args
  if (!dt.args) {
    return n(`DataType ${baseName}`);
  }
  // Empty args: show ExpressionList child (DateTime(), Variant(), Tuple(), etc.)
  if (dt.args.length === 0) {
    return n(`DataType ${baseName}`, [n('ExpressionList')]);
  }

  // Tuple type uses TupleDataType; named fields are stripped (only types shown)
  if (/^Tuple$/i.test(baseName)) {
    if (dt.args.length === 0) {
      return n(`DataType ${baseName}`, [n('ExpressionList')]);
    }
    const children = dt.args.map((arg) => {
      if (arg.kind === 'namedField') return dataTypeToExplainNode(arg.type);
      if (arg.kind === 'type') return dataTypeToExplainNode(arg.type);
      return dataTypeArgToExplainNode(arg, baseName, 0);
    });
    return n(`TupleDataType ${baseName}`, [n('ExpressionList', children)]);
  }

  // Nested type: children are NameTypePair
  if (/^Nested$/i.test(baseName)) {
    const children = dt.args.map((arg) => {
      if (arg.kind === 'namedField') {
        return n(`NameTypePair ${arg.name}`, [dataTypeToExplainNode(arg.type)]);
      }
      if (arg.kind === 'type') return dataTypeToExplainNode(arg.type);
      return dataTypeArgToExplainNode(arg, baseName, 0);
    });
    return n(`DataType ${baseName}`, [n('ExpressionList', children)]);
  }

  // JSON type: args are wrapped in ASTObjectTypeArgument / ObjectTypedPath
  if (/^JSON$/i.test(baseName)) {
    const children = dt.args.map((arg) => jsonTypeArgToExplainNode(arg));
    return n(`DataType ${baseName}`, [n('ExpressionList', children)]);
  }

  // Generic parameterized type (Array, Nullable, Map, AggregateFunction, etc.)
  const children = dt.args.map((arg, idx) => dataTypeArgToExplainNode(arg, baseName, idx));
  return n(`DataType ${baseName}`, [n('ExpressionList', children)]);
}

// Convert a single DataTypeArg to an EXPLAIN node
function dataTypeArgToExplainNode(
  arg: import('./ast').DataTypeArg,
  parentName: string,
  index: number,
): ExplainNode {
  switch (arg.kind) {
    case 'type':
      // AggregateFunction: first arg is a function name (Identifier)
      if (/^(?:Aggregate|SimpleAggregate)Function$/i.test(parentName) && index === 0) {
        // Render the function name as Identifier, including params if present
        const t = arg.type;
        if (t.args && t.args.length > 0) {
          // e.g. quantile(0.5) → Function quantile(...)
          const argNodes = t.args.map((a, i) => dataTypeArgToExplainNode(a, t.name, i));
          return n(`Function ${t.name}`, [n('ExpressionList', argNodes)]);
        }
        return n(`Identifier ${t.name}`);
      }
      return dataTypeToExplainNode(arg.type);
    case 'namedField':
      return n(`ColumnDeclaration ${arg.name}`, [dataTypeToExplainNode(arg.type)]);
    case 'literal': {
      const v = arg.value;
      if (/^\d+$/.test(v)) return n(`Literal UInt64_${v}`);
      if (/^-?\d+$/.test(v)) return n(`Literal Int64_${v}`);
      if (/^-?\d*\.\d+$/.test(v) || /^\d+\.\d*$/.test(v))
        return n(`Literal Float64_${normalizeFloat(v)}`);
      if (v.startsWith("'")) return n(`Literal ${v}`);
      // Setting-like: "max_types = 3" → not currently output as literal in CH
      return n(`Literal ${v}`);
    }
    case 'enumValues':
      return n(`EnumDataType ${parentName}`);
    case 'setting':
      return n('Function equals', [
        n('ExpressionList', [n(`Identifier ${arg.name}`), exprNode(arg.value)]),
      ]);
  }
}

// Convert a JSON type argument to an ASTObjectTypeArgument explain node
function jsonTypeArgToExplainNode(arg: import('./ast').DataTypeArg): ExplainNode {
  switch (arg.kind) {
    case 'namedField':
      // JSON(a String) → ASTObjectTypeArgument / ObjectTypedPath a / DataType String
      return n('ASTObjectTypeArgument', [
        n(`ObjectTypedPath ${arg.name}`, [dataTypeToExplainNode(arg.type)]),
      ]);
    case 'setting':
      // JSON(max_dynamic_paths=2) → ASTObjectTypeArgument / Function equals(...)
      return n('ASTObjectTypeArgument', [
        n('Function equals', [
          n('ExpressionList', [n(`Identifier ${arg.name}`), exprNode(arg.value)]),
        ]),
      ]);
    case 'literal': {
      // SKIP REGEXP 'pattern' → ASTObjectTypeArgument / Literal 'pattern'
      const skipRegexpMatch = arg.value.match(/^SKIP REGEXP\s+(.+)$/);
      if (skipRegexpMatch) {
        return n('ASTObjectTypeArgument', [n(`Literal ${skipRegexpMatch[1]}`)]);
      }
      // SKIP path → ASTObjectTypeArgument / Identifier path (strip backticks from each segment)
      const skipMatch = arg.value.match(/^SKIP\s+(.+)$/);
      if (skipMatch) {
        const path = skipMatch[1].replace(/`([^`]*)`/g, '$1');
        return n('ASTObjectTypeArgument', [n(`Identifier ${path}`)]);
      }
      return n('ASTObjectTypeArgument', [n(`Literal ${arg.value}`)]);
    }
    case 'type':
      return n('ASTObjectTypeArgument', [dataTypeToExplainNode(arg.type)]);
    case 'enumValues':
      return n('ASTObjectTypeArgument');
  }
}

// Convert structured CodecItem[] to EXPLAIN nodes
function codecToExplainNodes(items: import('./ast').CodecItem[]): ExplainNode {
  const children = items.map((item) => {
    if (item.args !== undefined && item.args.length > 0) {
      return n(`Function ${item.name}`, [n('ExpressionList', item.args.map(exprNode))]);
    }
    if (item.args !== undefined) {
      return n(`Function ${item.name}`, [n('ExpressionList')]);
    }
    return n(`Function ${item.name}`);
  });
  return n('Function CODEC', [n('ExpressionList', children)]);
}

// Convert structured IndexType to EXPLAIN node
function indexTypeToExplainNode(it: import('./ast').IndexType): ExplainNode {
  if (it.args !== undefined && it.args.length > 0) {
    return n(`Function ${it.name}`, [n('ExpressionList', it.args.map(exprNode))]);
  }
  if (it.args !== undefined) {
    return n(`Function ${it.name}`, [n('ExpressionList')]);
  }
  return n(`Function ${it.name}`, [n('ExpressionList')]);
}

// Build ColumnDeclaration explain node
function columnDeclNode(col: ColumnDef): ExplainNode {
  const children: ExplainNode[] = [];

  // DataType (if specified)
  if (col.type) {
    children.push(dataTypeToExplainNode(col.type));
  }

  // Collation
  if (col.collate) {
    children.push(n('Collation'));
  }

  // EPHEMERAL without default value: show defaultValueOfTypeName placeholder
  if (col.defaultKind === 'EPHEMERAL' && !col.defaultExpr) {
    children.push(n('Function defaultValueOfTypeName'));
  }

  // Default/Materialized/Alias/Ephemeral expression
  if (col.defaultExpr) {
    children.push(exprNode(col.defaultExpr));
  }

  // CODEC
  if (col.codec) {
    children.push(codecToExplainNodes(col.codec));
  }

  // Column SETTINGS (before STATISTICS and TTL)
  if (col.columnSettings) {
    children.push(n('Set'));
  }

  // STATISTICS — rendered as Function STATISTICS (not CODEC)
  if (col.statistics) {
    const statChildren = col.statistics.map((item) => {
      if (item.args !== undefined && item.args.length > 0) {
        return n(`Function ${item.name}`, [n('ExpressionList', item.args.map(exprNode))]);
      }
      return n(`Function ${item.name}`);
    });
    children.push(n('Function STATISTICS', [n('ExpressionList', statChildren)]));
  }

  // Column TTL
  if (col.ttl) {
    children.push(exprNode(col.ttl));
  }

  // Column comment
  if (col.comment) {
    children.push(n(`Literal '${col.comment.replace(/'/g, "\\'")}'`));
  }

  return n(`ColumnDeclaration ${col.name}`, children);
}

// Build Storage definition node
function storageDefNode(
  stmt: CreateTableStatement | CreateMaterializedViewStatement,
): ExplainNode | null {
  const children: ExplainNode[] = [];

  // Engine
  if (stmt.engine) {
    if (stmt.engine.args !== undefined) {
      if (stmt.engine.args.length === 0) {
        children.push(n(`Function ${stmt.engine.name}`, [n('ExpressionList')]));
      } else {
        children.push(
          n(`Function ${stmt.engine.name}`, [n('ExpressionList', stmt.engine.args.map(exprNode))]),
        );
      }
    } else {
      children.push(n(`Function ${stmt.engine.name}`));
    }
  }

  // SETTINGS before ORDER BY (when SETTINGS was specified before ORDER BY in the DDL)
  const settingsAfterOrderBy = !!(stmt as Record<string, unknown>).settingsAfterOrderBy;
  if (stmt.settings && !settingsAfterOrderBy) {
    children.push(n('Set'));
  }

  // PARTITION BY
  if (stmt.partitionBy) {
    children.push(exprNode(stmt.partitionBy));
  }

  // PRIMARY KEY
  const pk =
    stmt.primaryKey || (isCreateTableStatement(stmt) ? stmt.primaryKeyInSchema : undefined);
  const storagePkFromColumns =
    isCreateTableStatement(stmt) &&
    stmt.tableElements?.some((el) => el.kind === 'columnDef' && el.primaryKey);
  // PK goes after ORDER BY when from column-level modifiers or from schema PRIMARY KEY
  const hasSchemaPk = isCreateTableStatement(stmt) && !!stmt.primaryKeyInSchema;
  const pkAfterOrderBy = storagePkFromColumns || hasSchemaPk;
  // Render PK before ORDER BY (when not from column modifiers)
  if (pk && !pkAfterOrderBy) {
    if (pk.length === 1) {
      children.push(exprNode(pk[0]));
    } else {
      children.push(n('Function tuple', [n('ExpressionList', pk.map(exprNode))]));
    }
  }

  // ORDER BY
  if (stmt.orderBy) {
    const hasDesc = stmt.orderBy.some((o) => o.dir === 'DESC');
    const isParenthesized = !!(stmt.orderBy as unknown as { _parenthesized?: boolean })
      ._parenthesized;
    if (hasDesc && isParenthesized) {
      // Parenthesized ORDER BY with any DESC → Function tuple (no children)
      children.push(n('Function tuple'));
    } else if (stmt.orderBy.length === 1) {
      const item = stmt.orderBy[0];
      if (item.dir === 'DESC') {
        children.push(n('StorageOrderByElement', [exprNode(item.expr)]));
      } else {
        children.push(exprNode(item.expr));
      }
    } else if (hasDesc) {
      // Non-parenthesized multi-item with DESC → Function tuple (no children)
      children.push(n('Function tuple'));
    } else {
      children.push(
        n('Function tuple', [
          n(
            'ExpressionList',
            stmt.orderBy.map((o) => exprNode(o.expr)),
          ),
        ]),
      );
    }
  }

  // PK after ORDER BY (from column modifiers or explicit PRIMARY KEY after ORDER BY)
  if (pk && pkAfterOrderBy) {
    if (storagePkFromColumns) {
      children.push(n('Function tuple', [n('ExpressionList', pk.map(exprNode))]));
    } else if (pk.length === 1) {
      children.push(exprNode(pk[0]));
    } else {
      children.push(n('Function tuple', [n('ExpressionList', pk.map(exprNode))]));
    }
  }

  // SAMPLE BY
  if (stmt.sampleBy) {
    children.push(exprNode(stmt.sampleBy));
  }

  // TTL
  if (stmt.ttl) {
    const ttlElements = stmt.ttl.map((item) => {
      const ttlChildren = [exprNode(item.expr)];
      if (item.where) ttlChildren.push(exprNode(item.where));
      return n('TTLElement', ttlChildren);
    });
    children.push(n('ExpressionList', ttlElements));
  }

  // SETTINGS after ORDER BY (when SETTINGS was specified after ORDER BY in the DDL)
  if (stmt.settings && settingsAfterOrderBy) {
    children.push(n('Set'));
  }

  if (children.length === 0) return null;
  return n('Storage definition', children);
}

// Build CreateIndexQuery explain node
// Format: CreateIndexQuery  tablename (children 3)
//   Identifier indexName
//   Index (children 1-2)
//     expr
//     [Function typeName ...]
//   Identifier tableName
function createIndexQueryNode(stmt: CreateIndexStatement): ExplainNode {
  // Note: double space between CreateIndexQuery and table name (ClickHouse quirk)
  const label = `CreateIndexQuery  ${stmt.table.table}`;

  const children: ExplainNode[] = [];

  // Index name
  children.push(n(`Identifier ${stmt.indexName}`));

  // Index node
  const indexChildren: ExplainNode[] = [];
  if (stmt.indexExpr) {
    // For multi-column indexes, ClickHouse EXPLAIN shows Function tuple with empty ExpressionList
    if (stmt.indexExpr.kind === 'functionCall' && stmt.indexExpr.name === 'tuple') {
      indexChildren.push(n('Function tuple', [n('ExpressionList')]));
    } else {
      indexChildren.push(exprNode(stmt.indexExpr));
    }
  }
  if (stmt.indexType) {
    indexChildren.push(indexTypeToExplainNode(stmt.indexType));
  }
  children.push(n('Index', indexChildren));

  // Table name
  children.push(n(`Identifier ${stmt.table.table}`));

  return n(label, children);
}

// Build CreateQuery explain node for DICTIONARY
function createDictionaryQueryNode(stmt: CreateDictionaryStatement): ExplainNode {
  const children: ExplainNode[] = [];

  // Label
  let label = 'CreateQuery';
  if (stmt.table.database) {
    label += ` ${stmt.table.database} ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.database}`));
    children.push(n(`Identifier ${stmt.table.table}`));
  } else {
    label += ` ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.table}`));
  }

  // Dictionary attributes
  if (stmt.dictAttrs && stmt.dictAttrs.length > 0) {
    const attrNodes = stmt.dictAttrs.map((attr) => {
      const attrChildren: ExplainNode[] = [dataTypeToExplainNode(attr.type)];
      if (attr.defaultValue) attrChildren.push(exprNode(attr.defaultValue));
      if (attr.expression) attrChildren.push(exprNode(attr.expression));
      return n(`DictionaryAttributeDeclaration ${attr.name}`, attrChildren);
    });
    children.push(n('ExpressionList', attrNodes));
  }

  // Dictionary definition
  if (stmt.dictDef) {
    const defChildren: ExplainNode[] = [];
    const dd = stmt.dictDef;

    // PRIMARY KEY — flatten tuple to flat list
    if (dd.primaryKey) {
      const pkExprs: Expression[] = [];
      for (const pk of dd.primaryKey) {
        if (pk.kind === 'tupleLiteral') {
          pkExprs.push(...pk.elements);
        } else {
          pkExprs.push(pk);
        }
      }
      defChildren.push(n('ExpressionList', pkExprs.map(exprNode)));
    }

    // SOURCE
    if (dd.source) {
      const pairNodes = dd.source.pairs.map((p) => {
        if (Array.isArray(p.value)) {
          // Structure pairs: render type as Identifier (simple) or Function (parameterized)
          const structPairs = p.value.map(
            (sp: { name: string; type: import('./ast').DataType }) => {
              const dt = sp.type;
              if (dt.args && dt.args.length > 0) {
                const argNodes = dt.args.map((a, i) => dataTypeArgToExplainNode(a, dt.name, i));
                return n('pair', [n(`Function ${dt.name}`, [n('ExpressionList', argNodes)])]);
              }
              return n('pair', [n(`Identifier ${dt.name}`)]);
            },
          );
          return n('pair', [n('ExpressionList', structPairs)]);
        }
        return n('pair', [exprNode(p.value)]);
      });
      // Double space before source name (ClickHouse quirk)
      defChildren.push(
        n(`FunctionWithKeyValueArguments  ${dd.source.name}`, [n('ExpressionList', pairNodes)]),
      );
    }

    // LIFETIME
    if (dd.lifetime) {
      defChildren.push(n('Dictionary lifetime'));
    }

    // LAYOUT
    if (dd.layout) {
      const layoutPairs = dd.layout.pairs.map((p) => n('pair', [exprNode(p.value)]));
      defChildren.push(n('Dictionary layout', [n('ExpressionList', layoutPairs)]));
    }

    // RANGE — no children in EXPLAIN
    if (dd.range) {
      defChildren.push(n('Dictionary range'));
    }

    // SETTINGS
    if (dd.settings) {
      defChildren.push(n('Dictionary settings'));
    }

    children.push(n('Dictionary definition', defChildren));
  }

  // Dictionary comment
  if (stmt.dictDef?.comment) {
    children.push(n(`Literal '${stmt.dictDef.comment.replace(/'/g, "\\'")}'`));
  }

  return n(label, children);
}

function createWorkloadQueryNode(stmt: CreateWorkloadStatement): ExplainNode {
  const children: ExplainNode[] = [n(`Identifier ${stmt.name}`)];
  if (stmt.parentWorkload) {
    children.push(n(`Identifier ${stmt.parentWorkload}`));
  }
  return n(`CreateWorkloadQuery ${stmt.name}`, children);
}

function createFunctionQueryNode(stmt: CreateFunctionStatement): ExplainNode {
  const children: ExplainNode[] = [n(`Identifier ${stmt.name}`)];
  children.push(exprNode(stmt.functionExpr));
  return n(`CreateFunctionQuery ${stmt.name}`, children);
}

function createDatabaseQueryNode(stmt: CreateDatabaseStatement): ExplainNode {
  const children: ExplainNode[] = [n(`Identifier ${stmt.name}`)];
  // Build storage definition if we have engine, ORDER BY, or settings
  const storageChildren: ExplainNode[] = [];
  if (stmt.engine) {
    if (stmt.engine.args !== undefined) {
      if (stmt.engine.args.length === 0) {
        storageChildren.push(n(`Function ${stmt.engine.name}`, [n('ExpressionList')]));
      } else {
        storageChildren.push(
          n(`Function ${stmt.engine.name}`, [n('ExpressionList', stmt.engine.args.map(exprNode))]),
        );
      }
    } else {
      storageChildren.push(n(`Function ${stmt.engine.name}`));
    }
  }
  if (stmt.orderBy) {
    if (stmt.orderBy.length === 1 && !stmt.orderBy[0].dir) {
      storageChildren.push(exprNode(stmt.orderBy[0].expr));
    }
  }
  if (stmt.settings) {
    storageChildren.push(n('Set'));
  }
  if (storageChildren.length > 0) {
    children.push(n('Storage definition', storageChildren));
  }
  // Note: trailing space after dbname (ClickHouse quirk)
  return n(`CreateQuery ${stmt.name} `, children);
}

function createViewQueryNode(stmt: CreateViewStatement): ExplainNode {
  const children: ExplainNode[] = [];
  let label = 'CreateQuery';
  if (stmt.table.database) {
    label += ` ${stmt.table.database} ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.database}`));
    children.push(n(`Identifier ${stmt.table.table}`));
  } else {
    label += ` ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.table}`));
  }
  if (stmt.tableElements && stmt.tableElements.length > 0) {
    const columns = stmt.tableElements.filter((el) => el.kind === 'columnDef');
    // If all columns are bare names (no type), render as ExpressionList of Identifiers (view column aliases)
    const allBareNames = columns.every((c) => !c.type);
    if (allBareNames && columns.length > 0) {
      children.push(
        n(
          'ExpressionList',
          columns.map((c) => n(`Identifier ${c.name}`)),
        ),
      );
    } else if (columns.length > 0) {
      children.push(n('Columns definition', [n('ExpressionList', columns.map(columnDeclNode))]));
    }
  }
  if (stmt.asQuery) children.push(stmtNode(stmt.asQuery));
  return n(label, children);
}

function createMaterializedViewQueryNode(stmt: CreateMaterializedViewStatement): ExplainNode {
  const children: ExplainNode[] = [];
  let label = 'CreateQuery';
  if (stmt.table.database) {
    label += ` ${stmt.table.database} ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.database}`));
    children.push(n(`Identifier ${stmt.table.table}`));
  } else {
    label += ` ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.table}`));
  }
  if (stmt.tableElements && stmt.tableElements.length > 0) {
    const colsDefChildren: ExplainNode[] = [];
    const columns = stmt.tableElements.filter((el) => el.kind === 'columnDef').map(columnDeclNode);
    if (columns.length > 0) colsDefChildren.push(n('ExpressionList', columns));
    const indexes = stmt.tableElements
      .filter((el) => el.kind === 'indexDef')
      .map((el) => {
        const idxChildren: ExplainNode[] = [exprNode(el.expr)];
        idxChildren.push(indexTypeToExplainNode(el.indexType));
        return n('Index', idxChildren);
      });
    if (indexes.length > 0) colsDefChildren.push(n('ExpressionList', indexes));
    // Projections in MV
    const projections: ExplainNode[] = [];
    for (const el of stmt.tableElements) {
      if (el.kind === 'projectionDef') {
        const projChildren: ExplainNode[] = [];
        if (el.query) {
          const pqChildren: ExplainNode[] = [];
          if (el.query.select) pqChildren.push(n('ExpressionList', el.query.select.map(exprNode)));
          if (el.query.groupBy && el.query.groupBy.kind === 'expressions') {
            pqChildren.push(n('ExpressionList', el.query.groupBy.items.map(exprNode)));
          }
          if (el.query.orderBy && el.query.orderBy.length > 0) {
            if (el.query.orderBy.length === 1) pqChildren.push(exprNode(el.query.orderBy[0].expr));
            else
              pqChildren.push(
                n('Function tuple', [
                  n(
                    'ExpressionList',
                    el.query.orderBy.map((o) => exprNode(o.expr)),
                  ),
                ]),
              );
          }
          projChildren.push(n('ProjectionSelectQuery', pqChildren));
        }
        projections.push(n('Projection', projChildren));
      }
    }
    if (projections.length > 0) colsDefChildren.push(n('ExpressionList', projections));
    // Schema-level PRIMARY KEY in MV
    const mvPkInSchema = (stmt as Record<string, unknown>).primaryKeyInSchema as
      | Expression[]
      | undefined;
    if (mvPkInSchema) {
      if (mvPkInSchema.length === 1) {
        colsDefChildren.push(exprNode(mvPkInSchema[0]));
      } else if (mvPkInSchema.length > 1) {
        colsDefChildren.push(
          n('Function tuple', [n('ExpressionList', mvPkInSchema.map(exprNode))]),
        );
      }
    }
    // Column-level PRIMARY KEY in MV
    const mvColPks = stmt.tableElements
      ?.filter((el): el is ColumnDef => el.kind === 'columnDef' && !!el.primaryKey)
      .map((el) => n(`Identifier ${el.name}`));
    if (mvColPks && mvColPks.length > 0 && !mvPkInSchema) {
      colsDefChildren.push(n('Function tuple', [n('ExpressionList', mvColPks)]));
    }
    if (colsDefChildren.length > 0) {
      children.push(n('Columns definition', colsDefChildren));
    }
  }
  // Refresh strategy
  if ((stmt as Record<string, unknown>).refresh) {
    children.push(n('Refresh strategy definition', [n('TimeInterval')]));
  }
  if (stmt.asQuery) children.push(stmtNode(stmt.asQuery));
  // ViewTargets
  if (stmt.toTable) {
    children.push(n('ViewTargets'));
  } else if (
    stmt.engine ||
    stmt.orderBy ||
    stmt.primaryKey ||
    (stmt as Record<string, unknown>).primaryKeyInSchema ||
    stmt.tableElements?.some((el) => el.kind === 'columnDef' && el.primaryKey)
  ) {
    // When MV has PK but no ORDER BY, replicate PK as ORDER BY in ViewTargets storage
    const colPkExprs = stmt.tableElements
      ?.filter((el): el is ColumnDef => el.kind === 'columnDef' && !!el.primaryKey)
      .map((el) => ({ kind: 'columnRef' as const, parts: [el.name] }));
    const mvPk = (stmt.primaryKey ||
      (stmt as Record<string, unknown>).primaryKeyInSchema ||
      (colPkExprs && colPkExprs.length > 0 ? colPkExprs : undefined)) as Expression[] | undefined;
    let innerStorage: ExplainNode | null;
    const isColPk = colPkExprs && colPkExprs.length > 0;
    if (mvPk && !stmt.orderBy) {
      // PK used as implicit ORDER BY — suppress normal PK rendering in storage
      const stmtNoPk = { ...stmt, primaryKey: undefined } as typeof stmt;
      innerStorage = storageDefNode(stmtNoPk);
      if (innerStorage) {
        if (isColPk) {
          // Column-modifier PK: always tuple-wrapped
          innerStorage.children.push(
            n('Function tuple', [n('ExpressionList', mvPk.map(exprNode))]),
          );
        } else {
          // Schema PK: bare expression for single, tuple for multiple
          if (mvPk.length === 1) {
            innerStorage.children.push(exprNode(mvPk[0]));
          } else {
            innerStorage.children.push(
              n('Function tuple', [n('ExpressionList', mvPk.map(exprNode))]),
            );
          }
        }
      }
    } else {
      innerStorage = storageDefNode(stmt);
    }
    if (innerStorage) {
      children.push(n('ViewTargets', [innerStorage]));
    } else {
      children.push(n('ViewTargets'));
    }
  }
  // FORMAT clause
  if ((stmt as Record<string, unknown>).format) {
    children.push(n(`Identifier ${(stmt as Record<string, unknown>).format}`));
  }
  return n(label, children);
}

// Build the full CreateQuery explain node for CREATE TABLE
function createTableQueryNode(stmt: CreateTableStatement): ExplainNode {
  const children: ExplainNode[] = [];

  let label = 'CreateQuery';
  if (stmt.table.database) {
    label += ` ${stmt.table.database} ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.database}`));
    children.push(n(`Identifier ${stmt.table.table}`));
  } else {
    label += ` ${stmt.table.table}`;
    children.push(n(`Identifier ${stmt.table.table}`));
  }

  // Columns definition
  if (stmt.tableElements && stmt.tableElements.length > 0) {
    const colsDefChildren: ExplainNode[] = [];

    // Separate columns, constraints, indexes, and projections
    const columns: ExplainNode[] = [];
    const constraints: ExplainNode[] = [];
    const indexes: ExplainNode[] = [];
    const projections: ExplainNode[] = [];

    for (const el of stmt.tableElements) {
      switch (el.kind) {
        case 'columnDef':
          columns.push(columnDeclNode(el));
          break;
        case 'constraintDef':
          constraints.push(n('Constraint', [exprNode(el.expr)]));
          break;
        case 'indexDef': {
          const idxChildren: ExplainNode[] = [exprNode(el.expr)];
          idxChildren.push(indexTypeToExplainNode(el.indexType));
          indexes.push(n('Index', idxChildren));
          break;
        }
        case 'projectionDef': {
          // PROJECTION ... INDEX col TYPE name format
          if (el.projectionIndex) {
            const pi = el.projectionIndex;
            const piChildren: ExplainNode[] = [
              n(`Identifier ${pi.column}`),
              n(`Function ${pi.typeName}`, [n('ExpressionList')]),
            ];
            projections.push(n('Projection', piChildren));
            break;
          }
          const projChildren: ExplainNode[] = [];
          const projQuery = el.query!;
          const pqChildren: ExplainNode[] = [];
          // WITH CTEs as aliased expressions (separate ExpressionList)
          if (projQuery.with && projQuery.with.length > 0) {
            const cteItems = projQuery.with
              .filter((cte): cte is typeof cte & { kind: 'cteExpr' } => cte.kind === 'cteExpr')
              .map((cte) => exprNode({ kind: 'alias', expr: cte.expr, alias: cte.name }));
            if (cteItems.length > 0) {
              pqChildren.push(n('ExpressionList', cteItems));
            }
          }
          // SELECT list
          if (projQuery.select) {
            pqChildren.push(n('ExpressionList', projQuery.select.map(exprNode)));
          }
          // GROUP BY in projection (comes before ORDER BY)
          if (projQuery.groupBy && projQuery.groupBy.kind === 'expressions') {
            pqChildren.push(n('ExpressionList', projQuery.groupBy.items.map(exprNode)));
          }
          // ORDER BY in projection
          if (projQuery.orderBy && projQuery.orderBy.length > 0) {
            if (projQuery.orderBy.length === 1) {
              pqChildren.push(exprNode(projQuery.orderBy[0].expr));
            } else {
              pqChildren.push(
                n('Function tuple', [
                  n(
                    'ExpressionList',
                    projQuery.orderBy.map((o) => exprNode(o.expr)),
                  ),
                ]),
              );
            }
          }
          projChildren.push(n('ProjectionSelectQuery', pqChildren));
          // Projection SETTINGS
          if ((el as Record<string, unknown>).projectionSettings) {
            projChildren.push(n('Set'));
          }
          projections.push(n('Projection', projChildren));
          break;
        }
      }
    }

    // Columns are always first ExpressionList
    if (columns.length > 0) {
      colsDefChildren.push(n('ExpressionList', columns));
    }

    // Constraints, indexes, and projections go into separate ExpressionLists
    if (constraints.length > 0) {
      colsDefChildren.push(n('ExpressionList', constraints));
    }
    if (indexes.length > 0) {
      colsDefChildren.push(n('ExpressionList', indexes));
    }
    if (projections.length > 0) {
      colsDefChildren.push(n('ExpressionList', projections));
    }

    // Primary key in schema is a direct child of Columns definition
    // This includes both explicit PRIMARY KEY(...) elements and column-level PRIMARY KEY modifiers
    const pkFromColumns = stmt.tableElements?.some(
      (el) => el.kind === 'columnDef' && el.primaryKey,
    );
    const pkInColsDef =
      stmt.primaryKeyInSchema || (stmt.primaryKey && pkFromColumns ? stmt.primaryKey : undefined);
    if (pkInColsDef) {
      if (pkInColsDef.length === 1 && !pkFromColumns) {
        colsDefChildren.push(exprNode(pkInColsDef[0]));
      } else {
        colsDefChildren.push(n('Function tuple', [n('ExpressionList', pkInColsDef.map(exprNode))]));
      }
    }

    children.push(n('Columns definition', colsDefChildren));
  }

  // Storage definition
  const storageDef = storageDefNode(stmt);
  if (storageDef) {
    children.push(storageDef);
  }

  // AS SELECT query
  if (stmt.asQuery) {
    children.push(stmtNode(stmt.asQuery));
  }

  // AS table_function()
  if (stmt.asTableFunction) {
    const tf = stmt.asTableFunction;
    if (tf.args.length === 0) {
      children.push(n(`Function ${tf.name}`, [n('ExpressionList')]));
    } else {
      children.push(n(`Function ${tf.name}`, [n('ExpressionList', tf.args.map(exprNode))]));
    }
  }

  // Table COMMENT
  if (stmt.comment) {
    children.push(n(`Literal '${stmt.comment.replace(/'/g, "\\'")}'`));
  }

  // Query-level SETTINGS (second SETTINGS clause)
  if ((stmt as Record<string, unknown>).querySettings) {
    children.push(n('Set'));
  }

  // FORMAT clause
  if ((stmt as Record<string, unknown>).format) {
    children.push(n(`Identifier ${(stmt as Record<string, unknown>).format}`));
  }

  return n(label, children);
}

function parallelWithQueryNode(stmt: ParallelWithStatement): ExplainNode {
  const first = stmt.queries[0];
  let kindPrefix: string;
  let firstTable: string;
  if (first?.kind === 'insert') {
    kindPrefix = 'InsertQuery_';
    firstTable = '';
  } else {
    kindPrefix = 'CreateQuery';
    firstTable = first?.kind === 'createTable' ? first.table.table : '';
  }
  const label = `ParallelWithQuery ${stmt.queries.length} ${kindPrefix}_${firstTable}`;
  const children = stmt.queries.map((q) => stmtNode(q as Statement));
  return n(label, children);
}

// Check if a query statement (or any of its children in a union) has settings
function hasSelectSettings(query?: Statement): boolean {
  if (!query) return false;
  if (query.kind === 'select') return !!(query.settings && query.settings.length > 0);
  if (query.kind === 'union') return query.queries.some((q) => hasSelectSettings(q));
  return false;
}

function insertQueryNode(stmt: InsertStatement): ExplainNode {
  const children: ExplainNode[] = [];

  // First child: table identifier or function
  if (stmt.target.kind === 'table') {
    const t = stmt.target.table;
    if (t.database) {
      children.push(n(`Identifier ${t.database}`));
      children.push(n(`Identifier ${t.table}`));
    } else {
      children.push(n(`Identifier ${t.table}`));
    }
  } else {
    const func = stmt.target.func;
    const argsNodes = func.args.map(exprNode);
    children.push(n(`Function ${func.name}`, [n('ExpressionList', argsNodes)]));
  }

  // PARTITION BY expression
  if (stmt.partitionBy) {
    children.push(exprNode(stmt.partitionBy));
  }

  // Column list
  if (stmt.columns && stmt.columns.length > 0) {
    children.push(
      n(
        'ExpressionList',
        stmt.columns.map((c) => exprNode(c)),
      ),
    );
  }

  // SELECT query
  if (stmt.selectQuery) {
    children.push(stmtNode(stmt.selectQuery));
  }

  // Settings: InsertQuery gets a Set child if any settings exist (insert-level or select-level)
  const hasInsertSettings = stmt.insertSettings && stmt.insertSettings.length > 0;
  const hasQuerySettings = stmt.querySettings && stmt.querySettings.length > 0;
  // Check if the inner SELECT query has settings
  const selectHasSettings = hasSelectSettings(stmt.selectQuery);
  if (hasInsertSettings || hasQuerySettings || selectHasSettings) {
    children.push(n('Set'));
  }

  return n('InsertQuery  ', children);
}

// Build the top-level SelectWithUnionQuery node for a statement (SelectStatement or UnionStatement)
function stmtNode(stmt: Statement): ExplainNode {
  if (stmt.kind === 'parallelWith') return parallelWithQueryNode(stmt);
  if (stmt.kind === 'explain') return explainStmtNode(stmt);
  if (stmt.kind === 'transactionControl') return n('ASTTransactionControl');
  if (stmt.kind === 'setRole') return n('SetRoleQuery');
  if (stmt.kind === 'set') {
    return n('Set');
  }
  if (stmt.kind === 'system') return n('SYSTEM query');
  if (stmt.kind === 'use')
    return n(`UseQuery ${stmt.database}`, [n(`Identifier ${stmt.database}`)]);
  if (stmt.kind === 'createTable') return createTableQueryNode(stmt);
  if (stmt.kind === 'createView') return createViewQueryNode(stmt);
  if (stmt.kind === 'createMaterializedView') return createMaterializedViewQueryNode(stmt);
  if (stmt.kind === 'createDatabase') return createDatabaseQueryNode(stmt);
  if (stmt.kind === 'createFunction') return createFunctionQueryNode(stmt);
  if (stmt.kind === 'createIndex') return createIndexQueryNode(stmt);
  if (stmt.kind === 'createDictionary') return createDictionaryQueryNode(stmt);
  if (stmt.kind === 'createWorkload') return createWorkloadQueryNode(stmt);
  if (stmt.kind === 'createUser') {
    if (!stmt.auth || stmt.auth.length === 0) return n('CreateUserQuery');
    const authChildren = stmt.auth.map((a) => {
      if (a.sshKeys !== undefined) {
        const keys = Array.from({ length: a.sshKeys }, () => n('PublicSSHKey'));
        return n('AuthenticationData', keys);
      }
      if (a.secret !== undefined) {
        return n('AuthenticationData', [n(`Literal '${a.secret}'`)]);
      }
      return n('AuthenticationData');
    });
    return n('CreateUserQuery', authChildren);
  }
  if (stmt.kind === 'createRole') return n('CreateRoleQuery');
  if (stmt.kind === 'createRowPolicy') return n('CREATE ROW POLICY or ALTER ROW POLICY query');
  if (stmt.kind === 'createQuota') return n('CreateQuotaQuery');
  if (stmt.kind === 'createSettingsProfile') return n('CreateSettingsProfileQuery');
  if (stmt.kind === 'createNamedCollection') return n('CreateNamedCollectionQuery');
  if (stmt.kind === 'createResource') {
    return n(`CreateResourceQuery ${stmt.name}`, [n(`Identifier ${stmt.name}`)]);
  }
  if (stmt.kind === 'createWindowView') return n('CreateQuery');
  if (stmt.kind === 'createLiveView') return n('CreateQuery');
  if (stmt.kind === 'insert') return insertQueryNode(stmt);
  if (stmt.kind === 'truncate') {
    const t = stmt.table;
    const tableName = t.database ? `${t.database}.${t.table}` : t.table;
    const children = [n(`Identifier ${t.table}`)];
    if (t.database) children.unshift(n(`Identifier ${t.database}`));
    return n(`TruncateQuery  ${tableName}`, children);
  }

  const format = stmt.format;

  // Render a statement as a child of SelectIntersectExceptQuery.
  // Wrapping rules for SelectWithUnionQuery:
  //   - EXCEPT left child: always wrapped
  //   - EXCEPT right child: never wrapped
  //   - INTERSECT child that is compound (another intersect/except): wrapped
  //   - INTERSECT child that is a simple select: not wrapped
  //   - Union children: stmtNode already wraps them
  function renderIntersectChild(s: Statement, wrapInSWU: boolean): ExplainNode {
    if (s.kind === 'union') {
      // stmtNode for union already returns SelectWithUnionQuery(ExpressionList(...))
      return stmtNode(s);
    }
    let node: ExplainNode;
    if (s.kind === 'select') {
      node = selectQueryNode(s);
      // Parenthesized selects in intersect/except context get wrapped
      if (s.parenthesized) wrapInSWU = true;
    } else if (s.kind === 'intersect') {
      const lw = s.op === 'EXCEPT' || (s.op === 'INTERSECT' && s.left.kind === 'intersect');
      const rw = s.op === 'INTERSECT' && s.right.kind === 'intersect';
      node = n('SelectIntersectExceptQuery', [
        renderIntersectChild(s.left, lw),
        renderIntersectChild(s.right, rw),
      ]);
    } else {
      node = stmtNode(s);
    }
    if (wrapInSWU) return n('SelectWithUnionQuery', [n('ExpressionList', [node])]);
    return node;
  }

  // INTERSECT/EXCEPT produces SelectIntersectExceptQuery as the single ExpressionList child
  if (stmt.kind === 'intersect') {
    const leftWrap =
      stmt.op === 'EXCEPT' || (stmt.op === 'INTERSECT' && stmt.left.kind === 'intersect');
    const rightWrap = stmt.op === 'INTERSECT' && stmt.right.kind === 'intersect';
    const intersectNode = n('SelectIntersectExceptQuery', [
      renderIntersectChild(stmt.left, leftWrap),
      renderIntersectChild(stmt.right, rightWrap),
    ]);
    const children: ExplainNode[] = [n('ExpressionList', [intersectNode])];
    if (format) children.push(n(`Identifier ${format}`));
    return n('SelectWithUnionQuery', children);
  }

  // Flatten nested UNION ALL so all SELECT queries appear at the same level
  // UNION DISTINCT creates a nesting boundary (don't flatten through it)
  function flattenUnion(s: Statement): Statement[] {
    if (s.kind === 'union' && !s.unionMode) return s.queries.flatMap(flattenUnion);
    return [s];
  }

  let queries: Statement[];
  if (stmt.kind === 'union') {
    queries = stmt.queries.flatMap(flattenUnion);
  } else {
    queries = [stmt];
  }

  // Distribute WITH CTEs from the first SELECT to all other SELECTs in the union
  if (queries.length > 1) {
    const firstWith = queries[0]?.kind === 'select' ? queries[0].with : undefined;
    if (firstWith && firstWith.length > 0) {
      queries = queries.map((q, i) => {
        if (i === 0 || q.kind !== 'select' || (q.with && q.with.length > 0)) return q;
        return { ...q, with: firstWith, distributedWith: true } as Statement;
      });
    }
  }

  const hasPreFormatSettings = !!(stmt.preFormatSettings && stmt.preFormatSettings.length > 0);
  const hasPostFormatSettings = !!(stmt.postFormatSettings && stmt.postFormatSettings.length > 0);
  const children: ExplainNode[] = [
    n(
      'ExpressionList',
      queries.map((q) => {
        if (q.kind === 'select') {
          return selectQueryNode(q);
        }
        // Intersect/except inside a union: render as SelectIntersectExceptQuery directly (no outer SWU wrapper)
        if (q.kind === 'intersect')
          return n('SelectIntersectExceptQuery', [
            renderIntersectChild(q.left, q.op === 'EXCEPT'),
            renderIntersectChild(q.right, false),
          ]);
        return stmtNode(q);
      }),
    ),
  ];
  if (stmt.intoOutfile) {
    children.push(n(`Literal '${escapeStringValue(stmt.intoOutfile.value)}'`));
  }
  // Pre-format settings (second SETTINGS before FORMAT) rendered before format identifier
  if (hasPreFormatSettings) {
    children.push(n('Set'));
  }
  if (format) {
    children.push(n(`Identifier ${format}`));
  }
  // Post-format settings (SETTINGS after FORMAT) rendered after format identifier
  if (hasPostFormatSettings) {
    children.push(n('Set'));
  }

  return n('SelectWithUnionQuery', children);
}

export function formatExplain(statements: Statement[]): string {
  StatementsSchema.parse(statements);
  return statements.map((s) => render(stmtNode(s))).join('\n\n');
}
