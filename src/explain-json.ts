import {
  BinaryExpr,
  CTE,
  ColumnTransformer,
  Expression,
  FromExpr,
  Identifier,
  InterpolateItem,
  OrderByItem,
  SampleClause,
  SelectStatement,
  SettingItem,
  Statement,
  StatementsSchema,
  SubqueryFrom,
  TableFunctionRef,
  TableRef,
  WindowFrameBound,
  WindowSpec,
} from './ast';
import {
  OP_TO_FUNCTION,
  escapeStringValue,
  flattenFromExpr,
  normalizeFloat,
  normalizeTypeName,
  normalizeUInt,
} from './explain';

/**
 * Version of the `EXPLAIN AST json = 1` output contract this module targets.
 * Mirrors `AST_JSON_FORMAT_VERSION` in the upstream ClickHouse PR
 * (https://github.com/peter-leonov-ch/ClickHouse/pull/1); bumped there on any
 * backwards-incompatible shape change.
 */
export const AST_JSON_FORMAT_VERSION = 1;

/** A node in the ClickHouse `EXPLAIN AST json = 1` output tree. */
export type ExplainJSONNode = { type: string; [key: string]: unknown };

/** The versioned document wrapper around a single statement's AST. */
export type ExplainJSONDocument = { version: number; ast: ExplainJSONNode };

// ── String/value helpers ─────────────────────────────────────────────────────

// The grammar stores string literals in pre-escaped form: \b \f \n \r \t \0 \\
// are kept as their two-char sequences while \' is stored as a plain quote.
// Convert that stored form back to the raw string value for JSON output.
function unescapeStored(value: string): string {
  return value.replace(/\\([\\nrtbf0])/g, (_, c: string) => {
    switch (c) {
      case 'n':
        return '\n';
      case 'r':
        return '\r';
      case 't':
        return '\t';
      case 'b':
        return '\b';
      case 'f':
        return '\f';
      case '0':
        return '\0';
      default:
        return '\\';
    }
  });
}

