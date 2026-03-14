import type { ASTNode, ASTNodeKind, ASTNodeKindMap } from './ast';

/**
 * Returns a type guard that narrows an {@link ASTNode} to the specific type
 * corresponding to the given `kind`.
 *
 * @example
 * ```ts
 * import { isNodeKind } from 'clickhouse-node-parser';
 *
 * const node: ASTNode = ...;
 * if (isNodeKind(node, 'literal')) {
 *   node.value; // narrowed to Literal
 * }
 * ```
 */
export function isNodeKind<K extends ASTNodeKind>(
  node: ASTNode,
  kind: K,
): node is ASTNodeKindMap[K] {
  return node.kind === kind;
}

/** Type guard for {@link import('./ast').Literal | Literal} nodes. */
export function isLiteral(node: ASTNode): node is ASTNodeKindMap['literal'] {
  return node.kind === 'literal';
}

/** Type guard for {@link import('./ast').ColumnRef | ColumnRef} nodes. */
export function isColumnRef(node: ASTNode): node is ASTNodeKindMap['columnRef'] {
  return node.kind === 'columnRef';
}

/** Type guard for {@link import('./ast').TableRef | TableRef} nodes. */
export function isTableRef(node: ASTNode): node is ASTNodeKindMap['tableRef'] {
  return node.kind === 'tableRef';
}

/** Type guard for {@link import('./ast').Asterisk | Asterisk} nodes. */
export function isAsterisk(node: ASTNode): node is ASTNodeKindMap['asterisk'] {
  return node.kind === 'asterisk';
}

/** Type guard for {@link import('./ast').QualifiedAsterisk | QualifiedAsterisk} nodes. */
export function isQualifiedAsterisk(node: ASTNode): node is ASTNodeKindMap['qualifiedAsterisk'] {
  return node.kind === 'qualifiedAsterisk';
}

/** Type guard for {@link import('./ast').QueryParam | QueryParam} nodes. */
export function isQueryParam(node: ASTNode): node is ASTNodeKindMap['queryParam'] {
  return node.kind === 'queryParam';
}

/** Type guard for {@link import('./ast').TupleExpansion | TupleExpansion} nodes. */
export function isTupleExpansion(node: ASTNode): node is ASTNodeKindMap['tupleExpansion'] {
  return node.kind === 'tupleExpansion';
}

/** Type guard for {@link import('./ast').FunctionCall | FunctionCall} nodes. */
export function isFunctionCall(node: ASTNode): node is ASTNodeKindMap['functionCall'] {
  return node.kind === 'functionCall';
}

/** Type guard for {@link import('./ast').CastExpr | CastExpr} nodes. */
export function isCastExpr(node: ASTNode): node is ASTNodeKindMap['castExpr'] {
  return node.kind === 'castExpr';
}

/** Type guard for {@link import('./ast').LambdaExpr | LambdaExpr} nodes. */
export function isLambdaExpr(node: ASTNode): node is ASTNodeKindMap['lambdaExpr'] {
  return node.kind === 'lambdaExpr';
}

/** Type guard for {@link import('./ast').SubqueryExpr | SubqueryExpr} nodes. */
export function isSubqueryExpr(node: ASTNode): node is ASTNodeKindMap['subqueryExpr'] {
  return node.kind === 'subqueryExpr';
}

/** Type guard for {@link import('./ast').InExpr | InExpr} nodes. */
export function isInExpr(node: ASTNode): node is ASTNodeKindMap['inExpr'] {
  return node.kind === 'inExpr';
}

/** Type guard for {@link import('./ast').UnaryExpr | UnaryExpr} nodes. */
export function isUnaryExpr(node: ASTNode): node is ASTNodeKindMap['unaryExpr'] {
  return node.kind === 'unaryExpr';
}

/** Type guard for {@link import('./ast').BinaryExpr | BinaryExpr} nodes. */
export function isBinaryExpr(node: ASTNode): node is ASTNodeKindMap['binaryExpr'] {
  return node.kind === 'binaryExpr';
}

