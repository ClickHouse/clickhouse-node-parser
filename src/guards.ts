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
  node: ASTNode | undefined,
  kind: K,
): node is ASTNodeKindMap[K] {
  return node !== undefined && node.kind === kind;
}

/** Type guard for {@link import('./ast').Literal | Literal} nodes. */
export function isLiteral(node: ASTNode | undefined): node is ASTNodeKindMap['literal'] {
  return node !== undefined && node.kind === 'literal';
}

/** Type guard for {@link import('./ast').ColumnRef | ColumnRef} nodes. */
export function isColumnRef(node: ASTNode | undefined): node is ASTNodeKindMap['columnRef'] {
  return node !== undefined && node.kind === 'columnRef';
}

/** Type guard for {@link import('./ast').TableRef | TableRef} nodes. */
export function isTableRef(node: ASTNode | undefined): node is ASTNodeKindMap['tableRef'] {
  return node !== undefined && node.kind === 'tableRef';
}

/** Type guard for {@link import('./ast').Asterisk | Asterisk} nodes. */
export function isAsterisk(node: ASTNode | undefined): node is ASTNodeKindMap['asterisk'] {
  return node !== undefined && node.kind === 'asterisk';
}

/** Type guard for {@link import('./ast').QualifiedAsterisk | QualifiedAsterisk} nodes. */
export function isQualifiedAsterisk(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['qualifiedAsterisk'] {
  return node !== undefined && node.kind === 'qualifiedAsterisk';
}

/** Type guard for {@link import('./ast').QueryParam | QueryParam} nodes. */
export function isQueryParam(node: ASTNode | undefined): node is ASTNodeKindMap['queryParam'] {
  return node !== undefined && node.kind === 'queryParam';
}

/** Type guard for {@link import('./ast').TupleExpansion | TupleExpansion} nodes. */
export function isTupleExpansion(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['tupleExpansion'] {
  return node !== undefined && node.kind === 'tupleExpansion';
}

/** Type guard for {@link import('./ast').FunctionCall | FunctionCall} nodes. */
export function isFunctionCall(node: ASTNode | undefined): node is ASTNodeKindMap['functionCall'] {
  return node !== undefined && node.kind === 'functionCall';
}

/** Type guard for {@link import('./ast').CastExpr | CastExpr} nodes. */
export function isCastExpr(node: ASTNode | undefined): node is ASTNodeKindMap['castExpr'] {
  return node !== undefined && node.kind === 'castExpr';
}

/** Type guard for {@link import('./ast').LambdaExpr | LambdaExpr} nodes. */
export function isLambdaExpr(node: ASTNode | undefined): node is ASTNodeKindMap['lambdaExpr'] {
  return node !== undefined && node.kind === 'lambdaExpr';
}

/** Type guard for {@link import('./ast').SubqueryExpr | SubqueryExpr} nodes. */
export function isSubqueryExpr(node: ASTNode | undefined): node is ASTNodeKindMap['subqueryExpr'] {
  return node !== undefined && node.kind === 'subqueryExpr';
}

/** Type guard for {@link import('./ast').InExpr | InExpr} nodes. */
export function isInExpr(node: ASTNode | undefined): node is ASTNodeKindMap['inExpr'] {
  return node !== undefined && node.kind === 'inExpr';
}

/** Type guard for {@link import('./ast').UnaryExpr | UnaryExpr} nodes. */
export function isUnaryExpr(node: ASTNode | undefined): node is ASTNodeKindMap['unaryExpr'] {
  return node !== undefined && node.kind === 'unaryExpr';
}

/** Type guard for {@link import('./ast').BinaryExpr | BinaryExpr} nodes. */
export function isBinaryExpr(node: ASTNode | undefined): node is ASTNodeKindMap['binaryExpr'] {
  return node !== undefined && node.kind === 'binaryExpr';
}

/** Type guard for {@link import('./ast').NaryExpr | NaryExpr} nodes. */
export function isNaryExpr(node: ASTNode | undefined): node is ASTNodeKindMap['naryExpr'] {
  return node !== undefined && node.kind === 'naryExpr';
}

/** Type guard for {@link import('./ast').Alias | Alias} nodes. */
export function isAlias(node: ASTNode | undefined): node is ASTNodeKindMap['alias'] {
  return node !== undefined && node.kind === 'alias';
}

/** Type guard for {@link import('./ast').ArrayLiteral | ArrayLiteral} nodes. */
export function isArrayLiteral(node: ASTNode | undefined): node is ASTNodeKindMap['arrayLiteral'] {
  return node !== undefined && node.kind === 'arrayLiteral';
}

/** Type guard for {@link import('./ast').TupleLiteral | TupleLiteral} nodes. */
export function isTupleLiteral(node: ASTNode | undefined): node is ASTNodeKindMap['tupleLiteral'] {
  return node !== undefined && node.kind === 'tupleLiteral';
}

/** Type guard for {@link import('./ast').ColumnsExpr | ColumnsExpr} nodes. */
export function isColumnsExpr(node: ASTNode | undefined): node is ASTNodeKindMap['columnsExpr'] {
  return node !== undefined && node.kind === 'columnsExpr';
}

/** Type guard for {@link import('./ast').JsonSubcolumn | JsonSubcolumn} nodes. */
export function isJsonSubcolumn(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['jsonSubcolumn'] {
  return node !== undefined && node.kind === 'jsonSubcolumn';
}

/** Type guard for {@link import('./ast').OrderByItem | OrderByItem} nodes. */
export function isOrderByItem(node: ASTNode | undefined): node is ASTNodeKindMap['orderByItem'] {
  return node !== undefined && node.kind === 'orderByItem';
}

/** Type guard for {@link import('./ast').SubqueryFrom | SubqueryFrom} nodes. */
export function isSubqueryFrom(node: ASTNode | undefined): node is ASTNodeKindMap['subqueryFrom'] {
  return node !== undefined && node.kind === 'subqueryFrom';
}

/** Type guard for {@link import('./ast').TableFunctionRef | TableFunctionRef} nodes. */
export function isTableFunction(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['tableFunctionRef'] {
  return node !== undefined && node.kind === 'tableFunctionRef';
}

/** Type guard for {@link import('./ast').JoinExpr | JoinExpr} nodes. */
export function isJoinExpr(node: ASTNode | undefined): node is ASTNodeKindMap['joinExpr'] {
  return node !== undefined && node.kind === 'joinExpr';
}

/** Type guard for {@link import('./ast').ArrayJoinExpr | ArrayJoinExpr} nodes. */
export function isArrayJoinExpr(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['arrayJoinExpr'] {
  return node !== undefined && node.kind === 'arrayJoinExpr';
}

/** Type guard for {@link import('./ast').SelectStatement | SelectStatement} nodes. */
export function isSelectStatement(node: ASTNode | undefined): node is ASTNodeKindMap['select'] {
  return node !== undefined && node.kind === 'select';
}

/** Type guard for {@link import('./ast').UnionStatement | UnionStatement} nodes. */
export function isUnionStatement(node: ASTNode | undefined): node is ASTNodeKindMap['union'] {
  return node !== undefined && node.kind === 'union';
}

/** Type guard for {@link import('./ast').IntersectStatement | IntersectStatement} nodes. */
export function isIntersectStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['intersect'] {
  return node !== undefined && node.kind === 'intersect';
}

/** Type guard for {@link import('./ast').ExplainStatement | ExplainStatement} nodes. */
export function isExplainStatement(node: ASTNode | undefined): node is ASTNodeKindMap['explain'] {
  return node !== undefined && node.kind === 'explain';
}

/** Type guard for {@link import('./ast').SetStatement | SetStatement} nodes. */
export function isSetStatement(node: ASTNode | undefined): node is ASTNodeKindMap['set'] {
  return node !== undefined && node.kind === 'set';
}

/** Type guard for {@link import('./ast').TransactionControlStatement | TransactionControlStatement} nodes. */
export function isTransactionControlStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['transactionControl'] {
  return node !== undefined && node.kind === 'transactionControl';
}

/** Type guard for {@link import('./ast').SetRoleStatement | SetRoleStatement} nodes. */
export function isSetRoleStatement(node: ASTNode | undefined): node is ASTNodeKindMap['setRole'] {
  return node !== undefined && node.kind === 'setRole';
}

/** Type guard for {@link import('./ast').UseStatement | UseStatement} nodes. */
export function isUseStatement(node: ASTNode | undefined): node is ASTNodeKindMap['use'] {
  return node !== undefined && node.kind === 'use';
}

/** Type guard for {@link import('./ast').SystemStatement | SystemStatement} nodes. */
export function isSystemStatement(node: ASTNode | undefined): node is ASTNodeKindMap['system'] {
  return node !== undefined && node.kind === 'system';
}

/** Type guard for {@link import('./ast').CreateTableStatement | CreateTableStatement} nodes. */
export function isCreateTableStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createTable'] {
  return node !== undefined && node.kind === 'createTable';
}

/** Type guard for {@link import('./ast').CreateViewStatement | CreateViewStatement} nodes. */
export function isCreateViewStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createView'] {
  return node !== undefined && node.kind === 'createView';
}

/** Type guard for {@link import('./ast').CreateMaterializedViewStatement | CreateMaterializedViewStatement} nodes. */
export function isCreateMaterializedViewStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createMaterializedView'] {
  return node !== undefined && node.kind === 'createMaterializedView';
}

/** Type guard for {@link import('./ast').CreateDatabaseStatement | CreateDatabaseStatement} nodes. */
export function isCreateDatabaseStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createDatabase'] {
  return node !== undefined && node.kind === 'createDatabase';
}

/** Type guard for {@link import('./ast').CreateFunctionStatement | CreateFunctionStatement} nodes. */
export function isCreateFunctionStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createFunction'] {
  return node !== undefined && node.kind === 'createFunction';
}

