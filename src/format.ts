import {
  CTE,
  ColumnTransformer,
  ExplainStatement,
  Expression,
  FunctionCall,
  FromExpr,
  IntersectStatement,
  InterpolateItem,
  JoinConstraint,
  Literal,
  OrderByItem,
  SampleClause,
  SampleRatioValue,
  SelectStatement,
  SetStatement,
  SettingItem,
  Statement,
  StatementsSchema,
  SubqueryFrom,
  SystemStatement,
  TableFunctionRef,
  TableRef,
  UnionStatement,
  UsingColumn,
  UseStatement,
  WindowSpec,
} from './ast';

// Keywords that cannot be used as bare identifiers (must be backtick-quoted)
const KEYWORDS = new Set([
  'SELECT',
  'FROM',
  'WHERE',
  'PREWHERE',
  'GROUP',
  'HAVING',
  'ORDER',
  'BY',
  'LIMIT',
  'OFFSET',
  'WITH',
  'ASC',
  'AS',
  'AND',
  'OR',
  'DESC',
  'NULL',
  'NOT',
  'INTERSECT',
  'INTO',
  'IN',
  'DISTINCT',
  'JOIN',
  'ON',
  'USING',
  'FINAL',
  'SETTINGS',
  'UNION',
  'ILIKE',
  'LIKE',
  'BETWEEN',
  'ALL',
  'ANY',
  'EXCEPT',
  'WINDOW',
  'OVER',
  'QUALIFY',
  'SAMPLE',
  'FORMAT',
  'SET',
  'USE',
  'SYSTEM',
  'EXPLAIN',
  'LEFT',
  'RIGHT',
  'INNER',
  'FULL',
  'CROSS',
  'PASTE',
  'ARRAY',
  'GLOBAL',
  'IS',
  'TRUE',
  'FALSE',
  'INF',
  'NAN',
  'TOP',
  'DIV',
  'MOD',
  'FETCH',
  'NEXT',
  'ROW',
  'ROWS',
  'ONLY',
  'TIES',
  'CASE',
  'WHEN',
  'THEN',
  'ELSE',
  'END',
  'INTERVAL',
  'COLUMNS',
  'APPLY',
  'REPLACE',
  'STRICT',
  'PARTITION',
  'RANGE',
  'GROUPS',
  'UNBOUNDED',
  'PRECEDING',
  'FOLLOWING',
  'CURRENT',
  'TOTALS',
  'ROLLUP',
  'CUBE',
  'PREWHERE',
  'RESPECT',
  'IGNORE',
  'NULLS',
  'FIRST',
  'LAST',
  'COLLATE',
  'FILL',
  'STEP',
  'STALENESS',
  'INTERPOLATE',
  'EXISTS',
  'ISNULL',
]);