// normalizeTypeName() escapes quotes/backslashes for the text explain label;
// undo that so the JSON literal carries the raw type string.
function unescapeLabel(value: string): string {
  return value
    .replace(/\\\\/g, '\u0000')
    .replace(/\\'/g, "'")
    .replace(new RegExp('\u0000', 'g'), '\\');
}

// Canonical string rendering for an Identifier (plain name or query-param).
function id(x: Identifier): string {
  return typeof x === 'string' ? x : `{${x.name}:${x.type}}`;
}

// ── Literal rendering ────────────────────────────────────────────────────────

type Scalar = string | number | boolean | null;

// JSON value for a scalar literal, mirroring ClickHouse's fieldToJSON.
function literalScalar(expr: Expression & { kind: 'literal' }): {
  value_type: string;
  value: Scalar;
} {
  switch (expr.type) {
    case 'String':
      return { value_type: 'String', value: unescapeStored(expr.value) };
    case 'NULL':
      return { value_type: 'Null', value: null };
    case 'Bool':
      return { value_type: 'Bool', value: expr.value === 'true' || expr.value === '1' };
    case 'Float64': {
      const normalized = normalizeFloat(expr.value);
      const num = Number(normalized);
      // inf/nan cannot be represented in JSON; fall back to their string form.
      return { value_type: 'Float64', value: Number.isFinite(num) ? num : normalized };
    }
    case 'Int64':
      // ClickHouse represents -0 as UInt64 0.
      if (expr.value === '0') return { value_type: 'UInt64', value: 0 };
      return { value_type: 'Int64', value: Number(expr.value) };
    default:
      return { value_type: 'UInt64', value: Number(normalizeUInt(expr.value)) };
  }
}

// Inline representation of an expression used inside Array/Tuple literal values,
// rendered the way ClickHouse's FieldVisitorToString prints fields.
// Returns null when the expression cannot be inlined (the containing array/tuple
// then uses the Function form instead of the Literal form).
function inlineFieldString(expr: Expression): string | null {
  if ((expr as Record<string, unknown>).parenthesized) return null;
  switch (expr.kind) {
    case 'literal':
      if (expr.type === 'String') return `'${escapeStringValue(expr.value)}'`;
      if (expr.type === 'NULL') return 'NULL';
      if (expr.type === 'Bool') return expr.value;
      if (expr.type === 'Float64') return normalizeFloat(expr.value);
      if (expr.type === 'Int64') return expr.value === '0' ? '0' : expr.value;
      return normalizeUInt(expr.value);
    case 'arrayLiteral': {
      // Empty arrays use the Function array form, not the literal form.
      if (expr.elements.length === 0) return null;
      const inlines = expr.elements.map(inlineFieldString);
      if (inlines.some((i) => i === null)) return null;
      return `[${inlines.join(', ')}]`;
    }
    default:
      return null;
  }
}

// Inline a tuple literal recursively: only literals and nested tuples-of-literals.
function inlineTupleFieldString(expr: Expression): string | null {
  if ((expr as Record<string, unknown>).parenthesized) return null;
  if (expr.kind === 'literal') return inlineFieldString(expr);
  if (expr.kind === 'tupleLiteral') {
    const inlines = expr.elements.map(inlineTupleFieldString);
    if (inlines.some((i) => i === null)) return null;
    return `(${inlines.join(', ')})`;
  }
  return null;
}

// Like inlineFieldString but also handles tuple elements recursively — used for
// IN values where tuples can appear inside the outer Tuple literal. Arrays are
// not inlined in this context (ClickHouse renders them as Function tuple).
function inlineInFieldString(expr: Expression): string | null {
  if (expr.kind === 'arrayLiteral') return null;
  const inline = inlineFieldString(expr);
  if (inline !== null) return inline;
  if (expr.kind === 'tupleLiteral') {
    const inlines = expr.elements.map(inlineInFieldString);
    if (inlines.some((i) => i === null)) return null;
    return `(${inlines.join(', ')})`;
  }
  return null;
}

// ── Settings ─────────────────────────────────────────────────────────────────

// Convert a settings value expression to the JSON value ClickHouse emits in
// the Set node's `changes` map.
function settingValueJSON(value: Expression): Scalar {
  if (value.kind === 'literal') return literalScalar(value).value;
  // Bare identifiers used as setting values (e.g. join_algorithm = hash)
  if (value.kind === 'columnRef') return value.parts.map(id).join('.');
  if (
    value.kind === 'functionCall' &&
    value.name === 'negate' &&
    value.args.length === 1 &&
    value.args[0].kind === 'literal'
  ) {
    const inner = literalScalar(value.args[0]);
    if (typeof inner.value === 'number') return -inner.value;
  }
  const inline = inlineFieldString(value) ?? inlineTupleFieldString(value);
  return inline ?? '';
}

function setNodeJSON(settings: SettingItem[]): ExplainJSONNode {
  const changes: Record<string, Scalar> = {};
  for (const item of settings) {
    changes[item.name] = settingValueJSON(item.value);
  }
  const node: ExplainJSONNode = { type: 'Set' };
  if (settings.length > 0) node.changes = changes;
  return node;
}

// ── Column transformers ──────────────────────────────────────────────────────

function columnTransformerJSON(t: ColumnTransformer): ExplainJSONNode {
  if (t.kind === 'apply') {
    const node: ExplainJSONNode = { type: 'ColumnsApplyTransformer' };
    if (t.func.kind === 'columnRef') {
      node.func_name = t.func.parts.map(id).join('.');
    } else if (t.func.kind === 'functionCall') {
      node.func_name = t.func.name;
      if (t.func.params) node.parameters = t.func.params.map(exprJSON);
    } else if (t.func.kind === 'lambdaExpr') {
      node.lambda = exprJSON(t.func);
    }
    return node;
  }
  if (t.kind === 'except') {
    const node: ExplainJSONNode = { type: 'ColumnsExceptTransformer' };
    if (t.strict) node.is_strict = true;
    // String-pattern EXCEPT has no children; column-list EXCEPT has Identifier children.
    if (!t.pattern) {
      node.children = t.columns.map((c) => ({ type: 'Identifier', name: c }));
    }
    return node;
  }
  // replace
  const node: ExplainJSONNode = { type: 'ColumnsReplaceTransformer' };
  if (t.strict) node.is_strict = true;
  node.children = t.items.map((item) => ({
    type: 'ColumnsReplaceTransformer::Replacement',
    name: item.alias,
    children: [exprJSON(item.expr)],
  }));
  return node;
}

function transformerListJSON(transformers: ColumnTransformer[]): ExplainJSONNode {
  return { type: 'ColumnsTransformerList', children: transformers.map(columnTransformerJSON) };
}

// ── Window definitions ───────────────────────────────────────────────────────

function frameBoundType(bound: WindowFrameBound): string {
  if (bound.kind === 'unbounded') return 'Unbounded';
  if (bound.kind === 'currentRow') return 'Current';
  return 'Offset';
}

function frameBoundPreceding(bound: WindowFrameBound, isEnd: boolean): boolean {
  if (bound.kind === 'unbounded') return !isEnd;
  if (bound.kind === 'currentRow') return false;
  return bound.kind === 'preceding';
}

function windowDefinitionJSON(spec: WindowSpec): ExplainJSONNode {
  const node: ExplainJSONNode = { type: 'WindowDefinition' };
  if (spec.baseWindow !== undefined) node.parent_window_name = spec.baseWindow;
  if (spec.partitionBy && spec.partitionBy.length > 0) {
    node.partition_by = spec.partitionBy.map(exprJSON);
  }
  if (spec.orderBy && spec.orderBy.length > 0) {
    node.order_by = spec.orderBy.map(orderByJSON);
  }
  if (spec.frame) {
    const { start, end } = spec.frame;
    node.frame_type = spec.frame.frameType.toUpperCase();
    node.frame_begin_type = frameBoundType(start);
    if (start.kind === 'preceding' || start.kind === 'following') {
      node.frame_begin_offset = exprJSON(start.expr);
    }
    node.frame_begin_preceding = frameBoundPreceding(start, false);
    // Without BETWEEN syntax the end bound defaults to CURRENT ROW.
    node.frame_end_type = end ? frameBoundType(end) : 'Current';
    if (end && (end.kind === 'preceding' || end.kind === 'following')) {
      node.frame_end_offset = exprJSON(end.expr);
    }
    node.frame_end_preceding = end ? frameBoundPreceding(end, true) : false;
  }
  return node;
}

// ── ANY/ALL rewriting (mirrors explain.ts) ───────────────────────────────────

// Build a synthetic subquery node for ANY/ALL rewriting:
// SELECT aggFunc(*) FROM (subquery)
function syntheticAggSubqueryJSON(aggFunc: string, subqueryStmt: Statement): ExplainJSONNode {
  const aggNode = (): ExplainJSONNode => ({
    type: 'Function',
    name: aggFunc,
    arguments: [{ type: 'Asterisk' }],
  });
  const tables = (): ExplainJSONNode => ({
    type: 'TablesInSelectQuery',
    children: [
      {
        type: 'TablesInSelectQueryElement',
        table_expression: {
          type: 'TableExpression',
          subquery: { type: 'Subquery', query: stmtJSON(subqueryStmt) },
        },
      },
    ],
  });
  const selectQuery: ExplainJSONNode = {
    type: 'SelectQuery',
    select: [aggNode()],
    tables: tables(),
  };
  return {
    type: 'Subquery',
    query: { type: 'SelectWithUnionQuery', selects: [selectQuery] },
  };
}

function operatorFunctionJSON(name: string, args: ExplainJSONNode[]): ExplainJSONNode {
  return { type: 'Function', name, is_operator: true, arguments: args };
}

// Rewrite x op ANY/ALL (subquery) to ClickHouse canonical form.
function rewriteAnyAllJSON(expr: BinaryExpr): ExplainJSONNode | null {
  if (expr.right.kind !== 'functionCall') return null;
  const fname = expr.right.name.toLowerCase();
  if (fname !== 'any' && fname !== 'all') return null;
  if (expr.right.args.length !== 1 || expr.right.args[0].kind !== 'subqueryExpr') return null;

  const subqueryStmt = expr.right.args[0].query;
  const leftNode = exprJSON(expr.left);
  const op = expr.op;
  const isAny = fname === 'any';

  if ((op === '==' || op === '=') && isAny) {
    return operatorFunctionJSON('in', [
      leftNode,
      { type: 'Subquery', query: stmtJSON(subqueryStmt) },
    ]);
  }
  if ((op === '!=' || op === '<>') && !isAny) {
    return operatorFunctionJSON('notIn', [
      leftNode,
      { type: 'Subquery', query: stmtJSON(subqueryStmt) },
    ]);
  }
  if ((op === '==' || op === '=') && !isAny) {
    return operatorFunctionJSON('in', [
      leftNode,
      syntheticAggSubqueryJSON('singleValueOrNull', subqueryStmt),
    ]);
  }
  if ((op === '!=' || op === '<>') && isAny) {
    return operatorFunctionJSON('notIn', [
      leftNode,
      syntheticAggSubqueryJSON('singleValueOrNull', subqueryStmt),
    ]);
  }

  const compFunc = OP_TO_FUNCTION[op];
  if (!compFunc) return null;
  let aggFunc: string;
  if (isAny) {
    aggFunc = op === '<' || op === '<=' ? 'max' : 'min';
  } else {
    aggFunc = op === '<' || op === '<=' ? 'min' : 'max';
  }
  return operatorFunctionJSON(compFunc, [
    leftNode,
    syntheticAggSubqueryJSON(aggFunc, subqueryStmt),
  ]);
}

// ── Expressions ──────────────────────────────────────────────────────────────

function identifierJSON(parts: Identifier[]): ExplainJSONNode {
  const formattedParts: string[] = [];
  for (const rawPart of parts) {
    const part = id(rawPart);
    if (part.startsWith('^')) {
      formattedParts.push(`^\`${part.slice(1)}\``);
    } else if (part.endsWith('[]')) {
      formattedParts.push(part.slice(0, -2));
      formattedParts.push(':`Array(JSON)`');
    } else {
      formattedParts.push(part);
    }
  }
  const node: ExplainJSONNode = { type: 'Identifier', name: formattedParts.join('.') };
  if (formattedParts.length > 1) node.name_parts = formattedParts;
  return node;
}

function withAlias(node: ExplainJSONNode, alias: string): ExplainJSONNode {
  const { type, ...rest } = node;
  return { type, alias, ...rest };
}

function exprJSON(expr: Expression): ExplainJSONNode {
  switch (expr.kind) {
    case 'literal':
      return { type: 'Literal', ...literalScalar(expr) };
    case 'columnRef':
      return identifierJSON(expr.parts);
    case 'asterisk': {
      const node: ExplainJSONNode = { type: 'Asterisk' };
      if (expr.transformers && expr.transformers.length > 0) {
        node.transformers = transformerListJSON(expr.transformers);
      }
      return node;
    }
    case 'qualifiedAsterisk': {
      const node: ExplainJSONNode = {
        type: 'QualifiedAsterisk',
        qualifier: identifierJSON(expr.parts),
      };
      if (expr.transformers && expr.transformers.length > 0) {
        node.transformers = transformerListJSON(expr.transformers);
      }
      return node;
    }
    case 'tupleExpansion': {
      const node: ExplainJSONNode = { type: 'Asterisk' };
      if (expr.transformers && expr.transformers.length > 0) {
        node.transformers = transformerListJSON(expr.transformers);
      }
      return node;
    }
    case 'queryParam':
      // Upstream does not enrich ASTQueryParameter yet; only the type id is emitted.
      return { type: 'QueryParameter' };
    case 'alias': {
      // Outer alias overrides any inner aliases — only show the outermost alias.
      let innerExpr = expr.expr;
      while (innerExpr.kind === 'alias') {
        innerExpr = innerExpr.expr;
      }
      return withAlias(exprJSON(innerExpr), expr.alias);
    }
    case 'arrayLiteral': {
      if (expr.elements.length === 0) {
        return { type: 'Function', name: 'array', arguments: [] };
      }
      const inlines = expr.elements.map(inlineFieldString);
      if (inlines.some((i) => i === null)) {
        return { type: 'Function', name: 'array', arguments: expr.elements.map(exprJSON) };
      }
      return { type: 'Literal', value_type: 'Array', value: `[${inlines.join(', ')}]` };
    }
    case 'tupleLiteral': {
      const inline = inlineTupleFieldString(expr);
      if (inline !== null) return { type: 'Literal', value_type: 'Tuple', value: inline };
      return operatorFunctionJSON('tuple', expr.elements.map(exprJSON));
    }
    case 'functionCall':
      return functionCallJSON(expr);
    case 'castExpr': {
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
        if (e.kind === 'tupleLiteral') {
          if (e.source !== undefined) return e.source;
          return `(${e.elements.map(castElemStr).join(', ')})`;
        }
        return '';
      }
      // For :: operator casts, pure literal operands collapse into a string literal.
      function castOperandString(e: Expression): string | null {
        if (!isPureLiteral(e)) return null;
        if (e.kind === 'literal') {
          if (e.type === 'String') return unescapeStored(e.value);
          return e.value;
        }
        if (e.kind === 'arrayLiteral') {
          return e.source ?? `[${e.elements.map(castElemStr).join(', ')}]`;
        }
        if (e.kind === 'tupleLiteral') {
          return e.source ?? `(${e.elements.map(castElemStr).join(', ')})`;
        }
        return null;
      }
      let innerNode: ExplainJSONNode;
      if (expr.operator) {
        const str = castOperandString(expr.expr);
        innerNode =
          str !== null
            ? { type: 'Literal', value_type: 'String', value: str }
            : exprJSON(expr.expr);
      } else {
        innerNode = exprJSON(expr.expr);
      }
      const node: ExplainJSONNode = { type: 'Function', name: 'CAST' };
      if (expr.operator) node.is_operator = true;
      node.arguments = [
        innerNode,
        {
          type: 'Literal',
          value_type: 'String',
          value: unescapeLabel(normalizeTypeName(expr.type)),
        },
      ];
      return node;
    }
    case 'lambdaExpr': {
      // If the lambda body has an alias, ClickHouse moves the alias to the lambda node.
      let body = expr.body;
      let lambdaAlias = '';
      while (body.kind === 'alias') {
        lambdaAlias = body.alias;
        body = body.expr;
      }
      const node: ExplainJSONNode = { type: 'Function' };
      if (lambdaAlias) node.alias = lambdaAlias;
      node.name = 'lambda';
      node.is_operator = true;
      node.is_lambda_function = true;
      node.kind = 'LAMBDA_FUNCTION';
      node.arguments = [
        operatorFunctionJSON(
          'tuple',
          expr.params.map((p) => ({ type: 'Identifier', name: p }) as ExplainJSONNode),
        ),
        exprJSON(body),
      ];
      return node;
    }
    case 'unaryExpr':
      return operatorFunctionJSON('not', [exprJSON(expr.expr)]);
    case 'binaryExpr': {
      const anyAllResult = rewriteAnyAllJSON(expr);
      if (anyAllResult) return anyAllResult;
      const funcName = OP_TO_FUNCTION[expr.op] ?? expr.op;
      return operatorFunctionJSON(funcName, [exprJSON(expr.left), exprJSON(expr.right)]);
    }
    case 'naryExpr': {
      const funcName = OP_TO_FUNCTION[expr.op] ?? expr.op;
      return operatorFunctionJSON(funcName, expr.operands.map(exprJSON));
    }
    case 'subqueryExpr':
      return { type: 'Subquery', query: stmtJSON(expr.query) };
    case 'inExpr': {
      const funcName = expr.global
        ? expr.negated
          ? 'globalNotIn'
          : 'globalIn'
        : expr.negated
          ? 'notIn'
          : 'in';
      let valuesNode: ExplainJSONNode;
      if (Array.isArray(expr.values)) {
        if (expr.values.length === 1) {
          const single = expr.values[0];
          if (single.kind === 'tupleLiteral') {
            const inlineResult = inlineInFieldString(single);
            if (inlineResult !== null) {
              valuesNode = {
                type: 'Function',
                name: 'tuple',
                is_operator: true,
                arguments: [{ type: 'Literal', value_type: 'Tuple', value: inlineResult }],
              };
            } else {
              valuesNode = exprJSON(single);
            }
          } else {
            valuesNode = exprJSON(single);
          }
        } else {
          const inlines = expr.values.map(inlineInFieldString);
          if (inlines.some((i) => i === null)) {
            valuesNode = operatorFunctionJSON('tuple', expr.values.map(exprJSON));
          } else {
            valuesNode = {
              type: 'Literal',
              value_type: 'Tuple',
              value: `(${inlines.join(', ')})`,
            };
          }
        }
      } else {
        valuesNode = { type: 'Subquery', query: stmtJSON(expr.values.query) };
      }
      return operatorFunctionJSON(funcName, [exprJSON(expr.expr), valuesNode]);
    }
    case 'columnsExpr': {
      const isRegex =
        expr.args.length === 1 && expr.args[0].kind === 'literal' && expr.args[0].type === 'String';
      const node: ExplainJSONNode = {
        type: expr.qualifier
          ? isRegex
            ? 'QualifiedColumnsRegexpMatcher'
            : 'QualifiedColumnsListMatcher'
          : isRegex
            ? 'ColumnsRegexpMatcher'
            : 'ColumnsListMatcher',
      };
      if (isRegex && expr.args[0].kind === 'literal') {
        node.pattern = unescapeStored(expr.args[0].value);
      }
      if (expr.qualifier) node.qualifier = { type: 'Identifier', name: expr.qualifier };
      if (!isRegex) node.columns = expr.args.map(exprJSON);
      if (expr.transformers && expr.transformers.length > 0) {
        node.transformers = transformerListJSON(expr.transformers);
      }
      return node;
    }
    case 'jsonSubcolumn': {
      // JSON subcolumn .:Type access — rendered as an identifier with type annotation.
      const typeStr = `\`${expr.type}\``;
      const inner = exprJSON(expr.expr);
      const pathSuffix = expr.path && expr.path.length > 0 ? '.' + expr.path.join('.') : '';
      const name = `${String(inner.name ?? '')}.:${typeStr}${pathSuffix}`;
      return { ...inner, name };
    }
  }
}