/** Type guard for {@link import('./ast').NaryExpr | NaryExpr} nodes. */
export function isNaryExpr(node: ASTNode): node is ASTNodeKindMap['naryExpr'] {
  return node.kind === 'naryExpr';
}

/** Type guard for {@link import('./ast').Alias | Alias} nodes. */
export function isAlias(node: ASTNode): node is ASTNodeKindMap['alias'] {
  return node.kind === 'alias';
}

/** Type guard for {@link import('./ast').ArrayLiteral | ArrayLiteral} nodes. */
export function isArrayLiteral(node: ASTNode): node is ASTNodeKindMap['array'] {
  return node.kind === 'array';
}

/** Type guard for {@link import('./ast').TupleLiteral | TupleLiteral} nodes. */
export function isTupleLiteral(node: ASTNode): node is ASTNodeKindMap['tuple'] {
  return node.kind === 'tuple';
}

/** Type guard for {@link import('./ast').ColumnsExpr | ColumnsExpr} nodes. */
export function isColumnsExpr(node: ASTNode): node is ASTNodeKindMap['columnsExpr'] {
  return node.kind === 'columnsExpr';
}

/** Type guard for {@link import('./ast').JsonSubcolumn | JsonSubcolumn} nodes. */
export function isJsonSubcolumn(node: ASTNode): node is ASTNodeKindMap['jsonSubcolumn'] {
  return node.kind === 'jsonSubcolumn';
}

/** Type guard for {@link import('./ast').OrderByItem | OrderByItem} nodes. */
export function isOrderByItem(node: ASTNode): node is ASTNodeKindMap['orderByItem'] {
  return node.kind === 'orderByItem';
}

/** Type guard for {@link import('./ast').SubqueryFrom | SubqueryFrom} nodes. */
export function isSubqueryFrom(node: ASTNode): node is ASTNodeKindMap['subqueryFrom'] {
  return node.kind === 'subqueryFrom';
}

/** Type guard for {@link import('./ast').TableFunctionRef | TableFunctionRef} nodes. */
export function isTableFunction(node: ASTNode): node is ASTNodeKindMap['tableFunction'] {
  return node.kind === 'tableFunction';
}

/** Type guard for {@link import('./ast').JoinExpr | JoinExpr} nodes. */
export function isJoinExpr(node: ASTNode): node is ASTNodeKindMap['join'] {
  return node.kind === 'join';
}

/** Type guard for {@link import('./ast').ArrayJoinExpr | ArrayJoinExpr} nodes. */
export function isArrayJoinExpr(node: ASTNode): node is ASTNodeKindMap['arrayJoin'] {
  return node.kind === 'arrayJoin';
}

/** Type guard for {@link import('./ast').SelectStatement | SelectStatement} nodes. */
export function isSelectStatement(node: ASTNode): node is ASTNodeKindMap['select'] {
  return node.kind === 'select';
}

/** Type guard for {@link import('./ast').UnionStatement | UnionStatement} nodes. */
export function isUnionStatement(node: ASTNode): node is ASTNodeKindMap['union'] {
  return node.kind === 'union';
}

/** Type guard for {@link import('./ast').IntersectStatement | IntersectStatement} nodes. */
export function isIntersectStatement(node: ASTNode): node is ASTNodeKindMap['intersect'] {
  return node.kind === 'intersect';
}

/** Type guard for {@link import('./ast').ExplainStatement | ExplainStatement} nodes. */
export function isExplainStatement(node: ASTNode): node is ASTNodeKindMap['explain'] {
  return node.kind === 'explain';
}

/** Type guard for {@link import('./ast').SetStatement | SetStatement} nodes. */
export function isSetStatement(node: ASTNode): node is ASTNodeKindMap['set'] {
  return node.kind === 'set';
}

/** Type guard for {@link import('./ast').UseStatement | UseStatement} nodes. */
export function isUseStatement(node: ASTNode): node is ASTNodeKindMap['use'] {
  return node.kind === 'use';
}

/** Type guard for {@link import('./ast').SystemStatement | SystemStatement} nodes. */
export function isSystemStatement(node: ASTNode): node is ASTNodeKindMap['system'] {
  return node.kind === 'system';
}
