import {
  BinaryExpr,
  CTE,
  ColumnTransformer,
  ExplainStatement,
  Expression,
  FromExpr,
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
    case 'array': {
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
  if (expr.kind === 'tuple') {
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
  if (expr.kind === 'array') return null;
  const inline = inlineExpr(expr);
  if (inline !== null) return inline;
  if (expr.kind === 'tuple') {
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
      return n(`QueryParameter {${expr.name}: ${expr.type}}`);
    case 'alias': {
      // Outer alias overrides any inner aliases — only show the outermost alias
      let innerExpr = expr.expr;
      while (innerExpr.kind === 'alias') {
        innerExpr = innerExpr.expr;
      }
      const inner = exprNode(innerExpr);
      return { label: `${inner.label} (alias ${expr.alias})`, children: inner.children };
    }
    case 'array': {
      if (expr.elements.length === 0) {
        return n('Function array', [n('ExpressionList')]);
      }
      const inlines = expr.elements.map(inlineExpr);
      if (inlines.some((i) => i === null)) {
        return n('Function array', [n('ExpressionList', expr.elements.map(exprNode))]);
      }
      return n(`Literal Array_[${inlines.join(', ')}]`);
    }
    case 'tuple': {
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
      if (funcName === 'not' && expr.args.length === 1 && expr.args[0].kind === 'tuple') {
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
        if (e.kind === 'array') return e.elements.every(isPureLiteral);
        if (e.kind === 'tuple') return e.elements.every(isPureLiteral);
        return false;
      }
      function castElemStr(e: Expression): string {
        if (e.kind === 'literal') {
          if (e.type === 'String') return `'${escapeStringValue(e.value)}'`;
          return e.value;
        }
        if (e.kind === 'array') {
          if (e.source !== undefined) return e.source;
          return `[${e.elements.map(castElemStr).join(', ')}]`;
        }
        // tuple
        if (e.kind === 'tuple') {
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
        if (e.kind === 'array') {
          // Escape single quotes in source text so they appear as \' in the Literal label
          const src = e.source !== undefined ? e.source.replace(/'/g, "\\'") : null;
          return src ?? `[${e.elements.map(castElemStr).join(', ')}]`;
        }
        if (e.kind === 'tuple') {
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
          if (single.kind === 'tuple') {
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
  if (from.kind === 'tableFunction') return tableFunctionExprNode(from);
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
  if (from.kind === 'tableRef' || from.kind === 'subqueryFrom' || from.kind === 'tableFunction') {
    return [{ tag: 'base', from }];
  }
  if (from.kind === 'join') {
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
  if (cte.kind === 'expr') {
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

// Build the top-level SelectWithUnionQuery node for a statement (SelectStatement or UnionStatement)
function stmtNode(stmt: Statement): ExplainNode {
  if (stmt.kind === 'explain') return explainStmtNode(stmt);
  if (stmt.kind === 'set') return n('Set');
  if (stmt.kind === 'system') return n('SYSTEM query');
  if (stmt.kind === 'use') return n('Query');
  if (stmt.kind === 'createTable') return n('CreateQuery');

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