function functionCallJSON(expr: Expression & { kind: 'functionCall' }): ExplainJSONNode {
  // Normalize known function aliases to their canonical names as ClickHouse does.
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

  // not(tuple(a,b,c)) — NOT applied directly to a tuple literal expands the tuple.
  if (funcName === 'not' && expr.args.length === 1 && expr.args[0].kind === 'tupleLiteral') {
    const tupleArg = expr.args[0];
    const node = operatorFunctionJSON('not', [
      operatorFunctionJSON('tuple', tupleArg.elements.map(exprJSON)),
    ]);
    return node;
  }
  // COLUMNS('regex') renders as ColumnsRegexpMatcher; COLUMNS(id, ...) as ColumnsListMatcher.
  if (funcName.toUpperCase() === 'COLUMNS') {
    const first = expr.args[0];
    if (expr.args.length === 1 && first.kind === 'literal' && first.type === 'String') {
      return { type: 'ColumnsRegexpMatcher', pattern: unescapeStored(first.value) };
    }
    return { type: 'ColumnsListMatcher', columns: expr.args.map(exprJSON) };
  }

  const node: ExplainJSONNode = { type: 'Function', name: funcName };
  if (expr.isOperator) node.is_operator = true;
  if (expr.window || expr.windowName !== undefined) {
    node.is_window_function = true;
    node.kind = 'WINDOW_FUNCTION';
  }
  if (expr.nullsAction) node.nulls_action = expr.nullsAction;

  // view(subquery) renders the subquery directly inside the arguments.
  if (
    funcName.toLowerCase() === 'view' &&
    expr.args.length === 1 &&
    expr.args[0].kind === 'subqueryExpr'
  ) {
    node.arguments = [stmtJSON(expr.args[0].query)];
    return node;
  }

  const args = expr.args.map(exprJSON);
  if (expr.funcSettings) args.push(setNodeJSON(expr.funcSettings));
  node.arguments = args;
  if (expr.params) node.parameters = expr.params.map(exprJSON);
  if (expr.window) {
    node.window_definition = windowDefinitionJSON(expr.window);
  } else if (expr.windowName !== undefined) {
    node.window_name = expr.windowName;
  }
  return node;
}