/** Type guard for {@link import('./ast').CreateIndexStatement | CreateIndexStatement} nodes. */
export function isCreateIndexStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createIndex'] {
  return node !== undefined && node.kind === 'createIndex';
}

/** Type guard for {@link import('./ast').CreateDictionaryStatement | CreateDictionaryStatement} nodes. */
export function isCreateDictionaryStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createDictionary'] {
  return node !== undefined && node.kind === 'createDictionary';
}

/** Type guard for {@link import('./ast').CreateWorkloadStatement | CreateWorkloadStatement} nodes. */
export function isCreateWorkloadStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createWorkload'] {
  return node !== undefined && node.kind === 'createWorkload';
}

/** Type guard for {@link import('./ast').CreateUserStatement | CreateUserStatement} nodes. */
export function isCreateUserStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createUser'] {
  return node !== undefined && node.kind === 'createUser';
}

/** Type guard for {@link import('./ast').CreateRoleStatement | CreateRoleStatement} nodes. */
export function isCreateRoleStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createRole'] {
  return node !== undefined && node.kind === 'createRole';
}

/** Type guard for {@link import('./ast').CreateRowPolicyStatement | CreateRowPolicyStatement} nodes. */
export function isCreateRowPolicyStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createRowPolicy'] {
  return node !== undefined && node.kind === 'createRowPolicy';
}

