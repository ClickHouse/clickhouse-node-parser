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
  CreateTableStatement,
  ColumnDef,
  ConstraintDef,
  IndexDef,
  ProjectionDef,
  TableElement,
  EngineClause,
  Statement,
  NodeMetadata,
  ASTNodeKind,
  ASTNodeKindMap,
  ASTNode,
  SourceLocation,
} from './ast';

// ── Parent assignment ────────────────────────────────────────────────────────

function setParents(statements: Statement[]): void {
  const seen = new Set<unknown>();

  function walk(node: unknown, parent: unknown): void {
    if (node === null || node === undefined || typeof node !== 'object') {
      return;
    }
    if (seen.has(node)) return;
    seen.add(node);

    if (Array.isArray(node)) {
      for (const item of node) {
        walk(item, parent);
      }
      return;
    }

    const obj = node as Record<string, unknown>;
    if ('kind' in obj) {
      obj.parent = parent;
      for (const [key, value] of Object.entries(obj)) {
        if (key === 'parent') continue;
        if (typeof value === 'object' && value !== null) {
          walk(value, obj);
        }
      }
    } else {
      for (const value of Object.values(obj)) {
        if (typeof value === 'object' && value !== null) {
          walk(value, parent);
        }
      }
    }
  }

  walk(statements, undefined);
}

// ── Public API ────────────────────────────────────────────────────────────────

export type ParseOptions = {
  /**
   * When true, sets the `parent` reference on each AST node. The returned AST
   * nodes will have circular references, breaking JSON serialization.
   *
   * Default: false
   **/
  setParents?: boolean;
};

export function parse(sql: string, options?: ParseOptions): Statement[] {
  const statements = peggyParse(sql) as Statement[];
  if (options?.setParents) {
    setParents(statements);
  }
  return statements;
}

export { format, formatNode } from './format';
export { formatExplain } from './explain';
export { findNodes } from './find-nodes';
export { transformNodes, type NodePositionMap } from './transform-nodes';
export {
  isNodeKind,
  isLiteral,
  isColumnRef,
  isTableRef,
  isAsterisk,
  isQualifiedAsterisk,
  isQueryParam,
  isTupleExpansion,
  isFunctionCall,
  isCastExpr,
  isLambdaExpr,
  isSubqueryExpr,
  isInExpr,
  isUnaryExpr,
  isBinaryExpr,
  isNaryExpr,
  isAlias,
  isArrayLiteral,
  isTupleLiteral,
  isColumnsExpr,
  isJsonSubcolumn,
  isOrderByItem,
  isSubqueryFrom,
  isTableFunction,
  isJoinExpr,
  isArrayJoinExpr,
  isSelectStatement,
  isUnionStatement,
  isIntersectStatement,
  isExplainStatement,
  isSetStatement,
  isUseStatement,
  isSystemStatement,
  isCreateTableStatement,
  isColumnDef,
  isConstraintDef,
  isIndexDef,
  isProjectionDef,
} from './guards';