// ── ORDER BY / INTERPOLATE ───────────────────────────────────────────────────

function orderByJSON(item: OrderByItem): ExplainJSONNode {
  const node: ExplainJSONNode = {
    type: 'OrderByElement',
    expression: exprJSON(item.expr),
    direction: item.direction,
  };
  if (item.nullsFirst !== undefined) node.nulls_first = item.nullsFirst;
  if (item.collate !== undefined) {
    node.collation = { type: 'Literal', value_type: 'String', value: unescapeStored(item.collate) };
  }
  if (
    item.withFill ||
    item.fillFrom !== undefined ||
    item.fillTo !== undefined ||
    item.fillStep !== undefined ||
    item.fillStaleness !== undefined
  ) {
    node.with_fill = true;
  }
  if (item.fillFrom !== undefined) node.fill_from = exprJSON(item.fillFrom);
  if (item.fillTo !== undefined) node.fill_to = exprJSON(item.fillTo);
  if (item.fillStep !== undefined) node.fill_step = exprJSON(item.fillStep);
  if (item.fillStaleness !== undefined) node.fill_staleness = exprJSON(item.fillStaleness);
  return node;
}

function interpolateJSON(items: InterpolateItem[]): ExplainJSONNode[] {
  return items.map((it) => ({
    type: 'InterpolateElement',
    column: it.col,
    // When no explicit expression, ClickHouse uses the column identifier itself.
    expr: it.expr ? exprJSON(it.expr) : { type: 'Identifier', name: it.col },
  }));
}

