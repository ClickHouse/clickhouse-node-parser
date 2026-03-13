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

// Accumulates trailing comments from the very last expression of a statement.
// These must be placed after the semicolon to avoid `;` being swallowed by the comment.
let _endComments: string[] = [];

// Flush pending end comments into the lines array (appended to last line).
// Call this when a new clause starts, meaning the previous end comments are no longer
// at the end of the statement and can be safely placed inline.
function flushEndComments(lines: string[]): void {
  if (_endComments.length > 0 && lines.length > 0) {
    lines[lines.length - 1] += ' ' + _endComments.join(' ');
    _endComments = [];
  }
}

export function format(statements: Statement[]): string {
  StatementsSchema.parse(statements);
  return statements
    .map((s) => {
      let result = '';
      if (s.leadingComments && s.leadingComments.length > 0) {
        result += s.leadingComments.join('\n') + '\n';
      }
      _endComments = [];
      result += formatStatement(s, '');
      // Flush any remaining end comments before the semicolon
      if (_endComments.length > 0) {
        result += ' ' + _endComments.join(' ');
        _endComments = [];
      }
      result += ';';
      if (s.trailingComments && s.trailingComments.length > 0) {
        result += ' ' + s.trailingComments[0];
        for (let i = 1; i < s.trailingComments.length; i++) {
          result += '\n' + s.trailingComments[i];
        }
      }
      return result;
    })
    .join('\n\n');
}

// Format a comma-separated list of expressions, reading leadingComments/trailingComments
// from each expression node. Returns [formatted string, end comments].
// End comments are trailing comments on the very last item — they must be placed after
// the statement's semicolon to avoid being swallowed by the comment.
function formatExprList(items: Expression[], indent: string): [string, string[]] {
  const parts: string[] = [];
  const endComments: string[] = [];
  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    const isLast = i === items.length - 1;
    const comma = isLast ? '' : ',';
    // Leading comments: on their own lines before the item
    if (item.leadingComments && item.leadingComments.length > 0) {
      for (const c of item.leadingComments) {
        parts.push(`${indent}${c}`);
      }
    }
    // Trailing comments on the last item are returned separately
    if (isLast && item.trailingComments && item.trailingComments.length > 0) {
      parts.push(`${indent}${formatExprCore(item, indent)}`);
      endComments.push(...item.trailingComments);
    } else if (item.trailingComments && item.trailingComments.length > 0) {
      parts.push(`${indent}${formatExprCore(item, indent)}${comma} ${item.trailingComments[0]}`);
      for (let c = 1; c < item.trailingComments.length; c++) {
        parts.push(`${indent}${item.trailingComments[c]}`);
      }
    } else {
      parts.push(`${indent}${formatExprCore(item, indent)}${comma}`);
    }
  }
  return [parts.join('\n'), endComments];
}

// Format a comma-separated list of expressions for function args.
// Uses inline format when no comments are present, multiline otherwise.
function formatArgList(items: Expression[], indent: string): string {
  const hasComments = items.some(
    (a) =>
      (a.leadingComments && a.leadingComments.length > 0) ||
      (a.trailingComments && a.trailingComments.length > 0),
  );
  if (!hasComments) {
    return items.map((a) => formatExprCore(a, indent)).join(', ');
  }
  const parts: string[] = [];
  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    const comma = i < items.length - 1 ? ',' : '';
    if (item.leadingComments && item.leadingComments.length > 0) {
      for (const c of item.leadingComments) {
        parts.push(`${indent}${c}`);
      }
    }
    if (item.trailingComments && item.trailingComments.length > 0) {
      parts.push(
        `${indent}${formatExprCore(item, indent)}${comma} ${item.trailingComments.join(' ')}`,
      );
    } else {
      parts.push(`${indent}${formatExprCore(item, indent)}${comma}`);
    }
  }
  return '\n' + parts.join('\n') + '\n';
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
  if (expr.kind !== 'unaryExpr') return formatExprCore(expr, indent);
  const inner = formatExprCore(expr.expr, indent);
  let result = `NOT(${inner})`;
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

