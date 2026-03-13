import { parse as peggyParse } from './parser';
import { Statement } from './ast';

// ── Error Types ──────────────────────────────────────────────────────────────

export { SyntaxError as ParseError } from './parser';
export type { LocationRange, Location, Expectation } from './parser';

// ── AST Types ─────────────────────────────────────────────────────────────────

export type {
  Literal,
  ColumnRef,
  FunctionCall,
  BinaryExpr,
  Expression,
  TableRef,
  SubqueryExpr,
  SubqueryFrom,
  InExpr,
  JoinType,
  ArrayJoinType,
  JoinConstraint,
  JoinExpr,
  ArrayJoinExpr,
  FromExpr,
  OrderByItem,
  CTE,
  QueryParam,
  SelectStatement,
  Statement,
  ASTNodeKind,
  ASTNodeKindMap,
} from './ast';

// ── Public API ────────────────────────────────────────────────────────────────

export function parse(sql: string): Statement[] {
  return peggyParse(sql) as Statement[];
}

export { format } from './format';
export { formatExplain } from './explain';
export { findNodes } from './find-nodes';