// ── FROM / JOIN ──────────────────────────────────────────────────────────────

// Convert a sample ratio/offset value to ClickHouse's exact-rational form.
function sampleRatioJSON(
  sample: SampleClause['ratio'] | NonNullable<SampleClause['offset']>,
): ExplainJSONNode {
  let numerator: string;
  let denominator: string;
  if ('den' in sample && sample.den !== undefined) {
    numerator = String(Math.round(parseFloat(sample.num)));
    denominator = String(Math.round(parseFloat(sample.den)));
  } else {
    const numText = sample.num;
    const lower = numText.toLowerCase();
    if (/^[0-9]+$/.test(numText)) {
      numerator = numText;
      denominator = '1';
    } else if (lower.includes('e-')) {
      const [mantissaStr, expStr] = lower.split('e-');
      numerator = String(Math.round(parseFloat(mantissaStr)));
      denominator = String(Math.round(Math.pow(10, parseInt(expStr, 10))));
    } else if (lower.includes('.')) {
      const dotIdx = lower.indexOf('.');
      const afterDot = lower.substring(dotIdx + 1).replace(/e.*$/, '');
      const digits = lower.replace('.', '').replace(/e.*$/, '');
      numerator = String(parseInt(digits, 10));
      denominator = String(Math.round(Math.pow(10, afterDot.length)));
    } else {
      numerator = String(Math.round(parseFloat(numText)));
      denominator = '1';
    }
  }
  return { type: 'SampleRatio', numerator, denominator };
}