/** Type guard for {@link import('./ast').CreateQuotaStatement | CreateQuotaStatement} nodes. */
export function isCreateQuotaStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createQuota'] {
  return node !== undefined && node.kind === 'createQuota';
}

/** Type guard for {@link import('./ast').CreateSettingsProfileStatement | CreateSettingsProfileStatement} nodes. */
export function isCreateSettingsProfileStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createSettingsProfile'] {
  return node !== undefined && node.kind === 'createSettingsProfile';
}

/** Type guard for {@link import('./ast').CreateNamedCollectionStatement | CreateNamedCollectionStatement} nodes. */
export function isCreateNamedCollectionStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createNamedCollection'] {
  return node !== undefined && node.kind === 'createNamedCollection';
}

/** Type guard for {@link import('./ast').CreateResourceStatement | CreateResourceStatement} nodes. */
export function isCreateResourceStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createResource'] {
  return node !== undefined && node.kind === 'createResource';
}

/** Type guard for {@link import('./ast').CreateWindowViewStatement | CreateWindowViewStatement} nodes. */
export function isCreateWindowViewStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createWindowView'] {
  return node !== undefined && node.kind === 'createWindowView';
}

/** Type guard for {@link import('./ast').CreateLiveViewStatement | CreateLiveViewStatement} nodes. */
export function isCreateLiveViewStatement(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['createLiveView'] {
  return node !== undefined && node.kind === 'createLiveView';
}

/** Type guard for {@link import('./ast').InsertStatement | InsertStatement} nodes. */
export function isInsertStatement(node: ASTNode | undefined): node is ASTNodeKindMap['insert'] {
  return node !== undefined && node.kind === 'insert';
}

/** Type guard for {@link import('./ast').ColumnDef | ColumnDef} nodes. */
export function isColumnDef(node: ASTNode | undefined): node is ASTNodeKindMap['columnDef'] {
  return node !== undefined && node.kind === 'columnDef';
}

/** Type guard for {@link import('./ast').ConstraintDef | ConstraintDef} nodes. */
export function isConstraintDef(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['constraintDef'] {
  return node !== undefined && node.kind === 'constraintDef';
}

/** Type guard for {@link import('./ast').IndexDef | IndexDef} nodes. */
export function isIndexDef(node: ASTNode | undefined): node is ASTNodeKindMap['indexDef'] {
  return node !== undefined && node.kind === 'indexDef';
}

/** Type guard for {@link import('./ast').ProjectionDef | ProjectionDef} nodes. */
export function isProjectionDef(
  node: ASTNode | undefined,
): node is ASTNodeKindMap['projectionDef'] {
  return node !== undefined && node.kind === 'projectionDef';
}