// Wrap a child expression with parentheses if needed for operator precedence.
// Renders trailing comments inline after the expression (leading comments handled by caller).
function wrapChildCore(
  child: Expression,
  parentOp: string,
  isRight: boolean,
  indent: string,
): string {
  let s: string;
  if (child.kind === 'unaryExpr' && !isParenthesized(child)) {
    const parentPrec = opPrecedence(parentOp);
    if ((!isRight && parentPrec >= 3) || (isRight && parentPrec >= 5)) {
      s = formatNotHighPrec(child, indent);
    } else {
      s = formatExprCore(child, indent);
    }
  } else {
    s = formatExprCore(child, indent);
  }
  if (child.kind === 'alias') s = `(${s})`;
  else {
    const parentPrec = opPrecedence(parentOp);
    const childPrec = exprPrecedence(child);
    if (isRight ? childPrec <= parentPrec : childPrec < parentPrec) {
      s = `(${s})`;
    }
  }
  if (child.trailingComments && child.trailingComments.length > 0) {
    s += ' ' + child.trailingComments.join(' ');
  }
  return s;
}

// Wrap naryExpr operand, rendering trailing comments inline
function wrapNaryOperandCore(operand: Expression, parentOp: string, indent: string): string {
  let s = formatExprCore(operand, indent);
  if (operand.kind === 'alias') s = `(${s})`;
  else if (operand.kind === 'naryExpr' && operand.op === parentOp) s = `(${s})`;
  else {
    const childPrec = exprPrecedence(operand);
    const parentPrec = opPrecedence(parentOp);
    if (childPrec < parentPrec) s = `(${s})`;
  }
  if (operand.trailingComments && operand.trailingComments.length > 0) {
    s += ' ' + operand.trailingComments.join(' ');
  }
  return s;
}

// Format an expression with leading/trailing comments rendered.
// Leading comments appear on their own lines before the expression (indented).
// Trailing comments appear inline after the expression.
// Call sites that handle comments themselves (formatExprList, formatArgList,
// binaryExpr, naryExpr) should use formatExprCore instead.
function formatExpr(expr: Expression, indent: string): string {
  let result = formatExprCore(expr, indent);
  if (expr.leadingComments && expr.leadingComments.length > 0) {
    const comments = expr.leadingComments.map((c) => `${indent}${c}`).join('\n');
    result = comments + '\n' + indent + result;
  }
  if (expr.trailingComments && expr.trailingComments.length > 0) {
    result += ' ' + expr.trailingComments.join(' ');
  }
  return result;
}

// Format an expression without rendering its leading/trailing comments.
// Used by list formatters and operator cases that handle comments with their own layout.
function formatExprCore(expr: Expression, indent: string): string {
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
      return `{${expr.name}:${expr.type}}`;
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
    case 'binaryExpr': {
      let leftStr = wrapChildCore(expr.left, expr.op, false, indent);
      const rightStr = wrapChildCore(expr.right, expr.op, true, indent);
      // Render leading comments on the left operand
      if (expr.left.leadingComments && expr.left.leadingComments.length > 0) {
        const lc = expr.left.leadingComments.map((c) => `${indent}${c}`).join('\n');
        leftStr = lc + '\n' + indent + leftStr;
      }
      if (expr.right.leadingComments && expr.right.leadingComments.length > 0) {
        const bParts: string[] = [leftStr];
        for (const c of expr.right.leadingComments) {
          bParts.push(`${indent}${c}`);
        }
        bParts.push(`${indent}${expr.op} ${rightStr}`);
        result = bParts.join('\n');
      } else {
        result = `${leftStr} ${expr.op} ${rightStr}`;
      }
      if (parenthesized) result = `(${result})`;
      return result;
    }
    case 'naryExpr': {
      const parts: string[] = [];
      // Render leading comments on the first operand
      const first = expr.operands[0];
      if (first.leadingComments && first.leadingComments.length > 0) {
        for (const c of first.leadingComments) {
          parts.push(`${indent}${c}`);
        }
      }
      parts.push(wrapNaryOperandCore(first, expr.op, indent));
      for (let i = 1; i < expr.operands.length; i++) {
        const operand = expr.operands[i];
        if (operand.leadingComments && operand.leadingComments.length > 0) {
          for (const c of operand.leadingComments) {
            parts.push(`${indent}${c}`);
          }
        }
        parts.push(`${indent}${expr.op} ${wrapNaryOperandCore(operand, expr.op, indent)}`);
      }
      result = parts.join('\n');
      if (parenthesized) result = `(${result})`;
      return result;
    }
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
    call = `${funcName}(${formatArgList(expr.params, indent)})(${formatArgList(expr.args, indent)}${settingsStr})`;
  } else {
    call = `${funcName}(${formatArgList(expr.args, indent)}${settingsStr})`;
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
  if (ref.trailingComments && ref.trailingComments.length > 0) {
    result += ' ' + ref.trailingComments.join(' ');
  }
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
  if (ref.trailingComments && ref.trailingComments.length > 0) {
    base += ' ' + ref.trailingComments.join(' ');
  }
  return base;
}