function addSample(node: ExplainJSONNode, sample: SampleClause | undefined): void {
  if (!sample) return;
  node.sample_size = sampleRatioJSON(sample.ratio);
  if (sample.offset) node.sample_offset = sampleRatioJSON(sample.offset);
}

function tableExpressionJSON(ref: TableRef): ExplainJSONNode {
  const tableId: ExplainJSONNode = { type: 'TableIdentifier' };
  if (ref.alias !== undefined) tableId.alias = ref.alias;
  tableId.name = id(ref.table);
  if (ref.database !== undefined) tableId.database = id(ref.database);
  const node: ExplainJSONNode = { type: 'TableExpression', database_and_table_name: tableId };
  if (ref.final) node.final = true;
  addSample(node, ref.sample);
  return node;
}

function subqueryTableExpressionJSON(from: SubqueryFrom): ExplainJSONNode {
  const subquery: ExplainJSONNode = { type: 'Subquery' };
  if (from.alias !== undefined) subquery.alias = from.alias;
  subquery.query = stmtJSON(from.query);
  const node: ExplainJSONNode = { type: 'TableExpression', subquery };
  if (from.final) node.final = true;
  addSample(node, from.sample);
  if (from.columnAliases && from.columnAliases.length > 0) {
    node.column_aliases = {
      type: 'ExpressionList',
      children: from.columnAliases.map((c) => ({ type: 'Identifier', name: c })),
    };
  }
  return node;
}

function tableFunctionExpressionJSON(from: TableFunctionRef): ExplainJSONNode {
  const fn: ExplainJSONNode = { type: 'Function' };
  if (from.alias !== undefined) fn.alias = from.alias;
  fn.name = from.name;
  // view(subquery) renders the subquery directly inside the arguments.
  if (
    from.name.toLowerCase() === 'view' &&
    from.args.length === 1 &&
    from.args[0].kind === 'subqueryExpr'
  ) {
    fn.arguments = [stmtJSON(from.args[0].query)];
  } else {
    const args = from.args.map(exprJSON);
    if (from.settings && from.settings.length > 0) args.push(setNodeJSON(from.settings));
    fn.arguments = args;
  }
  const node: ExplainJSONNode = { type: 'TableExpression', table_function: fn };
  if (from.final) node.final = true;
  addSample(node, from.sample);
  return node;
}

function fromAtomJSON(from: TableRef | SubqueryFrom | TableFunctionRef): ExplainJSONNode {
  if (from.kind === 'subqueryFrom') return subqueryTableExpressionJSON(from);
  if (from.kind === 'tableFunctionRef') return tableFunctionExpressionJSON(from);
  return tableExpressionJSON(from);
}

function fromJSON(from: FromExpr): ExplainJSONNode {
  const elements = flattenFromExpr(from);
  return {
    type: 'TablesInSelectQuery',
    children: elements.map((elem): ExplainJSONNode => {
      if (elem.tag === 'base') {
        return { type: 'TablesInSelectQueryElement', table_expression: fromAtomJSON(elem.from) };
      }
      if (elem.tag === 'join') {
        const tableJoin: ExplainJSONNode = { type: 'TableJoin' };
        const join = elem.join;
        tableJoin.kind = join.comma ? 'COMMA' : join.joinType;
        if (join.strictness !== undefined) tableJoin.strictness = join.strictness;
        if (join.global) tableJoin.locality = 'GLOBAL';
        if (elem.constraint) {
          if (elem.constraint.kind === 'using') {
            tableJoin.using = elem.constraint.columns.map((col): ExplainJSONNode => {
              if (col === '*') return { type: 'Asterisk' };
              if (typeof col === 'object' && col.name && col.alias) {
                return { type: 'Identifier', alias: col.alias, name: col.name };
              }
              return { type: 'Identifier', name: col as string };
            });
          } else {
            tableJoin.on = exprJSON(elem.constraint.expr);
          }
        }
        return {
          type: 'TablesInSelectQueryElement',
          table_join: tableJoin,
          table_expression: fromAtomJSON(elem.from),
        };
      }
      // arrayJoin
      return {
        type: 'TablesInSelectQueryElement',
        array_join: {
          type: 'ArrayJoin',
          kind: elem.joinType === 'LEFT ARRAY' ? 'LEFT' : 'INNER',
          expressions: elem.expressions.map(exprJSON),
        },
      };
    }),
  };
}

// ── CTEs ─────────────────────────────────────────────────────────────────────

function cteJSON(cte: CTE): ExplainJSONNode {
  if (cte.kind === 'cteExpr') {
    // Anonymous WITH expression (e.g. `WITH 1 SELECT 1`) renders as the expression.
    if (cte.name === undefined) return exprJSON(cte.expr);
    return exprJSON({ kind: 'alias', expr: cte.expr, alias: cte.name });
  }
  if (cte.kind === 'cteTuple') {
    return operatorFunctionJSON('tuple', cte.elements.map(exprJSON));
  }
  const node: ExplainJSONNode = {
    type: 'WithElement',
    name: cte.name,
    subquery: { type: 'Subquery', query: stmtJSON(cte.query) },
  };
  if (cte.columnAliases && cte.columnAliases.length > 0) {
    node.aliases = {
      type: 'ExpressionList',
      children: cte.columnAliases.map((a) => ({ type: 'Identifier', name: a })),
    };
  }
  return node;
}

// ── SELECT ───────────────────────────────────────────────────────────────────