// Quote an identifier with backticks if it needs quoting
function quoteIdent(s: string): string {
  // Query parameters ({name:type}) should pass through as-is
  if (s.startsWith('{') && s.endsWith('}') && s.includes(':')) return s;
  // Valid bare identifier: starts with letter/underscore, contains only alphanum/underscore/$
  if (/^[a-zA-Z_][a-zA-Z0-9_$]*$/.test(s) && !KEYWORDS.has(s.toUpperCase())) {
    return s;
  }
  // Backtick-quote: escape backticks by doubling them and backslashes by doubling them
  return '`' + s.replace(/\\/g, '\\\\').replace(/`/g, '``') + '`';
}

// Escape a string value for output inside single quotes
function escapeString(s: string): string {
  return s.replace(/'/g, "''");
}

export function format(statements: Statement[]): string {
  StatementsSchema.parse(statements);
  return statements.map((s) => formatStatement(s, '') + ';').join('\n\n');
}

function formatStatement(stmt: Statement, indent: string): string {
  if (stmt.kind === 'union') {
    return formatUnionStatement(stmt, indent);
  }
  if (stmt.kind === 'intersect') {
    return formatIntersectStatement(stmt, indent);
  }
  if (stmt.kind === 'explain') {
    return formatExplainStatement(stmt, indent);
  }
  if (stmt.kind === 'set') {
    return formatSetStatement(stmt, indent);
  }
  if (stmt.kind === 'use') {
    return formatUseStatement(stmt, indent);
  }
  if (stmt.kind === 'system') {
    return formatSystemStatement(stmt, indent);
  }
  return formatSelectStatement(stmt, indent);
}

function formatSetStatement(stmt: SetStatement, indent: string): string {
  const items = stmt.settings.map((s) => `${s.name} = ${formatExpr(s.value, indent)}`).join(', ');
  return `${indent}SET ${items}`;
}

function formatUseStatement(stmt: UseStatement, indent: string): string {
  return `${indent}USE ${stmt.database}`;
}

function formatSystemStatement(stmt: SystemStatement, indent: string): string {
  return `${indent}SYSTEM ${stmt.body}`;
}

function formatExplainStatement(stmt: ExplainStatement, indent: string): string {
  const parts = [`${indent}EXPLAIN`];
  if (stmt.explainType) parts.push(stmt.explainType);
  if (stmt.settings && stmt.settings.length > 0) {
    parts.push(stmt.settings.map((s) => `${s.name} = ${formatExpr(s.value, indent)}`).join(', '));
  }
  const header = parts.join(' ');
  let result = header;
  if (stmt.query) {
    result += '\n' + formatStatement(stmt.query, indent);
  }
  result += formatTrailingClauses(stmt, indent);
  return result;
}

function formatUnionStatement(stmt: UnionStatement, indent: string): string {
  const mode = stmt.unionMode === 'DISTINCT' ? 'UNION DISTINCT' : 'UNION ALL';
  let result = stmt.queries
    .map((q) => {
      const s = formatStatement(q, indent);
      // Wrap nested unions/intersects in parentheses to preserve nesting structure
      if (q.kind === 'union' || q.kind === 'intersect') return `(${s})`;
      if (q.kind === 'select' && q.parenthesized) return `(${s})`;
      return s;
    })
    .join(`\n${indent}${mode}\n`);
  result += formatTrailingClauses(stmt, indent);
  return result;
}

function formatIntersectStatement(stmt: IntersectStatement, indent: string): string {
  const leftStr = formatStatement(stmt.left, indent);
  const rightStr = formatStatement(stmt.right, indent);
  // Wrap parenthesized selects and nested intersect/except to preserve structure
  const wrapIntersectChild = (s: Statement, str: string) => {
    if (s.kind === 'intersect') return `(${str})`;
    if (s.kind === 'select' && s.parenthesized) return `(${str})`;
    if (s.kind === 'union') return `(${str})`;
    return str;
  };
  let result = `${wrapIntersectChild(stmt.left, leftStr)}\n${stmt.op}\n${wrapIntersectChild(stmt.right, rightStr)}`;
  result += formatTrailingClauses(stmt, indent);
  return result;
}

// Format trailing INTO OUTFILE, FORMAT, and SETTINGS clauses shared by select/union/intersect/explain
function formatSettingsList(settings: SettingItem[], indent: string): string {
  return settings.map((s) => `${s.name} = ${formatExpr(s.value, indent)}`).join(', ');
}

function formatTrailingClauses(
  stmt: {
    intoOutfile?: Literal;
    preFormatSettings?: SettingItem[];
    format?: string;
    postFormatSettings?: SettingItem[];
  },
  indent: string,
): string {
  let result = '';
  if (stmt.intoOutfile) {
    result += `\n${indent}INTO OUTFILE '${escapeString(stmt.intoOutfile.value)}'`;
  }
  if (stmt.preFormatSettings && stmt.preFormatSettings.length > 0) {
    result += `\n${indent}SETTINGS ${formatSettingsList(stmt.preFormatSettings, indent)}`;
  }
  if (stmt.format) {
    result += `\n${indent}FORMAT ${stmt.format}`;
  }
  if (stmt.postFormatSettings && stmt.postFormatSettings.length > 0) {
    result += `\n${indent}SETTINGS ${formatSettingsList(stmt.postFormatSettings, indent)}`;
  }
  return result;
}

// Check if an expression has the parenthesized flag set
function isParenthesized(expr: Expression): boolean {
  return 'parenthesized' in expr && expr.parenthesized === true;
}

// Operator precedence levels for binary/nary expressions
function opPrecedence(op: string): number {
  switch (op) {
    case 'OR':
      return 1;
    case 'AND':
      return 2;
    case '=':
    case '!=':
    case '<>':
    case '==':
    case '<':
    case '>':
    case '<=':
    case '>=':
    case '<=>':
    case 'IS DISTINCT FROM':
      return 3;
    case '+':
    case '-':
      return 4;
    case '*':
    case '/':
    case '%':
    case 'DIV':
    case 'MOD':
      return 5;
    default:
      return 100;
  }
}

function exprPrecedence(expr: Expression): number {
  if (expr.kind === 'binaryExpr') return opPrecedence(expr.op);
  if (expr.kind === 'naryExpr') return opPrecedence(expr.op);
  return 100;
}

// Format NOT in high-precedence form: NOT(inner) parsed by PrimaryBase
function formatNotHighPrec(expr: Expression, indent: string): string {
  if (expr.kind !== 'unaryExpr') return formatExpr(expr, indent);
  const inner = formatExpr(expr.expr, indent);
  let result = `NOT(${inner})`;
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

// Wrap a child expression with parentheses if needed for operator precedence
function wrapChild(child: Expression, parentOp: string, isRight: boolean, indent: string): string {
  // NOT in arithmetic/comparison contexts needs context-dependent formatting:
  // - Grammar AddExpr right side uses NotPrefixExpr (splits NOT from parens, inner gets parenthesized via ParenExpr)
  // - Grammar MulExpr uses UnaryExpr → PrimaryBase (NOT(expr) is atomic, no extra parenthesized)
  // - Grammar CompareRightExpr uses KW_NOT prefix (NOT expr space form works)
  if (child.kind === 'unaryExpr' && !isParenthesized(child)) {
    const parentPrec = opPrecedence(parentOp);
    // Left side of prec >= 3 (comparison/arithmetic): use NOT(inner) via PrimaryBase
    // Right side of prec 5 (*/% DIV MOD): use NOT(inner) via PrimaryBase
    if ((!isRight && parentPrec >= 3) || (isRight && parentPrec >= 5)) {
      return formatNotHighPrec(child, indent);
    }
    // Right side of +/- (prec 4): use space form (NotPrefixExpr handles it)
    // Right side of comparison (prec 3): use space form (CompareRightExpr handles it)
    // AND/OR (prec 1-2): use space form (NotExpr handles it)
  }
  const s = formatExpr(child, indent);
  if (child.kind === 'alias') return `(${s})`;
  const parentPrec = opPrecedence(parentOp);
  const childPrec = exprPrecedence(child);
  // Left child: wrap if strictly lower precedence
  // Right child: wrap if lower or equal precedence (to preserve left-associativity)
  if (isRight ? childPrec <= parentPrec : childPrec < parentPrec) {
    return `(${s})`;
  }
  return s;
}

// Wrap naryExpr operand: wrap if same-op naryExpr (to prevent flattening),
// lower-precedence expression, or alias
function wrapNaryOperand(operand: Expression, parentOp: string, indent: string): string {
  const s = formatExpr(operand, indent);
  if (operand.kind === 'alias') return `(${s})`;
  // Wrap same-op children to prevent flattening
  if (operand.kind === 'naryExpr' && operand.op === parentOp) return `(${s})`;
  // Wrap lower-precedence children (e.g., OR inside AND)
  const childPrec = exprPrecedence(operand);
  const parentPrec = opPrecedence(parentOp);
  if (childPrec < parentPrec) return `(${s})`;
  return s;
}

function formatExpr(expr: Expression, indent: string): string {
  // Handle parenthesized flag on any expression type
  const parenthesized = isParenthesized(expr);

  let result: string;
  switch (expr.kind) {
    case 'literal': {
      if (expr.type === 'String') {
        result = `'${escapeString(expr.value)}'`;
      } else if (expr.type === 'Bool') {
        result = expr.value === '1' ? 'true' : 'false';
      } else if (expr.source) {
        // Use original source text for literals that can't round-trip (hex floats, -0, overflow ints)
        result = expr.source;
      } else {
        result = expr.value;
      }
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'columnRef':
      result = expr.parts.map(quoteIdent).join('.');
      if (parenthesized) result = `(${result})`;
      return result;
    case 'asterisk': {
      result =
        '*' +
        (expr.transformers
          ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
          : '');
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'qualifiedAsterisk':
      return (
        `${expr.parts.map(quoteIdent).join('.')}.*` +
        (expr.transformers
          ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
          : '')
      );
    case 'tupleExpansion':
      return (
        `${formatExpr(expr.expr, indent)}.*` +
        (expr.transformers
          ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
          : '')
      );
    case 'columnsExpr': {
      const argsStr = expr.args.map((a) => formatExpr(a, indent)).join(', ');
      const base = `${expr.qualifier ? quoteIdent(expr.qualifier) + '.' : ''}COLUMNS(${argsStr})`;
      return (
        base +
        (expr.transformers
          ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
          : '')
      );
    }
    case 'queryParam':
      return `{${expr.name}: ${expr.type}}`;
    case 'alias': {
      // MySQL global variables (@@varname) are formatted as @@varname directly
      if (expr.alias.startsWith('@@')) return expr.alias;
      const aliasStr = quoteIdent(expr.alias);
      // Wrap lambda expressions in parens so AS binds to the lambda, not its body
      const innerStr =
        expr.expr.kind === 'lambdaExpr'
          ? `(${formatExpr(expr.expr, indent)})`
          : formatExpr(expr.expr, indent);
      result = `${innerStr} AS ${aliasStr}`;
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'array': {
      result =
        expr.source !== undefined
          ? expr.source
          : `[${expr.elements.map((e) => formatExpr(e, indent)).join(', ')}]`;
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'tuple': {
      result =
        expr.source !== undefined
          ? expr.source
          : `(${expr.elements.map((e) => formatExpr(e, indent)).join(', ')})`;
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'functionCall': {
      result = formatFunctionCall(expr, indent);
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'castExpr':
      if (expr.operator) {
        // :: binds very tightly - wrap binary/nary/unary/in expressions
        const inner = expr.expr;
        let innerStr: string;
        if (
          inner.kind === 'binaryExpr' ||
          inner.kind === 'naryExpr' ||
          inner.kind === 'unaryExpr' ||
          inner.kind === 'inExpr' ||
          inner.kind === 'alias'
        ) {
          innerStr = `(${formatExpr(inner, indent)})`;
        } else {
          innerStr = formatExpr(inner, indent);
        }
        result = `${innerStr}::${expr.type}`;
      } else {
        // If the inner expression is a nested alias (alias wrapping alias), wrap the inner alias
        // in parens to avoid ambiguous AS clauses: CAST((X AS lhs) rhs AS UInt32)
        let castInner = formatExpr(expr.expr, indent);
        if (expr.expr.kind === 'alias' && expr.expr.expr.kind === 'alias') {
          // Wrap the inner-most alias chain in parens
          const innerAlias = expr.expr;
          castInner = `(${formatExpr(innerAlias.expr, indent)}) AS ${quoteIdent(innerAlias.alias)}`;
        }
        result = `CAST(${castInner} AS ${expr.type})`;
      }
      if (parenthesized) result = `(${result})`;
      return result;
    case 'lambdaExpr':
      if (expr.params.length === 1) {
        result = `${expr.params[0]} -> ${formatExpr(expr.body, indent)}`;
      } else {
        result = `(${expr.params.join(', ')}) -> ${formatExpr(expr.body, indent)}`;
      }
      if (parenthesized) result = `(${result})`;
      return result;
    case 'unaryExpr': {
      // NOT formatting depends on inner expression type:
      // - Simple (literal, columnRef, functionCall, castExpr, etc.): NOT inner (space form, low precedence)
      // - Complex (AND/OR, tuple, alias, subquery): NOT(inner) (PrimaryBase form, high precedence)
      // The NOT(inner) form uses PrimaryBase's KW_NOT "(" ExpressionWithImplicitAlias ")" rule
      const inner = formatExpr(expr.expr, indent);
      const innerPrec = exprPrecedence(expr.expr);
      if (
        innerPrec <= 2 ||
        expr.expr.kind === 'tuple' ||
        expr.expr.kind === 'alias' ||
        expr.expr.kind === 'subqueryExpr'
      ) {
        result = `NOT(${inner})`;
      } else {
        result = `NOT ${inner}`;
      }
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'binaryExpr':
      result = `${wrapChild(expr.left, expr.op, false, indent)} ${expr.op} ${wrapChild(expr.right, expr.op, true, indent)}`;
      if (parenthesized) result = `(${result})`;
      return result;
    case 'naryExpr':
      result = expr.operands
        .map((o) => wrapNaryOperand(o, expr.op, indent))
        .join(`\n${indent}${expr.op} `);
      if (parenthesized) result = `(${result})`;
      return result;
    case 'subqueryExpr': {
      const innerIndent = indent + '    ';
      return `(\n${formatStatement(expr.query, innerIndent)}\n${indent})`;
    }
    case 'inExpr': {
      const op = expr.global
        ? expr.negated
          ? 'GLOBAL NOT IN'
          : 'GLOBAL IN'
        : expr.negated
          ? 'NOT IN'
          : 'IN';
      // Wrap the IN's expr if it's an alias, lambda, or nested IN to preserve parse structure
      const inExprStr =
        expr.expr.kind === 'alias' || expr.expr.kind === 'lambdaExpr' || expr.expr.kind === 'inExpr'
          ? `(${formatExpr(expr.expr, indent)})`
          : formatExpr(expr.expr, indent);
      if (Array.isArray(expr.values)) {
        result = `${inExprStr} ${op} (${expr.values.map((v) => formatExpr(v, indent)).join(', ')})`;
      } else {
        const innerIndent = indent + '    ';
        result = `${inExprStr} ${op} (\n${formatStatement(expr.values.query, innerIndent)}\n${indent})`;
      }
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'jsonSubcolumn': {
      // Backtick-quote the type if it contains characters that require quoting (parens, spaces, etc.)
      const needsQuoting = /[^a-zA-Z0-9_]/.test(expr.type);
      const typeStr = needsQuoting ? `\`${expr.type}\`` : expr.type;
      result = `${formatExpr(expr.expr, indent)}.:${typeStr}`;
      if (expr.path && expr.path.length > 0) {
        result +=
          '.' + expr.path.map((p: string) => (/[^a-zA-Z0-9_]/.test(p) ? `\`${p}\`` : p)).join('.');
      }
      return result;
    }
  }
}

function formatFunctionCall(expr: FunctionCall, indent: string): string {
  // Quote function name if it contains special characters
  const funcName = /^[a-zA-Z_][a-zA-Z0-9_]*$/.test(expr.name)
    ? expr.name
    : `\`${expr.name.replace(/`/g, '``')}\``;
  // NOT(tuple) — from PrimaryBase KW_NOT TupleLiteral rule
  if (expr.name === 'not' && expr.args.length === 1 && expr.args[0].kind === 'tuple') {
    const tuple = expr.args[0];
    if (tuple.source !== undefined) return `NOT${tuple.source}`;
    return `NOT(${tuple.elements.map((e) => formatExpr(e, indent)).join(', ')})`;
  }
  if (expr.name === 'arrayElement' && expr.args.length === 2) {
    const base =
      expr.args[0].kind === 'alias'
        ? `(${formatExpr(expr.args[0], indent)})`
        : formatExpr(expr.args[0], indent);
    return `${base}[${formatExpr(expr.args[1], indent)}]`;
  }
  if (expr.name === 'tupleElement' && expr.args.length === 2) {
    return formatTupleElement(expr.args[0], expr.args[1], indent);
  }
  let call: string;
  const settingsStr =
    expr.funcSettings && expr.funcSettings.length > 0
      ? ` SETTINGS ${formatSettingsList(expr.funcSettings, indent)}`
      : '';
  if (expr.params) {
    call = `${funcName}(${expr.params.map((p) => formatExpr(p, indent)).join(', ')})(${expr.args.map((a) => formatExpr(a, indent)).join(', ')}${settingsStr})`;
  } else {
    call = `${funcName}(${expr.args.map((a) => formatExpr(a, indent)).join(', ')}${settingsStr})`;
  }
  if (expr.window) {
    call += ` OVER (${formatWindowSpec(expr.window, indent)})`;
  }
  return call;
}

// Format tupleElement(expr, index) as expr.N, expr.-N, or tupleElement(expr, arg)
// Named field access (expr.name) is NOT used because the parser re-parses it as columnRef
function formatTupleElement(base: Expression, index: Expression, indent: string): string {
  // Alias base requires parens for dot access (e.g. (tuple(...) AS x).1), which would
  // introduce a parenthesized flag on re-parse. Fall back to function call form instead.
  if (base.kind === 'alias') {
    return `tupleElement(${formatExpr(base, indent)}, ${formatExpr(index, indent)})`;
  }
  const baseStr = formatExpr(base, indent);
  if (index.kind === 'literal' && index.type === 'UInt64') {
    // expr.N (numeric index)
    return `${baseStr}.${index.value}`;
  }
  if (
    index.kind === 'functionCall' &&
    index.name === 'negate' &&
    index.args.length === 1 &&
    index.args[0].kind === 'literal' &&
    index.args[0].type === 'UInt64'
  ) {
    // expr.-N (negative index)
    return `${baseStr}.-${index.args[0].value}`;
  }
  // Fallback: function call form (for string index and complex expressions)
  return `tupleElement(${formatExpr(base, indent)}, ${formatExpr(index, indent)})`;
}

function formatWindowSpec(spec: WindowSpec, indent: string): string {
  const parts: string[] = [];
  if (spec.partitionBy && spec.partitionBy.length > 0) {
    parts.push(`PARTITION BY ${spec.partitionBy.map((e) => formatExpr(e, indent)).join(', ')}`);
  }
  if (spec.orderBy && spec.orderBy.length > 0) {
    parts.push(
      `ORDER BY ${spec.orderBy.map((item) => formatOrderByItemInline(item, indent)).join(', ')}`,
    );
  }
  if (spec.frame) {
    const frameType = spec.frame.frameType.toUpperCase();
    const start = formatFrameBound(spec.frame.start, indent);
    if (spec.frame.end) {
      const end = formatFrameBound(spec.frame.end, indent);
      parts.push(`${frameType} BETWEEN ${start} AND ${end}`);
    } else {
      parts.push(`${frameType} ${start}`);
    }
  }
  return parts.join(' ');
}

function formatFrameBound(bound: { kind: string; expr?: Expression }, indent: string): string {
  switch (bound.kind) {
    case 'unbounded':
      return 'UNBOUNDED PRECEDING';
    case 'currentRow':
      return 'CURRENT ROW';
    case 'preceding':
      return `${formatExpr(bound.expr!, indent)} PRECEDING`;
    case 'following':
      return `${formatExpr(bound.expr!, indent)} FOLLOWING`;
    default:
      return '';
  }
}

function formatTransformer(t: ColumnTransformer, indent: string): string {
  if (t.kind === 'except') {
    const strict = t.strict ? 'STRICT ' : '';
    if (t.pattern) {
      return `EXCEPT(${t.columns.map((c) => `'${escapeString(c)}'`).join(', ')})`;
    }
    return `EXCEPT ${strict}(${t.columns.map(quoteIdent).join(', ')})`;
  }
  if (t.kind === 'apply') {
    return `APPLY(${formatExpr(t.func, indent)})`;
  }
  // replace
  const strict = t.strict ? 'STRICT ' : '';
  const items = t.items
    .map((item) => `${formatExpr(item.expr, indent)} AS ${quoteIdent(item.alias)}`)
    .join(', ');
  return `REPLACE ${strict}(${items})`;
}

function formatSampleRatioValue(ratio: SampleRatioValue): string {
  return ratio.den !== undefined ? `${ratio.num}/${ratio.den}` : ratio.num;
}

function formatSampleClause(sample: SampleClause): string {
  let s = `SAMPLE ${formatSampleRatioValue(sample.ratio)}`;
  if (sample.offset !== undefined) {
    s += ` OFFSET ${formatSampleRatioValue(sample.offset)}`;
  }
  return s;
}

function formatTableRef(ref: TableRef): string {
  const db = ref.database ? quoteIdent(ref.database) : undefined;
  const tbl = quoteIdent(ref.table);
  const id = db ? `${db}.${tbl}` : tbl;
  let result = id;
  if (ref.alias) result += ` AS ${quoteIdent(ref.alias)}`;
  if (ref.final) result += ' FINAL';
  if (ref.sample) result += ` ${formatSampleClause(ref.sample)}`;
  return result;
}

function formatTableFunction(ref: TableFunctionRef, indent: string): string {
  const args = ref.args.map((a) => formatExpr(a, indent)).join(', ');
  const settingsStr =
    ref.settings && ref.settings.length > 0
      ? ` SETTINGS ${formatSettingsList(ref.settings, indent)}`
      : '';
  let base = `${ref.name}(${args}${settingsStr})`;
  if (ref.alias) base += ` AS ${quoteIdent(ref.alias)}`;
  if (ref.final) base += ' FINAL';
  if (ref.sample) base += ` ${formatSampleClause(ref.sample)}`;
  return base;
}

function formatSubqueryFrom(from: SubqueryFrom, indent: string): string {
  const innerIndent = indent + '    ';
  let aliasStr = from.alias ? ` AS ${quoteIdent(from.alias)}` : '';
  if (from.columnAliases && from.columnAliases.length > 0) {
    aliasStr += ` (${from.columnAliases.map(quoteIdent).join(', ')})`;
  }
  const queryStr = formatStatement(from.query, innerIndent);
  // Wrap parenthesized selects in extra parens: ((SELECT ...))
  const innerParen = from.query.kind === 'select' && from.query.parenthesized;
  let result = innerParen
    ? `((\n${queryStr}\n${indent}))${aliasStr}`
    : `(\n${queryStr}\n${indent})${aliasStr}`;
  if (from.final) result += ' FINAL';
  if (from.sample) result += ` ${formatSampleClause(from.sample)}`;
  return result;
}

function formatUsingColumn(col: UsingColumn): string {
  if (typeof col === 'string') return col === '*' ? '*' : quoteIdent(col);
  return `${quoteIdent(col.name)} AS ${quoteIdent(col.alias)}`;
}

function formatJoinConstraint(constraint: JoinConstraint, indent: string): string {
  if (constraint.kind === 'on') {
    return `${indent}ON ${formatExpr(constraint.expr, indent)}`;
  }
  if (constraint.columns.length === 1 && constraint.columns[0] === '*') {
    return `${indent}USING *`;
  }
  return `${indent}USING (${constraint.columns.map(formatUsingColumn).join(', ')})`;
}

function formatFromAtom(from: TableRef | SubqueryFrom | TableFunctionRef, indent: string): string {
  if (from.kind === 'subqueryFrom') return formatSubqueryFrom(from, indent);
  if (from.kind === 'tableFunction') return formatTableFunction(from, indent);
  return formatTableRef(from);
}

function formatFromExpr(from: FromExpr, outerIndent: string): string[] {
  const innerIndent = outerIndent + '    ';
  if (from.kind === 'tableRef') {
    return [`${innerIndent}${formatTableRef(from)}`];
  }
  if (from.kind === 'subqueryFrom') {
    return [`${innerIndent}${formatSubqueryFrom(from, innerIndent)}`];
  }
  if (from.kind === 'tableFunction') {
    return [`${innerIndent}${formatTableFunction(from, innerIndent)}`];
  }
  if (from.kind === 'join') {
    const leftLines = formatFromExpr(from.left, outerIndent);
    const rightStr = formatFromAtom(from.right, innerIndent);
    const lines = [...leftLines, `${outerIndent}${from.joinType} JOIN ${rightStr}`];
    if (from.constraint) lines.push(formatJoinConstraint(from.constraint, innerIndent));
    return lines;
  }
  // arrayJoin
  const leftLines = formatFromExpr(from.left, outerIndent);
  const exprsStr = from.expressions.map((e) => formatExpr(e, innerIndent)).join(', ');
  return [...leftLines, `${outerIndent}${from.joinType} JOIN ${exprsStr}`];
}

function formatOrderByItemInline(item: OrderByItem, indent: string): string {
  let result = `${formatExpr(item.expr, indent)} ${item.direction}`;
  if (item.collate !== undefined) result += ` COLLATE '${escapeString(item.collate)}'`;
  return result;
}

function formatOrderByItem(item: OrderByItem, indent: string): string {
  let result = `${indent}${formatExpr(item.expr, indent)} ${item.direction}`;
  if (item.collate !== undefined) result += ` COLLATE '${escapeString(item.collate)}'`;
  if (
    item.fillFrom !== undefined ||
    item.fillTo !== undefined ||
    item.fillStep !== undefined ||
    item.fillStaleness !== undefined ||
    item.interpolate !== undefined
  ) {
    result += ' WITH FILL';
    if (item.fillFrom !== undefined) result += ` FROM ${formatExpr(item.fillFrom, indent)}`;
    if (item.fillTo !== undefined) result += ` TO ${formatExpr(item.fillTo, indent)}`;
    if (item.fillStep !== undefined) result += ` STEP ${formatExpr(item.fillStep, indent)}`;
    if (item.fillStaleness !== undefined)
      result += ` STALENESS ${formatExpr(item.fillStaleness, indent)}`;
    if (item.interpolate !== undefined) {
      result += ` INTERPOLATE (${item.interpolate.map((i) => formatInterpolateItem(i, indent)).join(', ')})`;
    }
  }
  return result;
}

function formatInterpolateItem(item: InterpolateItem, indent: string): string {
  if (item.expr) return `${item.col} AS ${formatExpr(item.expr, indent)}`;
  return item.col;
}

function formatCTEBlock(ctes: CTE[], indent: string): string {
  const innerIndent = indent + '    ';
  const parts: string[] = [];

  for (let i = 0; i < ctes.length; i++) {
    const cte = ctes[i];
    const prefix = i === 0 ? `${indent}WITH ` : `${indent}`;
    if (cte.kind === 'expr') {
      const suffix = i < ctes.length - 1 ? ',' : '';
      parts.push(
        `${prefix}${formatExpr(cte.expr, innerIndent)} AS ${quoteIdent(cte.name)}${suffix}`,
      );
    } else {
      const suffix = i < ctes.length - 1 ? '),' : ')';
      parts.push(
        `${prefix}${quoteIdent(cte.name)} AS (\n` +
          formatStatement(cte.query, innerIndent) +
          `\n${indent}${suffix}`,
      );
    }
  }

  return parts.join('\n\n');
}

function formatSelectStatement(stmt: SelectStatement, indent: string): string {
  const innerIndent = indent + '    ';
  const lines: string[] = [];

  if (stmt.with && stmt.with.length > 0) {
    lines.push(formatCTEBlock(stmt.with, indent));
    lines.push('');
  }

  const distinctStr = stmt.distinct
    ? stmt.distinct.kind === 'distinctOn'
      ? ` DISTINCT ON (${stmt.distinct.on.map((e) => formatExpr(e, innerIndent)).join(', ')})`
      : ' DISTINCT'
    : '';
  if (stmt.select.length === 1) {
    lines.push(`${indent}SELECT${distinctStr} ${formatExpr(stmt.select[0], innerIndent)}`);
  } else {
    lines.push(`${indent}SELECT${distinctStr}`);
    lines.push(stmt.select.map((e) => `${innerIndent}${formatExpr(e, innerIndent)}`).join(',\n'));
  }

  if (stmt.from) {
    const fromLines = formatFromExpr(stmt.from, indent);
    if (fromLines.length === 1) {
      lines.push(`${indent}FROM ${fromLines[0].trimStart()}`);
    } else {
      lines.push(`${indent}FROM`);
      for (const line of fromLines) lines.push(line);
    }
  }

  if (stmt.prewhere) {
    lines.push(`${indent}PREWHERE ${formatExpr(stmt.prewhere, innerIndent)}`);
  }

  if (stmt.where) {
    lines.push(`${indent}WHERE ${formatExpr(stmt.where, innerIndent)}`);
  }

  if (stmt.groupBy) {
    switch (stmt.groupBy.kind) {
      case 'all':
        lines.push(`${indent}GROUP BY ALL`);
        break;
      case 'groupingSets': {
        const setsStr = stmt.groupBy.sets
          .map((set) => `(${set.map((e) => formatExpr(e, innerIndent)).join(', ')})`)
          .join(', ');
        lines.push(`${indent}GROUP BY GROUPING SETS (${setsStr})`);
        break;
      }
      case 'expressions':
        if (stmt.groupBy.items.length === 1) {
          lines.push(`${indent}GROUP BY ${formatExpr(stmt.groupBy.items[0], innerIndent)}`);
        } else {
          lines.push(`${indent}GROUP BY`);
          lines.push(
            stmt.groupBy.items
              .map((e) => `${innerIndent}${formatExpr(e, innerIndent)}`)
              .join(',\n'),
          );
        }
        break;
    }
  }
  if (stmt.withCube) lines.push(`${indent}WITH CUBE`);
  if (stmt.withRollup) lines.push(`${indent}WITH ROLLUP`);
  if (stmt.withTotals) lines.push(`${indent}WITH TOTALS`);

  if (stmt.having) {
    lines.push(`${indent}HAVING ${formatExpr(stmt.having, innerIndent)}`);
  }

  if (stmt.orderBy && stmt.orderBy.length > 0) {
    if (stmt.orderBy.length === 1) {
      lines.push(
        `${indent}ORDER BY ${formatOrderByItem(stmt.orderBy[0], innerIndent).trimStart()}`,
      );
    } else {
      lines.push(`${indent}ORDER BY`);
      lines.push(stmt.orderBy.map((item) => formatOrderByItem(item, innerIndent)).join(',\n'));
    }
  }

  if (stmt.limitBy) {
    const limitByOffset = stmt.limitBy.offset ? `${formatExpr(stmt.limitBy.offset, indent)}, ` : '';
    const byClause =
      stmt.limitBy.by.length === 0
        ? 'ALL'
        : stmt.limitBy.by.map((e) => formatExpr(e, indent)).join(', ');
    lines.push(
      `${indent}LIMIT ${limitByOffset}${formatExpr(stmt.limitBy.count, indent)} BY ${byClause}`,
    );
  }

  if (stmt.limit) {
    const lim = stmt.limit;
    if (lim.commaSyntax && stmt.offset) {
      const tiesStr = lim.withTies ? ' WITH TIES' : '';
      lines.push(
        `${indent}LIMIT ${formatExpr(lim.count, indent)}, ${formatExpr(stmt.offset, indent)}${tiesStr}`,
      );
    } else {
      const tiesStr = lim.withTies ? ' WITH TIES' : '';
      lines.push(`${indent}LIMIT ${formatExpr(lim.count, indent)}${tiesStr}`);
      if (stmt.offset) lines.push(`${indent}OFFSET ${formatExpr(stmt.offset, indent)}`);
    }
  } else if (stmt.offset) {
    lines.push(`${indent}OFFSET ${formatExpr(stmt.offset, indent)}`);
  }

  if (stmt.windows && stmt.windows.length > 0) {
    if (stmt.windows.length === 1) {
      const w = stmt.windows[0];
      lines.push(`${indent}WINDOW ${quoteIdent(w.name)} AS (${w.body})`);
    } else {
      lines.push(`${indent}WINDOW`);
      lines.push(
        stmt.windows.map((w) => `${innerIndent}${quoteIdent(w.name)} AS (${w.body})`).join(',\n'),
      );
    }
  }

  if (stmt.qualify) {
    lines.push(`${indent}QUALIFY ${formatExpr(stmt.qualify, innerIndent)}`);
  }

  if (stmt.settings && stmt.settings.length > 0) {
    if (stmt.settings.length === 1) {
      const s = stmt.settings[0];
      lines.push(`${indent}SETTINGS ${s.name} = ${formatExpr(s.value, innerIndent)}`);
    } else {
      lines.push(`${indent}SETTINGS`);
      lines.push(
        stmt.settings
          .map((s) => `${innerIndent}${s.name} = ${formatExpr(s.value, innerIndent)}`)
          .join(',\n'),
      );
    }
  }

  let result = lines.join('\n');
  result += formatTrailingClauses(stmt, indent);
  return result;
}