function formatSubqueryFrom(from: SubqueryFrom, indent: string): string {
  const innerIndent = indent + '    ';
  let aliasStr = from.alias ? ` AS ${quoteIdent(from.alias)}` : '';
  if (from.columnAliases && from.columnAliases.length > 0) {
    aliasStr += ` (${from.columnAliases.map(quoteIdent).join(', ')})`;
  }
  let queryStr = formatStatement(from.query, innerIndent);
  // Flush any _endComments from the inner query
  if (_endComments.length > 0) {
    queryStr += ' ' + _endComments.join(' ');
    _endComments = [];
  }
  // Inner query trailing comments
  if (from.query.trailingComments && from.query.trailingComments.length > 0) {
    queryStr += ' ' + from.query.trailingComments.join(' ');
  }
  // Wrap parenthesized selects in extra parens: ((SELECT ...))
  const innerParen = from.query.kind === 'select' && from.query.parenthesized;
  // Inner query leading comments
  let leadingStr = '';
  if (from.query.leadingComments && from.query.leadingComments.length > 0) {
    leadingStr = from.query.leadingComments.map((c) => `${innerIndent}${c}`).join('\n') + '\n';
  }
  let result = innerParen
    ? `((\n${leadingStr}${queryStr}\n${indent}))${aliasStr}`
    : `(\n${leadingStr}${queryStr}\n${indent})${aliasStr}`;
  if (from.final) result += ' FINAL';
  if (from.sample) result += ` ${formatSampleClause(from.sample)}`;
  if (from.trailingComments && from.trailingComments.length > 0) {
    result += ' ' + from.trailingComments.join(' ');
  }
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

function formatFromLeadingComments(from: { leadingComments?: string[] }, indent: string): string[] {
  if (from.leadingComments && from.leadingComments.length > 0) {
    return from.leadingComments.map((c) => `${indent}${c}`);
  }
  return [];
}

function formatFromExpr(from: FromExpr, outerIndent: string): string[] {
  const innerIndent = outerIndent + '    ';
  if (from.kind === 'tableRef') {
    return [
      ...formatFromLeadingComments(from, innerIndent),
      `${innerIndent}${formatTableRef(from)}`,
    ];
  }
  if (from.kind === 'subqueryFrom') {
    return [
      ...formatFromLeadingComments(from, innerIndent),
      `${innerIndent}${formatSubqueryFrom(from, innerIndent)}`,
    ];
  }
  if (from.kind === 'tableFunction') {
    return [
      ...formatFromLeadingComments(from, innerIndent),
      `${innerIndent}${formatTableFunction(from, innerIndent)}`,
    ];
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
  const cteIndent = indent + '  ';
  const innerIndent = indent + '    ';
  const hasComments = ctes.some(
    (c) =>
      (c.leadingComments && c.leadingComments.length > 0) ||
      (c.trailingComments && c.trailingComments.length > 0),
  );

  // Non-comment path: preserve original formatting behavior
  if (!hasComments) {
    const parts: string[] = [];
    for (let i = 0; i < ctes.length; i++) {
      const cte = ctes[i];
      const prefix = i === 0 ? `${indent}WITH ` : `${indent}`;
      if (cte.kind === 'expr') {
        const suffix = i < ctes.length - 1 ? ',' : '';
        parts.push(
          `${prefix}${formatExprCore(cte.expr, innerIndent)} AS ${quoteIdent(cte.name)}${suffix}`,
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

  // Comment path: structured layout with CTE items at cteIndent
  const parts: string[] = [];
  for (let i = 0; i < ctes.length; i++) {
    const cte = ctes[i];
    const lines: string[] = [];
    const isFirst = i === 0;
    const isLast = i === ctes.length - 1;

    // CTE leading comments
    if (cte.leadingComments && cte.leadingComments.length > 0) {
      for (const c of cte.leadingComments) {
        lines.push(`${indent}${c}`);
      }
    }

    const trailingStr =
      cte.trailingComments && cte.trailingComments.length > 0
        ? ' ' + cte.trailingComments.join(' ')
        : '';

    if (cte.kind === 'subquery') {
      const suffix = isLast ? ')' : '),';
      const namePrefix = isFirst ? `${indent}WITH ` : `${cteIndent}`;
      lines.push(`${namePrefix}${quoteIdent(cte.name)} AS (`);

      // Inner query leading comments
      if (cte.query.leadingComments && cte.query.leadingComments.length > 0) {
        for (const c of cte.query.leadingComments) {
          lines.push(`${innerIndent}${c}`);
        }
      }

      let queryStr = formatStatement(cte.query, innerIndent);
      // Flush any _endComments from the inner query
      if (_endComments.length > 0) {
        queryStr += ' ' + _endComments.join(' ');
        _endComments = [];
      }
      // Inner query trailing comments (e.g., -- 4 after SELECT 1)
      if (cte.query.trailingComments && cte.query.trailingComments.length > 0) {
        queryStr += ' ' + cte.query.trailingComments.join(' ');
      }
      lines.push(queryStr);
      lines.push(`${indent}${suffix}${trailingStr}`);
    } else {
      // Expression CTE
      const suffix = isLast ? '' : ',';
      // Leading comments on the expression
      if (cte.expr.leadingComments && cte.expr.leadingComments.length > 0) {
        for (const c of cte.expr.leadingComments) {
          lines.push(`${cteIndent}${c}`);
        }
      }
      let exprStr = formatExprCore(cte.expr, cteIndent);
      // Trailing comments on the expression (between expr and AS)
      if (cte.expr.trailingComments && cte.expr.trailingComments.length > 0) {
        for (const c of cte.expr.trailingComments) {
          exprStr += `\n${cteIndent}${c}`;
        }
      }
      const exprPrefix = isFirst ? `${indent}WITH ` : `${cteIndent}`;
      const hasExprTrailing = cte.expr.trailingComments && cte.expr.trailingComments.length > 0;
      if (hasExprTrailing) {
        lines.push(
          `${exprPrefix}${exprStr}\n${cteIndent}AS ${quoteIdent(cte.name)}${suffix}${trailingStr}`,
        );
      } else {
        lines.push(`${exprPrefix}${exprStr} AS ${quoteIdent(cte.name)}${suffix}${trailingStr}`);
      }
    }

    parts.push(lines.join('\n'));
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
  const firstItemHasLeadingComments =
    stmt.select[0]?.leadingComments && stmt.select[0].leadingComments.length > 0;
  if (stmt.select.length === 1 && !firstItemHasLeadingComments) {
    const item = stmt.select[0];
    const selectLine = `${indent}SELECT${distinctStr} ${formatExprCore(item, innerIndent)}`;
    lines.push(selectLine);
    _endComments = item.trailingComments ? [...item.trailingComments] : [];
  } else {
    lines.push(`${indent}SELECT${distinctStr}`);
    const [text, endComments] = formatExprList(stmt.select, innerIndent);
    lines.push(text);
    _endComments = endComments;
  }

  if (stmt.from) {
    flushEndComments(lines);
    if (stmt.fromLeadingComments && stmt.fromLeadingComments.length > 0) {
      for (const c of stmt.fromLeadingComments) {
        lines.push(`${indent}${c}`);
      }
    }
    const fromLines = formatFromExpr(stmt.from, indent);
    if (fromLines.length === 1) {
      lines.push(`${indent}FROM ${fromLines[0].trimStart()}`);
    } else {
      lines.push(`${indent}FROM`);
      for (const line of fromLines) lines.push(line);
    }
  }

  if (stmt.prewhere) {
    flushEndComments(lines);
    lines.push(`${indent}PREWHERE ${formatExpr(stmt.prewhere, innerIndent)}`);
  }

  if (stmt.where) {
    flushEndComments(lines);
    const whereTrailing =
      stmt.where.trailingComments && stmt.where.trailingComments.length > 0
        ? ' ' + stmt.where.trailingComments.join(' ')
        : '';
    if (stmt.where.leadingComments && stmt.where.leadingComments.length > 0) {
      lines.push(`${indent}WHERE`);
      for (const c of stmt.where.leadingComments) {
        lines.push(`${innerIndent}${c}`);
      }
      lines.push(`${innerIndent}${formatExprCore(stmt.where, innerIndent)}${whereTrailing}`);
    } else {
      lines.push(`${indent}WHERE ${formatExprCore(stmt.where, innerIndent)}${whereTrailing}`);
    }
  }

  if (stmt.groupBy) {
    flushEndComments(lines);
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
        if (
          stmt.groupBy.items.length === 1 &&
          !(
            stmt.groupBy.items[0].leadingComments &&
            stmt.groupBy.items[0].leadingComments.length > 0
          )
        ) {
          const item = stmt.groupBy.items[0];
          lines.push(`${indent}GROUP BY ${formatExprCore(item, innerIndent)}`);
          _endComments = item.trailingComments ? [...item.trailingComments] : [];
        } else {
          lines.push(`${indent}GROUP BY`);
          const [text, endComments] = formatExprList(stmt.groupBy.items, innerIndent);
          lines.push(text);
          _endComments = endComments;
        }
        break;
    }
  }
  if (stmt.withCube) {
    flushEndComments(lines);
    lines.push(`${indent}WITH CUBE`);
  }
  if (stmt.withRollup) {
    flushEndComments(lines);
    lines.push(`${indent}WITH ROLLUP`);
  }
  if (stmt.withTotals) {
    flushEndComments(lines);
    lines.push(`${indent}WITH TOTALS`);
  }

  if (stmt.having) {
    flushEndComments(lines);
    lines.push(`${indent}HAVING ${formatExpr(stmt.having, innerIndent)}`);
  }

  if (stmt.orderBy && stmt.orderBy.length > 0) {
    flushEndComments(lines);
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
    flushEndComments(lines);
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
    flushEndComments(lines);
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
    flushEndComments(lines);
    lines.push(`${indent}OFFSET ${formatExpr(stmt.offset, indent)}`);
  }

  if (stmt.windows && stmt.windows.length > 0) {
    flushEndComments(lines);
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
    flushEndComments(lines);
    lines.push(`${indent}QUALIFY ${formatExpr(stmt.qualify, innerIndent)}`);
  }

  if (stmt.settings && stmt.settings.length > 0) {
    flushEndComments(lines);
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

  const hasTrailingClauses =
    stmt.intoOutfile ||
    stmt.preFormatSettings?.length ||
    stmt.format ||
    stmt.postFormatSettings?.length;
  if (hasTrailingClauses) {
    flushEndComments(lines);
  }

  let result = lines.join('\n');
  result += formatTrailingClauses(stmt, indent);
  return result;
}