function selectQueryJSON(stmt: SelectStatement): ExplainJSONNode {
  const node: ExplainJSONNode = { type: 'SelectQuery' };

  // Scalar flags first, mirroring upstream emission order.
  if (stmt.distinct) node.distinct = true;
  if (stmt.groupBy && stmt.groupBy.kind === 'all') node.group_by_all = true;
  if (stmt.withTotals) node.group_by_with_totals = true;
  if (stmt.withRollup) node.group_by_with_rollup = true;
  if (stmt.withCube) node.group_by_with_cube = true;
  if (stmt.groupBy && stmt.groupBy.kind === 'groupingSets') node.group_by_with_grouping_sets = true;
  if (stmt.recursive) node.recursive_with = true;

  if (stmt.with && stmt.with.length > 0) node.with = stmt.with.map(cteJSON);
  node.select = stmt.select.map(exprJSON);
  if (stmt.from) node.tables = fromJSON(stmt.from);
  if (stmt.prewhere) node.prewhere = exprJSON(stmt.prewhere);
  if (stmt.where) node.where = exprJSON(stmt.where);

  if (stmt.groupBy) {
    if (stmt.groupBy.kind === 'groupingSets') {
      node.group_by = stmt.groupBy.sets.map(
        (set): ExplainJSONNode => ({ type: 'ExpressionList', children: set.map(exprJSON) }),
      );
    } else if (stmt.groupBy.kind === 'expressions') {
      // Unwrap ROLLUP/CUBE function calls — their args are the group-by items.
      const flatGroupBy = stmt.groupBy.items.flatMap((item) => {
        if (
          item.kind === 'functionCall' &&
          (item.name.toUpperCase() === 'ROLLUP' || item.name.toUpperCase() === 'CUBE')
        ) {
          return item.args;
        }
        return [item];
      });
      node.group_by = flatGroupBy.map(exprJSON);
    }
  }

  if (stmt.having) node.having = exprJSON(stmt.having);
  if (stmt.windows && stmt.windows.length > 0) {
    node.window = stmt.windows.map(
      (w): ExplainJSONNode => ({
        type: 'WindowListElement',
        name: w.name,
        definition: windowDefinitionJSON(w.spec),
      }),
    );
  }
  if (stmt.qualify) node.qualify = exprJSON(stmt.qualify);

  let interpolate: ExplainJSONNode[] | undefined;
  if (stmt.orderBy && stmt.orderBy.length > 0) {
    node.order_by = stmt.orderBy.map(orderByJSON);
    const interpItem = stmt.orderBy.find((item) => item.interpolate !== undefined);
    if (interpItem && interpItem.interpolate !== undefined) {
      interpolate = interpolateJSON(interpItem.interpolate);
    }
  }

  if (stmt.limitBy) {
    if (stmt.limitBy.offset) node.limit_by_offset = exprJSON(stmt.limitBy.offset);
    node.limit_by_length = exprJSON(stmt.limitBy.count);
    node.limit_by = stmt.limitBy.by.map(exprJSON);
  } else if (stmt.distinct && stmt.distinct.kind === 'distinctOn' && stmt.distinct.on.length > 0) {
    // ClickHouse models DISTINCT ON (cols) as LIMIT 1 BY cols.
    node.limit_by_length = { type: 'Literal', value_type: 'UInt64', value: 1 };
    node.limit_by = stmt.distinct.on.map(exprJSON);
  }
  if (stmt.offset) node.limit_offset = exprJSON(stmt.offset);
  if (stmt.limit) node.limit_length = exprJSON(stmt.limit.count);
  if (stmt.settings && stmt.settings.length > 0) node.settings = setNodeJSON(stmt.settings);
  if (interpolate) node.interpolate = interpolate;

  return node;
}

// ── UNION / INTERSECT / EXCEPT ───────────────────────────────────────────────

function intersectOperatorString(stmt: { op: 'INTERSECT' | 'EXCEPT'; distinct?: boolean }): string {
  return `${stmt.op} ${stmt.distinct ? 'DISTINCT' : 'ALL'}`;
}

// Render a statement as a child of SelectIntersectExceptQuery, mirroring the
// SelectWithUnionQuery wrapping rules from explain.ts:
//   - EXCEPT left child: always wrapped
//   - EXCEPT right child: never wrapped
//   - INTERSECT child that is compound (another intersect/except): wrapped
//   - INTERSECT child that is a simple select: not wrapped
//   - Union children: stmtJSON already wraps them
function intersectChildJSON(s: Statement, wrapInSWU: boolean): ExplainJSONNode {
  if (s.kind === 'union') return stmtJSON(s);
  let node: ExplainJSONNode;
  if (s.kind === 'select') {
    node = selectQueryJSON(s);
    if (s.parenthesized) wrapInSWU = true;
  } else if (s.kind === 'intersect') {
    const leftParen = (s.left as { parenthesized?: boolean }).parenthesized === true;
    const rightParen = (s.right as { parenthesized?: boolean }).parenthesized === true;
    const lw =
      s.op === 'EXCEPT' ||
      (s.op === 'INTERSECT' && s.left.kind === 'intersect') ||
      (s.left.kind === 'intersect' && leftParen);
    const rw =
      (s.op === 'INTERSECT' && s.right.kind === 'intersect') ||
      (s.right.kind === 'intersect' && rightParen);
    node = {
      type: 'SelectIntersectExceptQuery',
      operator: intersectOperatorString(s),
      children: [intersectChildJSON(s.left, lw), intersectChildJSON(s.right, rw)],
    };
    if ((s as { parenthesized?: boolean }).parenthesized) wrapInSWU = true;
  } else {
    node = stmtJSON(s);
  }
  if (wrapInSWU) return { type: 'SelectWithUnionQuery', selects: [node] };
  return node;
}

// Distribute the WITH CTEs of the leftmost SELECT to sibling SELECTs, the way
// ClickHouse's parser does for UNION/INTERSECT/EXCEPT chains.
function distributeWith(queries: Statement[]): Statement[] {
  if (queries.length <= 1) return queries;
  const firstWith = queries[0]?.kind === 'select' ? queries[0].with : undefined;
  if (!firstWith || firstWith.length === 0) return queries;
  return queries.map((q, i) => {
    if (i === 0 || q.kind !== 'select' || (q.with && q.with.length > 0)) return q;
    return { ...q, with: firstWith } as Statement;
  });
}

function stmtJSON(stmt: Statement): ExplainJSONNode {
  if (stmt.kind === 'select' || stmt.kind === 'union' || stmt.kind === 'intersect') {
    return selectFamilyJSON(stmt);
  }
  throw new Error(
    `formatExplainJSON: statement kind '${stmt.kind}' is not supported yet; ` +
      'only the SELECT family (select/union/intersect) is currently exported',
  );
}

function selectFamilyJSON(stmt: Statement): ExplainJSONNode {
  // INTERSECT/EXCEPT produces SelectIntersectExceptQuery as the single select.
  if (stmt.kind === 'intersect') {
    function findLeftmostWith(s: Statement): CTE[] | undefined {
      if (s.kind === 'select') return s.with;
      if (s.kind === 'intersect') return findLeftmostWith(s.left);
      return undefined;
    }
    function distributeWithIntersect(s: Statement, withItems: CTE[]): Statement {
      if (s.kind === 'select' && !s.with) return { ...s, with: withItems } as Statement;
      if (s.kind === 'select') return s;
      if (s.kind === 'intersect') {
        return {
          ...s,
          left: distributeWithIntersect(s.left, withItems),
          right: distributeWithIntersect(s.right, withItems),
        } as Statement;
      }
      return s;
    }
    let distributed = stmt;
    const leftWith = findLeftmostWith(stmt);
    if (leftWith && leftWith.length > 0) {
      distributed = {
        ...stmt,
        right: distributeWithIntersect(stmt.right, leftWith),
      } as typeof stmt;
    }
    const leftWrap =
      distributed.op === 'EXCEPT' ||
      (distributed.op === 'INTERSECT' && distributed.left.kind === 'intersect');
    const rightWrap = distributed.op === 'INTERSECT' && distributed.right.kind === 'intersect';
    return {
      type: 'SelectWithUnionQuery',
      selects: [
        {
          type: 'SelectIntersectExceptQuery',
          operator: intersectOperatorString(distributed),
          children: [
            intersectChildJSON(distributed.left, leftWrap),
            intersectChildJSON(distributed.right, rightWrap),
          ],
        },
      ],
    };
  }

  // Flatten nested UNION ALL so all SELECT queries appear at the same level;
  // UNION DISTINCT creates a nesting boundary unless the whole chain is DISTINCT.
  function flattenUnion(s: Statement): Statement[] {
    if (s.kind === 'union' && !s.unionMode) return distributeWith(s.queries).flatMap(flattenUnion);
    return [s];
  }
  function flattenUnionDeep(s: Statement): Statement[] {
    if (s.kind === 'union') return s.queries.flatMap(flattenUnionDeep);
    return [s];
  }

  let queries: Statement[];
  if (stmt.kind === 'union') {
    const flattener = stmt.unionMode ? flattenUnionDeep : flattenUnion;
    queries = stmt.queries.flatMap(flattener);
  } else {
    queries = [stmt];
  }
  queries = distributeWith(queries);

  const node: ExplainJSONNode = { type: 'SelectWithUnionQuery' };
  if (stmt.kind === 'union' && stmt.unionMode === 'DISTINCT') node.union_mode = 'UNION_DISTINCT';
  node.selects = queries.map((q): ExplainJSONNode => {
    if (q.kind === 'select') return selectQueryJSON(q);
    // Intersect/except inside a union renders as SelectIntersectExceptQuery directly.
    if (q.kind === 'intersect') {
      return {
        type: 'SelectIntersectExceptQuery',
        operator: intersectOperatorString(q),
        children: [
          intersectChildJSON(q.left, q.op === 'EXCEPT'),
          intersectChildJSON(q.right, false),
        ],
      };
    }
    return stmtJSON(q);
  });
  return node;
}

// ── Public API ───────────────────────────────────────────────────────────────

/**
 * Converts a single parsed statement into the ClickHouse
 * `EXPLAIN AST json = 1` versioned document: `{ version: 1, ast: ... }`.
 *
 * Only the SELECT statement family (SELECT / UNION / INTERSECT / EXCEPT) is
 * currently supported; other statement kinds throw.
 */
export function explainJSON(statement: Statement): ExplainJSONDocument {
  return { version: AST_JSON_FORMAT_VERSION, ast: stmtJSON(statement) };
}

/**
 * Formats statements the way ClickHouse's `EXPLAIN AST json = 1` does: one
 * pretty-printed JSON document per statement, separated by blank lines.
 *
 * The output mirrors the v1 JSON contract of the upstream ClickHouse PR
 * (https://github.com/peter-leonov-ch/ClickHouse/pull/1, see its `AST.md`):
 * `type` carries the ClickHouse AST class id, sub-nodes appear under
 * snake_case named slots, operators are ordinary functions marked with
 * `is_operator`, expression lists are inlined, and absent optional slots are
 * omitted.
 */
export function formatExplainJSON(statements: Statement[]): string {
  StatementsSchema.parse(statements);
  return statements.map((s) => JSON.stringify(explainJSON(s), null, 2)).join('\n\n');
}
