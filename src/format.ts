import {
  AccessControlName,
  AccessControlSettingsItem,
  AlterStatement,
  ASTNode,
  CTE,
  ColumnTransformer,
  CreateNamedCollectionStatement,
  CreateQuotaStatement,
  CreateResourceStatement,
  CreateRoleStatement,
  CreateRowPolicyStatement,
  CreateSettingsProfileStatement,
  CreateTableStatement,
  CreateUserStatement,
  ExplainStatement,
  Expression,
  FunctionCall,
  FromExpr,
  HostItem,
  InsertStatement,
  IntersectStatement,
  InterpolateItem,
  JoinConstraint,
  Literal,
  OrderByItem,
  RoleTarget,
  SampleClause,
  SampleRatioValue,
  SelectStatement,
  SetRoleStatement,
  SetStatement,
  SettingItem,
  Statement,
  StatementsSchema,
  SubqueryFrom,
  SystemStatement,
  TableFunctionRef,
  TableRef,
  TransactionControlStatement,
  UnionStatement,
  UsingColumn,
  UseStatement,
  WindowSpec,
  TableOrderByItem,
  TTLItem,
  CreateDictionaryStatement,
  CreateMaterializedViewStatement,
  CreateViewStatement,
  CreateDatabaseStatement,
  CreateWorkloadStatement,
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

// Format any AST node by dispatching to the appropriate kind-specific formatter.
export function formatNode(node: ASTNode, indent: string = ''): string {
  switch (node.kind) {
    // Statement types
    case 'select':
      return formatSelectStatement(node, indent);
    case 'union':
      return formatUnionStatement(node, indent);
    case 'intersect':
      return formatIntersectStatement(node, indent);
    case 'explain':
      return formatExplainStatement(node, indent);
    case 'set':
      return formatSetStatement(node, indent);
    case 'use':
      return formatUseStatement(node, indent);
    case 'system':
      return formatSystemStatement(node, indent);
    case 'transactionControl':
      return formatTransactionControlStatement(node, indent);
    case 'setRole':
      return formatSetRoleStatement(node, indent);
    case 'parallelWith':
      return node.queries.map((q) => formatNode(q, indent)).join(`\nPARALLEL WITH\n`);
    case 'createTable':
      return formatCreateTableStatement(node, indent);
    case 'createView':
    case 'createMaterializedView':
    case 'createDatabase':
    case 'createFunction':
    case 'createIndex':
    case 'createDictionary':
    case 'createWorkload':
    case 'createUser':
    case 'createRole':
    case 'createRowPolicy':
    case 'createQuota':
    case 'createSettingsProfile':
    case 'createNamedCollection':
    case 'createResource':
    case 'createWindowView':
    case 'createLiveView':
      return formatCreateStatement(node, indent);
    case 'columnDef':
    case 'constraintDef':
    case 'indexDef':
    case 'projectionDef':
    case 'foreignKeyDef':
      return formatTableElement(node, indent);
    // From-clause types
    case 'tableRef':
      return formatTableRef(node);
    case 'tableFunctionRef':
      return formatTableFunction(node, indent);
    case 'subqueryFrom':
      return formatSubqueryFrom(node, indent);
    case 'joinExpr':
      return formatFromExpr(node, indent).join('\n');
    case 'arrayJoinExpr':
      return formatFromExpr(node, indent).join('\n');
    // Non-expression node types without dedicated formatters
    case 'orderByItem':
      return formatOrderByItem(node, indent);
    // Statement nodes that can appear as ASTNode
    case 'insert':
      return formatInsertStatement(node, indent);
    case 'truncate': {
      const t = node.table;
      const tn = t.database
        ? `${quoteIdent(t.database)}.${quoteIdent(t.table)}`
        : quoteIdent(t.table);
      return `${indent}TRUNCATE TABLE ${tn}`;
    }
    case 'drop':
      return formatStatement(node, indent);
    case 'alter':
      return formatAlterStatement(node, indent);
    case 'alterCommand':
      return formatAlterCommand(node, indent);
    // CTE nodes — format inline
    case 'cteSubquery': {
      const colAliases = node.columnAliases
        ? ` (${node.columnAliases.map(quoteIdent).join(', ')})`
        : '';
      return `${quoteIdent(node.name)}${colAliases} AS (\n${formatStatement(node.query, indent + '  ')}\n${indent})`;
    }
    case 'cteExpr':
      return `${formatExprCore(node.expr, indent)} AS ${quoteIdent(node.name)}`;
    case 'cteTuple':
      return `(${node.elements.map((e: Expression) => formatExpr(e, indent)).join(',\n' + indent + '  ')})`;
    // Expression types — use formatExpr (with comments)
    default:
      return formatExpr(node, indent);
  }
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
  if (stmt.kind === 'transactionControl') {
    return formatTransactionControlStatement(stmt, indent);
  }
  if (stmt.kind === 'setRole') {
    return formatSetRoleStatement(stmt, indent);
  }
  if (stmt.kind === 'use') {
    return formatUseStatement(stmt, indent);
  }
  if (stmt.kind === 'system') {
    return formatSystemStatement(stmt, indent);
  }
  if (stmt.kind === 'insert') {
    return formatInsertStatement(stmt, indent);
  }
  if (stmt.kind === 'truncate') {
    const t = stmt.table;
    const name = t.database
      ? `${quoteIdent(t.database)}.${quoteIdent(t.table)}`
      : quoteIdent(t.table);
    return `${indent}TRUNCATE TABLE ${name}`;
  }
  if (stmt.kind === 'drop') {
    const fmtRef = (t: import('./ast').TableRef) =>
      t.database ? `${quoteIdent(t.database)}.${quoteIdent(t.table)}` : quoteIdent(t.table);
    // DROP INDEX has special syntax: DROP INDEX [IF EXISTS] name ON table
    if (stmt.targetType === 'INDEX' && stmt.indexName && stmt.table) {
      let result = `${indent}DROP INDEX`;
      if (stmt.ifExists) result += ' IF EXISTS';
      result += ` ${quoteIdent(stmt.indexName)} ON ${fmtRef(stmt.table)}`;
      return result;
    }
    let result = `${indent}DROP`;
    if (stmt.temporary) result += ' TEMPORARY';
    result += ` ${stmt.targetType}`;
    if (stmt.ifExists) result += ' IF EXISTS';
    if (stmt.tables && stmt.tables.length > 0) {
      result += ` ${stmt.tables.map(fmtRef).join(', ')}`;
    } else if (stmt.table) {
      result += ` ${fmtRef(stmt.table)}`;
    }
    if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;
    if (stmt.settings && stmt.settings.length > 0) {
      result += ` SETTINGS ${formatSettingsList(stmt.settings, indent)}`;
    }
    if (stmt.format) result += ` FORMAT ${stmt.format}`;
    return result;
  }
  if (stmt.kind === 'alter') {
    return formatAlterStatement(stmt, indent);
  }
  if (stmt.kind === 'parallelWith') {
    return stmt.queries.map((q) => formatStatement(q, indent)).join(`\nPARALLEL WITH\n`);
  }
  if (stmt.kind === 'createTable') {
    return formatCreateTableStatement(stmt, indent);
  }
  if (
    stmt.kind === 'createView' ||
    stmt.kind === 'createMaterializedView' ||
    stmt.kind === 'createDatabase' ||
    stmt.kind === 'createFunction' ||
    stmt.kind === 'createIndex' ||
    stmt.kind === 'createDictionary' ||
    stmt.kind === 'createWorkload' ||
    stmt.kind === 'createUser' ||
    stmt.kind === 'createRole' ||
    stmt.kind === 'createRowPolicy' ||
    stmt.kind === 'createQuota' ||
    stmt.kind === 'createSettingsProfile' ||
    stmt.kind === 'createNamedCollection' ||
    stmt.kind === 'createResource' ||
    stmt.kind === 'createWindowView' ||
    stmt.kind === 'createLiveView'
  ) {
    return formatCreateStatement(stmt, indent);
  }
  return formatSelectStatement(stmt, indent);
}

function formatSetStatement(stmt: SetStatement, indent: string): string {
  const items = (stmt.settings || [])
    .map((s) => `${s.name} = ${formatExpr(s.value, indent)}`)
    .join(', ');
  return `${indent}SET ${items}`;
}

function formatTransactionControlStatement(
  stmt: TransactionControlStatement,
  indent: string,
): string {
  return `${indent}SET TRANSACTION snapshot ${stmt.snapshot}`;
}

function formatSetRoleStatement(stmt: SetRoleStatement, indent: string): string {
  return `${indent}SET DEFAULT ROLE ${formatRoleTarget(stmt.roles)} TO ${stmt.users.join(', ')}`;
}

function formatRoleTarget(target: RoleTarget): string {
  switch (target.kind) {
    case 'all':
      return target.except && target.except.length > 0
        ? `ALL EXCEPT ${target.except.join(', ')}`
        : 'ALL';
    case 'none':
      return 'NONE';
    case 'names':
      return target.names.join(', ');
  }
}

function formatAccessControlName(name: AccessControlName): string {
  // Names starting with ', ", `, or { are already quoted/special
  const n = /^['"`{]/.test(name.name) ? name.name : quoteIdent(name.name);
  return name.host ? `${n}@${name.host}` : n;
}

function formatAccessControlNames(names: AccessControlName[]): string {
  return names.map(formatAccessControlName).join(', ');
}

function formatHostItems(items: HostItem[]): string {
  const parts: string[] = [];
  for (const item of items) {
    switch (item.kind) {
      case 'any':
        parts.push('ANY');
        break;
      case 'none':
        parts.push('NONE');
        break;
      case 'local':
        parts.push('LOCAL');
        break;
      case 'name':
        parts.push(`NAME '${item.value}'`);
        break;
      case 'regexp':
        parts.push(`REGEXP '${item.value}'`);
        break;
      case 'like':
        parts.push(`LIKE '${item.value}'`);
        break;
      case 'ip':
        parts.push(`IP '${item.value}'`);
        break;
    }
  }
  return parts.join(', ');
}

function formatAccessControlSettingsItem(item: AccessControlSettingsItem, indent: string): string {
  switch (item.kind) {
    case 'profile':
      return `PROFILE ${item.name}`;
    case 'inherit':
      return `INHERIT ${item.name}`;
    case 'setting': {
      let result = item.name;
      if (item.value !== undefined) result += `=${formatExpr(item.value, indent)}`;
      if (item.min !== undefined) result += ` MIN ${formatExpr(item.min, indent)}`;
      if (item.max !== undefined) result += ` MAX ${formatExpr(item.max, indent)}`;
      if (item.modifier) result += ` ${item.modifier}`;
      return result;
    }
  }
}

function formatAccessControlSettings(
  settings: AccessControlSettingsItem[] | 'NONE',
  indent: string,
): string {
  if (settings === 'NONE') return 'NONE';
  return settings.map((s) => formatAccessControlSettingsItem(s, indent)).join(', ');
}

function formatUseStatement(stmt: UseStatement, indent: string): string {
  return `${indent}USE ${stmt.database}`;
}

function formatAlterPartitionExpr(
  part: import('./ast').AlterPartitionExpr,
  indent: string,
): string {
  if (part.partitionKind === 'all') return 'ALL';
  if (part.partitionKind === 'id')
    return `ID ${formatExpr(part.id as import('./ast').Expression, indent)}`;
  return formatExpr(part.expr, indent);
}

function formatAlterCommand(cmd: import('./ast').AlterCommand, indent: string): string {
  switch (cmd.commandType) {
    case 'ADD_COLUMN': {
      let s = `ADD COLUMN ${formatTableElement(cmd.column, '')}`;
      if (cmd.afterColumn) s += ` AFTER ${quoteIdent(cmd.afterColumn)}`;
      return s;
    }
    case 'DROP_COLUMN': {
      let s = `DROP COLUMN ${quoteIdent(cmd.columnName)}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'MODIFY_COLUMN': {
      let s = `MODIFY COLUMN ${formatTableElement(cmd.column, '')}`;
      if (cmd.columnSettingOp) {
        if (cmd.columnSettingOp.op === 'MODIFY_SETTING' && cmd.columnSettingOp.settings) {
          s += ` MODIFY SETTING ${formatSettingsList(cmd.columnSettingOp.settings, indent)}`;
        } else if (cmd.columnSettingOp.op === 'RESET_SETTING' && cmd.columnSettingOp.names) {
          s += ` RESET SETTING ${cmd.columnSettingOp.names.map(quoteIdent).join(', ')}`;
        }
      }
      if (cmd.afterColumn) s += ` AFTER ${quoteIdent(cmd.afterColumn)}`;
      return s;
    }
    case 'RENAME_COLUMN':
      return `RENAME COLUMN ${quoteIdent(cmd.oldName)} TO ${quoteIdent(cmd.newName)}`;
    case 'COMMENT_COLUMN':
      return `COMMENT COLUMN ${quoteIdent(cmd.columnName)} ${formatExpr(cmd.comment, indent)}`;
    case 'MATERIALIZE_COLUMN': {
      let s = `MATERIALIZE COLUMN ${quoteIdent(cmd.columnName)}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'ADD_INDEX': {
      // formatTableElement includes "INDEX name expr TYPE ...", so just prefix with "ADD"
      let s = `ADD ${formatTableElement(cmd.index, '')}`;
      if (cmd.afterIndex) s += ` AFTER ${quoteIdent(cmd.afterIndex)}`;
      return s;
    }
    case 'DROP_INDEX': {
      let s = `DROP INDEX ${quoteIdent(cmd.indexName)}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'MATERIALIZE_INDEX': {
      let s = `MATERIALIZE INDEX ${quoteIdent(cmd.indexName)}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'ADD_PROJECTION': {
      // formatTableElement includes "PROJECTION name (...)", so just prefix with "ADD"
      let s = `ADD ${formatTableElement(cmd.projection, '')}`;
      if (cmd.afterProjection) s += ` AFTER ${quoteIdent(cmd.afterProjection)}`;
      return s;
    }
    case 'DROP_PROJECTION': {
      let s = `DROP PROJECTION ${quoteIdent(cmd.projectionName)}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'MATERIALIZE_PROJECTION': {
      let s = `MATERIALIZE PROJECTION ${quoteIdent(cmd.projectionName)}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'ADD_CONSTRAINT':
      // formatTableElement includes "CONSTRAINT name CHECK expr", so just prefix with "ADD"
      return `ADD ${formatTableElement(cmd.constraint, '')}`;
    case 'DROP_CONSTRAINT':
      return `DROP CONSTRAINT ${quoteIdent(cmd.constraintName)}`;
    case 'ADD_STATISTICS':
    case 'MODIFY_STATISTICS': {
      const kw = cmd.commandType === 'ADD_STATISTICS' ? 'ADD' : 'MODIFY';
      const cols = cmd.statColumns.map(quoteIdent).join(', ');
      const types = cmd.statTypes.map(formatIndexType).join(', ');
      return `${kw} STATISTICS ${cols} TYPE ${types}`;
    }
    case 'DROP_STATISTICS':
      if (cmd.statColumns && cmd.statColumns.length > 0)
        return `DROP STATISTICS ${cmd.statColumns.map(quoteIdent).join(', ')}`;
      return 'DROP STATISTICS ALL';
    case 'MATERIALIZE_STATISTICS':
      if (cmd.statColumns && cmd.statColumns.length > 0)
        return `MATERIALIZE STATISTICS ${cmd.statColumns.map(quoteIdent).join(', ')}`;
      return 'MATERIALIZE STATISTICS ALL';
    case 'UPDATE': {
      const assigns = cmd.assignments
        .map((a) => `${quoteIdent(a.column)} = ${formatExpr(a.expr, indent)}`)
        .join(', ');
      let s = `UPDATE ${assigns}`;
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      s += ` WHERE ${formatExpr(cmd.where, indent)}`;
      return s;
    }
    case 'DELETE': {
      let s = 'DELETE';
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      s += ` WHERE ${formatExpr(cmd.where, indent)}`;
      return s;
    }
    case 'DROP_PARTITION':
      if (cmd.partName) return `DROP PART ${formatExpr(cmd.partName, indent)}`;
      if (cmd.partition) return `DROP PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return 'DROP PARTITION';
    case 'ATTACH_PARTITION':
      if (cmd.partName) return `ATTACH PART ${formatExpr(cmd.partName, indent)}`;
      if (cmd.partition)
        return `ATTACH PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return 'ATTACH PARTITION';
    case 'DROP_DETACHED_PARTITION':
      return `DROP DETACHED PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
    case 'REPLACE_PARTITION':
      return `REPLACE PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)} FROM ${formatTableRef(cmd.fromTable)}`;
    case 'MOVE_PARTITION': {
      let s = `MOVE PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      if (cmd.moveDest) {
        if (cmd.moveDest.destType === 'TABLE')
          s += ` TO TABLE ${formatTableRef(cmd.moveDest.table)}`;
        else s += ` TO ${cmd.moveDest.destType} ${formatExpr(cmd.moveDest.value, indent)}`;
      }
      return s;
    }
    case 'FETCH_PARTITION': {
      let s = `FETCH PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      if (cmd.fromPath) s += ` FROM ${formatExpr(cmd.fromPath, indent)}`;
      return s;
    }
    case 'FREEZE_PARTITION':
      return `FREEZE PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
    case 'FREEZE_ALL':
      return 'FREEZE';
    case 'MODIFY_TTL': {
      const ttlStr = cmd.ttl
        .map((item) => {
          let s = formatExpr(item.expr, indent);
          if (item.where) s += ` WHERE ${formatExpr(item.where, indent)}`;
          return s;
        })
        .join(', ');
      return `MODIFY TTL ${ttlStr}`;
    }
    case 'REMOVE_TTL':
      return 'REMOVE TTL';
    case 'REMOVE_SAMPLE_BY':
      return 'REMOVE SAMPLE BY';
    case 'MATERIALIZE_TTL': {
      let s = 'MATERIALIZE TTL';
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'MODIFY_ORDER_BY':
      return `MODIFY ORDER BY ${formatExpr(cmd.expr, indent)}`;
    case 'MODIFY_SAMPLE_BY':
      return `MODIFY SAMPLE BY ${formatExpr(cmd.expr, indent)}`;
    case 'MODIFY_SETTING':
      return `MODIFY SETTING ${formatSettingsList(cmd.settings, indent)}`;
    case 'RESET_SETTING':
      return `RESET SETTING ${cmd.settingNames.map(quoteIdent).join(', ')}`;
    case 'MODIFY_QUERY':
      return `MODIFY QUERY ${formatStatement(cmd.query, indent)}`;
    case 'MODIFY_COMMENT':
      return `MODIFY COMMENT ${formatExpr(cmd.comment, indent)}`;
    case 'APPLY_DELETED_MASK': {
      let s = 'APPLY DELETED MASK';
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'APPLY_PATCHES': {
      let s = 'APPLY PATCHES';
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
    case 'REWRITE_PARTS': {
      let s = 'REWRITE PARTS';
      if (cmd.partition) s += ` IN PARTITION ${formatAlterPartitionExpr(cmd.partition, indent)}`;
      return s;
    }
  }
}

function formatAlterStatement(stmt: AlterStatement, indent: string): string {
  let result = `${indent}ALTER TABLE ${formatTableRef(stmt.table)}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;
  result += ` ${stmt.commands
    .map((cmd) => {
      const s = formatAlterCommand(cmd, indent);
      return cmd.parenthesized ? `(${s})` : s;
    })
    .join(', ')}`;
  if (stmt.settings && stmt.settings.length > 0) {
    result += ` SETTINGS ${formatSettingsList(stmt.settings, indent)}`;
  }
  if (stmt.format) result += ` FORMAT ${stmt.format}`;
  return result;
}

function formatSystemStatement(stmt: SystemStatement, indent: string): string {
  // Opaque statements (DROP USER, ALTER, etc.) store the full body including the keyword
  if (
    /^(DROP|ALTER|RENAME|ATTACH|DETACH|OPTIMIZE|CHECK|DESCRIBE|DESC|EXISTS|SHOW|GRANT|REVOKE|EXCHANGE|KILL|UNDO|DELETE|BACKUP|RESTORE|BEGIN|COMMIT|ROLLBACK|WATCH|UNDROP|MOVE|TRUNCATE)\b/i.test(
      stmt.body,
    )
  ) {
    return `${indent}${stmt.body}`;
  }
  return `${indent}SYSTEM ${stmt.body}`;
}

function formatInsertStatement(stmt: InsertStatement, indent: string): string {
  const prefixLines: string[] = [];
  if (stmt.with && stmt.with.length > 0) {
    prefixLines.push(formatCTEBlock(stmt.with, indent));
    prefixLines.push('');
  }
  const parts: string[] = [`${indent}INSERT INTO`];
  if (stmt.target.kind === 'function') {
    const f = stmt.target.func;
    const args = f.args.map((a) => formatExpr(a, indent)).join(', ');
    parts.push(`FUNCTION ${f.name}(${args})`);
  } else {
    const t = stmt.target.table;
    parts.push(
      t.database ? `${quoteIdent(t.database)}.${quoteIdent(t.table)}` : quoteIdent(t.table),
    );
  }
  if (stmt.partitionBy) {
    parts.push(`PARTITION BY ${formatExpr(stmt.partitionBy, indent)}`);
  }
  if (stmt.columns && stmt.columns.length > 0) {
    parts.push(`(${stmt.columns.map((c) => formatExpr(c, indent)).join(', ')})`);
  }
  if (stmt.insertSettings && stmt.insertSettings.length > 0) {
    parts.push(`SETTINGS ${formatSettingsList(stmt.insertSettings, indent)}`);
  }
  if (stmt.selectQuery) {
    const formatted = formatStatement(stmt.selectQuery, '');
    if (stmt.selectQuery.kind === 'select' && stmt.selectQuery.parenthesized) {
      parts.push(`(${formatted})`);
    } else {
      parts.push(formatted);
    }
  }
  const insertLine = parts.join(' ');
  return prefixLines.length > 0 ? `${prefixLines.join('\n')}\n${insertLine}` : insertLine;
}

function formatCreateStatement(
  stmt: Exclude<import('./ast').CreateStatement, CreateTableStatement>,
  indent: string,
): string {
  switch (stmt.kind) {
    case 'createUser':
      return formatCreateUserStatement(stmt, indent);
    case 'createRole':
      return formatCreateRoleStatement(stmt, indent);
    case 'createRowPolicy':
      return formatCreateRowPolicyStatement(stmt, indent);
    case 'createQuota':
      return formatCreateQuotaStatement(stmt, indent);
    case 'createSettingsProfile':
      return formatCreateSettingsProfileStatement(stmt, indent);
    case 'createNamedCollection':
      return formatCreateNamedCollectionStatement(stmt, indent);
    case 'createResource':
      return formatCreateResourceStatement(stmt, indent);
    case 'createWindowView':
      return `${indent}CREATE WINDOW VIEW ${stmt.rawBody}`;
    case 'createLiveView':
      return `${indent}CREATE LIVE VIEW ${stmt.rawBody}`;
    case 'createFunction':
      return `${indent}CREATE FUNCTION ${quoteIdent(stmt.name)} AS ${formatExpr(stmt.functionExpr, indent)}`;
    case 'createIndex': {
      let result = `${indent}CREATE INDEX ${quoteIdent(stmt.indexName)} ON ${formatTableRef(stmt.table)} (${formatExpr(stmt.indexExpr, indent)})`;
      if (stmt.indexType) result += ` TYPE ${formatIndexType(stmt.indexType)}`;
      if (stmt.granularity !== undefined) result += ` GRANULARITY ${stmt.granularity}`;
      return result;
    }
    case 'createWorkload':
      return formatCreateWorkloadStatement(stmt, indent);
    case 'createDictionary':
      return formatCreateDictionaryStatement(stmt, indent);
    case 'createDatabase':
      return formatCreateDatabaseStatement(stmt, indent);
    case 'createView':
      return formatCreateViewStatement(stmt, indent);
    case 'createMaterializedView':
      return formatCreateMaterializedViewStatement(stmt, indent);
  }
}

function formatCreateViewStatement(stmt: CreateViewStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  if (stmt.temporary) result += ' TEMPORARY';
  result += ' VIEW';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${formatTableRef(stmt.table)}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;
  if (stmt.tableElements) {
    const cols = stmt.tableElements.map((el) => formatTableElement(el, '')).join(', ');
    result += ` (${cols})`;
  }
  if (stmt.asQuery.kind === 'select' && (stmt.asQuery as SelectStatement).parenthesized) {
    result += `\nAS\n(${formatStatement(stmt.asQuery, indent)})`;
  } else {
    result += `\nAS\n${formatStatement(stmt.asQuery, indent)}`;
  }
  return result;
}

function formatCreateMaterializedViewStatement(
  stmt: CreateMaterializedViewStatement,
  indent: string,
): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' MATERIALIZED VIEW';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${formatTableRef(stmt.table)}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;
  if ((stmt as Record<string, unknown>).refresh) {
    result += `\nREFRESH ${(stmt as Record<string, unknown>).refresh}`;
  }
  if (stmt.toTable) result += `\nTO ${formatTableRef(stmt.toTable)}`;
  const mvPkInSchema = (stmt as Record<string, unknown>).primaryKeyInSchema as
    | import('./ast').Expression[]
    | undefined;
  if (stmt.tableElements || mvPkInSchema) {
    const innerIndent = indent + '    ';
    const elements = (stmt.tableElements || []).map((el) => formatTableElement(el, innerIndent));
    const pkFromColumns = stmt.tableElements?.some(
      (el) => el.kind === 'columnDef' && el.primaryKey,
    );
    if (mvPkInSchema && !pkFromColumns) {
      elements.push(
        `${innerIndent}PRIMARY KEY(${mvPkInSchema.map((e) => formatExpr(e, innerIndent)).join(', ')})`,
      );
    }
    result += `\n(\n${elements.join(',\n')}\n${indent})`;
  }
  if (stmt.engine) result += `\nENGINE = ${formatEngine(stmt.engine, indent)}`;
  result += formatStorageClauses(stmt, indent);
  if (stmt.populate) result += `\nPOPULATE`;
  if (stmt.empty) result += `\nEMPTY`;
  if (stmt.asQuery.kind === 'select' && (stmt.asQuery as SelectStatement).parenthesized) {
    result += `\nAS\n(${formatStatement(stmt.asQuery, indent)})`;
  } else {
    result += `\nAS\n${formatStatement(stmt.asQuery, indent)}`;
  }
  if ((stmt as Record<string, unknown>).format) {
    result += `\nFORMAT ${(stmt as Record<string, unknown>).format}`;
  }
  return result;
}

function formatCreateDatabaseStatement(stmt: CreateDatabaseStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' DATABASE';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${quoteIdent(stmt.name)}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;
  if (stmt.engine) result += `\nENGINE = ${formatEngine(stmt.engine, indent)}`;
  if (stmt.orderBy) {
    result += `\nORDER BY ${formatOrderByExprs(stmt.orderBy, indent)}`;
  }
  if (stmt.settings) {
    result += `\nSETTINGS ${formatSettingsList(stmt.settings, indent)}`;
  }
  if (stmt.comment) {
    result += `\nCOMMENT ${formatStringLiteral(stmt.comment)}`;
  }
  if ((stmt as Record<string, unknown>).format) {
    result += `\nFORMAT ${(stmt as Record<string, unknown>).format}`;
  }
  return result;
}

function formatCreateDictionaryStatement(stmt: CreateDictionaryStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' DICTIONARY';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${formatTableRef(stmt.table)}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;

  // Attributes
  const innerIndent = indent + '    ';
  const attrs = stmt.dictAttrs.map((a) => {
    let s = `${innerIndent}${quoteIdent(a.name)} ${formatDataType(a.type)}`;
    if (a.defaultValue) s += ` DEFAULT ${formatExpr(a.defaultValue, innerIndent)}`;
    if (a.expression) s += ` EXPRESSION ${formatExpr(a.expression, innerIndent)}`;
    return s;
  });
  result += `\n(\n${attrs.join(',\n')}\n${indent})`;

  // Dict definition
  const def = stmt.dictDef;
  if (def.primaryKey) {
    result += `\nPRIMARY KEY ${def.primaryKey.map((e) => formatExpr(e, indent)).join(', ')}`;
  }
  if (def.source) {
    const pairs = def.source.pairs
      .map((p) => {
        // STRUCTURE value is an array of {name, type} column defs
        if (Array.isArray(p.value)) {
          const cols = (p.value as { name: string; type: import('./ast').DataType }[])
            .map((c) => `${quoteIdent(c.name)} ${formatDataType(c.type)}`)
            .join(' ');
          return `${p.name} (${cols})`;
        }
        return `${p.name} ${formatExpr(p.value as import('./ast').Expression, indent)}`;
      })
      .join(' ');
    result += `\nSOURCE(${def.source.name}(${pairs}))`;
  }
  if (def.lifetime) {
    if (def.lifetime.value !== undefined) {
      result += `\nLIFETIME(${def.lifetime.value})`;
    } else {
      const parts: string[] = [];
      if (def.lifetime.min !== undefined) parts.push(`MIN ${def.lifetime.min}`);
      if (def.lifetime.max !== undefined) parts.push(`MAX ${def.lifetime.max}`);
      result += `\nLIFETIME(${parts.join(' ')})`;
    }
  }
  if (def.range) {
    const rangeParts = def.range.map((r) => `${r.name} ${formatExpr(r.value, indent)}`).join(' ');
    result += `\nRANGE(${rangeParts})`;
  }
  if (def.layout) {
    const pairs = def.layout.pairs.map((p) => `${p.name} ${formatExpr(p.value, indent)}`).join(' ');
    result += `\nLAYOUT(${def.layout.name}(${pairs}))`;
  }
  if (def.settings) {
    result += `\nSETTINGS(${formatSettingsList(def.settings, indent)})`;
  }
  if (def.comment) {
    result += `\nCOMMENT ${formatStringLiteral(def.comment)}`;
  }
  return result;
}

function formatCreateWorkloadStatement(stmt: CreateWorkloadStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' WORKLOAD';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${quoteIdent(stmt.name)}`;
  if (stmt.parentWorkload) result += ` IN ${quoteIdent(stmt.parentWorkload)}`;
  return result;
}

function formatCreateUserStatement(stmt: CreateUserStatement, indent: string): string {
  let result = `${indent}CREATE USER`;
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ` ${formatAccessControlNames(stmt.names)}`;
  if (stmt.auth) {
    const allEmpty =
      stmt.auth.length === 1 && !stmt.auth[0].secret && stmt.auth[0].sshKeys === undefined;
    if (allEmpty && Object.keys(stmt.auth[0]).length === 0) {
      result += ' NOT IDENTIFIED';
    } else {
      const authParts = stmt.auth
        .map((a) => {
          if (a.sshKeys !== undefined) {
            // SSH keys: emit placeholder keys
            const keys = Array.from(
              { length: a.sshKeys },
              (_, i) => `KEY 'key${i}' TYPE 'ssh-rsa'`,
            );
            return `WITH ssh_key BY ${keys.join(', ')}`;
          }
          if (a.secret) {
            return `BY '${escapeString(a.secret)}'`;
          }
          return '';
        })
        .filter(Boolean);
      if (authParts.length > 0) {
        result += ` IDENTIFIED ${authParts.join(', ')}`;
      }
    }
  }
  if (stmt.onCluster) result += ` ON CLUSTER ${stmt.onCluster}`;
  if (stmt.host) result += ` HOST ${formatHostItems(stmt.host)}`;
  if (stmt.settings !== undefined)
    result += ` SETTINGS ${formatAccessControlSettings(stmt.settings, indent)}`;
  if (stmt.defaultRole) result += ` DEFAULT ROLE ${formatRoleTarget(stmt.defaultRole)}`;
  if (stmt.defaultDatabase) result += ` DEFAULT DATABASE ${quoteIdent(stmt.defaultDatabase)}`;
  if (stmt.grantees) result += ` GRANTEES ${formatRoleTarget(stmt.grantees)}`;
  if (stmt.validUntil) result += ` VALID UNTIL '${stmt.validUntil}'`;
  return result;
}

function formatCreateRoleStatement(stmt: CreateRoleStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' ROLE';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${formatAccessControlNames(stmt.names)}`;
  if (stmt.settings !== undefined)
    result += ` SETTINGS ${formatAccessControlSettings(stmt.settings, indent)}`;
  return result;
}

function formatCreateRowPolicyStatement(stmt: CreateRowPolicyStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += stmt.hasRowKeyword ? ' ROW POLICY' : ' POLICY';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  const targets = stmt.targets
    .map((t) => `${t.names.join(', ')} ON ${formatTableRef(t.table)}`)
    .join(', ');
  result += ` ${targets}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${quoteIdent(stmt.onCluster)}`;
  if (stmt.using) result += ` USING ${formatExpr(stmt.using, indent)}`;
  if (stmt.restrictive) result += ` AS ${stmt.restrictive}`;
  if (stmt.to) result += ` TO ${formatRoleTarget(stmt.to)}`;
  return result;
}

function formatCreateQuotaStatement(stmt: CreateQuotaStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' QUOTA';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${stmt.names.join(', ')}`;
  if (stmt.keyed) {
    if ('notKeyed' in stmt.keyed) {
      result += ' NOT KEYED';
    } else {
      result += ` KEYED BY ${stmt.keyed.keys.join(', ')}`;
    }
  }
  if (stmt.intervals) {
    for (const interval of stmt.intervals) {
      result += ' FOR';
      if (interval.randomized) result += ' RANDOMIZED';
      result += ` ${interval.duration} ${interval.unit}`;
      if (interval.trackingOnly) result += ' TRACKING ONLY';
      else if (interval.noLimits) result += ' NO LIMITS';
      else if (interval.limits) {
        result +=
          ' ' +
          interval.limits.map((l) => `MAX ${l.name} = ${formatExpr(l.value, indent)}`).join(', ');
      }
    }
  }
  if (stmt.to) result += ` TO ${formatRoleTarget(stmt.to)}`;
  return result;
}

function formatCreateSettingsProfileStatement(
  stmt: CreateSettingsProfileStatement,
  indent: string,
): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += stmt.hasSettingsKeyword ? ' SETTINGS PROFILE' : ' PROFILE';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${stmt.names.join(', ')}`;
  if (stmt.settings !== undefined)
    result += ` SETTINGS ${formatAccessControlSettings(stmt.settings, indent)}`;
  if (stmt.to) result += ` TO ${formatRoleTarget(stmt.to)}`;
  return result;
}

function formatCreateNamedCollectionStatement(
  stmt: CreateNamedCollectionStatement,
  indent: string,
): string {
  let result = `${indent}CREATE NAMED COLLECTION`;
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${quoteIdent(stmt.name)}`;
  if (stmt.onCluster) result += ` ON CLUSTER ${stmt.onCluster}`;
  result += ` AS ${stmt.items.map((i) => `${i.key} = ${formatExpr(i.value, indent)}`).join(', ')}`;
  return result;
}

function formatCreateResourceStatement(stmt: CreateResourceStatement, indent: string): string {
  let result = `${indent}CREATE`;
  if (stmt.orReplace) result += ' OR REPLACE';
  result += ' RESOURCE';
  if (stmt.ifNotExists) result += ' IF NOT EXISTS';
  result += ` ${quoteIdent(stmt.name)}`;
  const specs = stmt.specs
    .map(
      (s) =>
        `${s.operation.toLowerCase()} ${s.resourceType.toLowerCase()} ${quoteIdent(s.resourceName)}`,
    )
    .join(', ');
  result += ` (${specs})`;
  return result;
}

function formatStorageClauses(
  stmt: {
    orderBy?: TableOrderByItem[];
    partitionBy?: Expression;
    primaryKey?: Expression[];
    sampleBy?: Expression;
    ttl?: TTLItem[];
    settings?: SettingItem[];
    comment?: string;
    primaryKeyAfterOrderBy?: boolean;
    settingsAfterOrderBy?: boolean;
    querySettings?: SettingItem[];
  },
  indent: string,
): string {
  let result = '';

  const pkAfterOb = (stmt as Record<string, unknown>).primaryKeyAfterOrderBy;
  const settingsAfterOb = (stmt as Record<string, unknown>).settingsAfterOrderBy;

  // When settingsAfterOrderBy is not set, SETTINGS goes before any ordering clauses
  if (!settingsAfterOb && stmt.settings) {
    result += `\n${indent}SETTINGS ${formatSettingsList(stmt.settings, indent)}`;
  }

  // PRIMARY KEY before ORDER BY (unless primaryKeyAfterOrderBy)
  if (!pkAfterOb && stmt.primaryKey) {
    result += `\n${indent}PRIMARY KEY ${formatPrimaryKeyExprs(stmt.primaryKey, indent)}`;
  }

  if (stmt.orderBy) {
    result += `\n${indent}ORDER BY ${formatOrderByExprs(stmt.orderBy, indent)}`;
  }

  if (pkAfterOb && stmt.primaryKey) {
    result += `\n${indent}PRIMARY KEY ${formatPrimaryKeyExprs(stmt.primaryKey, indent)}`;
  }

  if (stmt.partitionBy) {
    result += `\n${indent}PARTITION BY ${formatExpr(stmt.partitionBy, indent)}`;
  }
  if (stmt.sampleBy) {
    result += `\n${indent}SAMPLE BY ${formatExpr(stmt.sampleBy, indent)}`;
  }
  if (stmt.ttl) {
    const ttlStr = stmt.ttl
      .map((item) => {
        let s = formatExpr(item.expr, indent);
        if (item.where) s += ` WHERE ${formatExpr(item.where, indent)}`;
        return s;
      })
      .join(',\n' + indent + '    ');
    result += `\n${indent}TTL ${ttlStr}`;
  }

  if (settingsAfterOb && stmt.settings) {
    result += `\n${indent}SETTINGS ${formatSettingsList(stmt.settings, indent)}`;
  }

  if (stmt.comment) {
    result += `\n${indent}COMMENT ${formatStringLiteral(stmt.comment)}`;
  }

  // Query-level SETTINGS (separate from storage SETTINGS)
  const querySettings = (stmt as Record<string, unknown>).querySettings as
    | SettingItem[]
    | undefined;
  if (querySettings && querySettings.length > 0) {
    result += `\n${indent}SETTINGS ${formatSettingsList(querySettings, indent)}`;
  }

  return result;
}

function formatCreateTableStatement(stmt: CreateTableStatement, indent: string): string {
  const parts: string[] = [];

  // Header
  if (stmt.replace) {
    parts.push(`${indent}REPLACE TABLE`);
  } else {
    let header = `${indent}CREATE`;
    if (stmt.orReplace) header += ' OR REPLACE';
    if (stmt.temporary) header += ' TEMPORARY';
    header += ' TABLE';
    if (stmt.ifNotExists) header += ' IF NOT EXISTS';
    parts.push(header);
  }

  // Table name
  parts.push(formatTableRef(stmt.table));

  // ON CLUSTER
  if (stmt.onCluster) {
    parts.push(`ON CLUSTER ${quoteIdent(stmt.onCluster)}`);
  }

  let result = parts.join(' ');

  // CLONE AS form
  if (stmt.clone && stmt.asTable) {
    result += `\n${indent}CLONE AS ${formatTableRef(stmt.asTable)}`;
    if (stmt.engine) result += `\n${indent}ENGINE = ${formatEngine(stmt.engine, indent)}`;
    result += formatStorageClauses(stmt, indent);
    return result;
  }

  // AS table form (no schema)
  if (stmt.asTable && !stmt.tableElements) {
    if (stmt.empty) result += ' EMPTY';
    result += ` AS ${formatTableRef(stmt.asTable)}`;
    if (stmt.engine) result += `\n${indent}ENGINE = ${formatEngine(stmt.engine, indent)}`;
    result += formatStorageClauses(stmt, indent);
    return result;
  }

  // Column schema
  if (stmt.tableElements || stmt.primaryKeyInSchema) {
    const innerIndent = indent + '    ';
    const elements: string[] = [];
    if (stmt.tableElements) {
      for (const el of stmt.tableElements) {
        elements.push(formatTableElement(el, innerIndent));
      }
    }
    const pkFromColumns = stmt.tableElements?.some(
      (el) => el.kind === 'columnDef' && el.primaryKey,
    );
    if (stmt.primaryKeyInSchema && !pkFromColumns) {
      elements.push(
        `${innerIndent}PRIMARY KEY(${stmt.primaryKeyInSchema.map((e) => formatExpr(e, innerIndent)).join(', ')})`,
      );
    }
    result += `\n(\n${elements.join(',\n')}\n${indent})`;
  }

  // ENGINE
  if (stmt.engine) {
    result += `\n${indent}ENGINE = ${formatEngine(stmt.engine, indent)}`;
  }

  // Storage clauses (ORDER BY, PRIMARY KEY, PARTITION BY, etc.)
  result += formatStorageClauses(stmt, indent);

  // EMPTY
  if (stmt.empty) {
    result += `\n${indent}EMPTY`;
  }

  // AS table function
  if (stmt.asTableFunction) {
    const args = stmt.asTableFunction.args.map((a) => formatExpr(a, indent)).join(', ');
    result += ` AS ${stmt.asTableFunction.name}(${args})`;
  }

  // AS SELECT
  if (stmt.asQuery) {
    if (stmt.asQuery.kind === 'select' && (stmt.asQuery as SelectStatement).parenthesized) {
      result += ` AS\n(${formatStatement(stmt.asQuery, indent)})`;
    } else {
      result += ` AS\n${formatStatement(stmt.asQuery, indent)}`;
    }
  }

  // FORMAT
  const tableFormat = (stmt as Record<string, unknown>).format as string | undefined;
  if (tableFormat) {
    result += `\n${indent}FORMAT ${tableFormat}`;
  }

  return result;
}

function formatEngine(engine: CreateTableStatement['engine'] & {}, indent: string): string {
  let result = engine.name;
  if (engine.args !== undefined) {
    result += `(${engine.args.map((a) => formatExpr(a, indent)).join(', ')})`;
  }
  return result;
}

function formatDataType(dt: import('./ast').DataType): string {
  if (!dt.args) return dt.name;
  if (dt.args.length === 0) return `${dt.name}()`;
  const args = dt.args.map((a) => {
    switch (a.kind) {
      case 'type':
        return formatDataType(a.type);
      case 'namedField':
        return `${quoteIdent(a.name)} ${formatDataType(a.type)}`;
      case 'literal':
        return a.value;
      case 'enumValues':
        return a.values
          .map((v) => {
            if (v.name === null) return 'NULL';
            const nameStr = `'${v.name}'`;
            return v.value !== undefined ? `${nameStr} = ${v.value}` : nameStr;
          })
          .join(', ');
      case 'setting':
        return `${a.name} = ${formatExpr(a.value, '')}`;
    }
  });
  return `${dt.name}(${args.join(', ')})`;
}

function formatCodecItems(items: import('./ast').CodecItem[]): string {
  const fmtCodecName = (name: string) =>
    /^[a-zA-Z_][a-zA-Z0-9_]*$/.test(name) ? name : quoteIdent(name);
  const parts = items.map((c) => {
    if (c.args !== undefined && c.args.length > 0) {
      return `${fmtCodecName(c.name)}(${c.args.map((a) => formatExpr(a, '')).join(', ')})`;
    }
    if (c.args !== undefined) return `${fmtCodecName(c.name)}()`;
    return fmtCodecName(c.name);
  });
  return parts.join(', ');
}

function formatIndexType(it: import('./ast').IndexType): string {
  if (it.args !== undefined && it.args.length > 0) {
    return `${it.name}(${it.args.map((a) => formatExpr(a, '')).join(', ')})`;
  }
  if (it.args !== undefined) return `${it.name}()`;
  return it.name;
}

function formatTableElement(el: import('./ast').TableElement, indent: string): string {
  switch (el.kind) {
    case 'columnDef': {
      const parts = [`${indent}${quoteIdent(el.name)}`];
      if (el.type) parts.push(formatDataType(el.type));
      if (el.collate) parts.push(`COLLATE ${el.collate}`);
      if (el.nullable) parts.push(el.nullable);
      if (el.primaryKey) parts.push('PRIMARY KEY');
      if (el.defaultKind) {
        parts.push(el.defaultKind);
        if (el.defaultExpr) parts.push(formatExpr(el.defaultExpr, indent));
      }
      if (el.comment) parts.push(`COMMENT ${formatStringLiteral(el.comment)}`);
      if (el.codec) parts.push(`CODEC(${formatCodecItems(el.codec)})`);
      if (el.statistics) parts.push(`STATISTICS(${formatCodecItems(el.statistics)})`);
      if (el.ttl) parts.push(`TTL ${formatExpr(el.ttl, indent)}`);
      if (el.columnSettings) {
        parts.push(
          `SETTINGS(${el.columnSettings.map((s) => `${s.name} = ${formatExpr(s.value, indent)}`).join(', ')})`,
        );
      }
      return parts.join(' ');
    }
    case 'constraintDef':
      return `${indent}CONSTRAINT ${quoteIdent(el.name)} ${el.constraintType} ${formatExpr(el.expr, indent)}`;
    case 'indexDef': {
      let result = `${indent}INDEX ${quoteIdent(el.name)} ${formatExpr(el.expr, indent)} TYPE ${formatIndexType(el.indexType)}`;
      if (el.granularity !== undefined) result += ` GRANULARITY ${el.granularity}`;
      return result;
    }
    case 'projectionDef': {
      if (el.indexExpr) {
        return `${indent}PROJECTION ${quoteIdent(el.name)} INDEX ${formatExpr(el.indexExpr, indent)} TYPE ${el.indexType ? formatIndexType(el.indexType) : ''}`;
      }
      let projResult = `${indent}PROJECTION ${quoteIdent(el.name)} (${formatStatement(el.query!, indent)})`;
      const projSettings = (el as Record<string, unknown>).projectionSettings as
        | SettingItem[]
        | undefined;
      if (projSettings && projSettings.length > 0) {
        projResult += ` WITH SETTINGS(${projSettings.map((s) => `${s.name} = ${formatExpr(s.value, indent)}`).join(', ')})`;
      }
      return projResult;
    }
    case 'foreignKeyDef': {
      const cols = el.columns.map((c) => formatExpr(c, indent)).join(', ');
      const refCols = el.refColumns.map((c) => formatExpr(c, indent)).join(', ');
      return `${indent}FOREIGN KEY (${cols}) REFERENCES ${formatTableRef(el.refTable)} (${refCols})`;
    }
  }
}

function formatTableOrderByItem(item: TableOrderByItem, indent: string): string {
  let result = formatExpr(item.expr, indent);
  if (item.dir === 'DESC') result += ' DESC';
  else if (item.dir === 'ASC') result += ' ASC';
  return result;
}

function formatOrderByExprs(exprs: TableOrderByItem[], indent: string): string {
  const isParens = (exprs as unknown as { _parenthesized?: boolean })._parenthesized;
  if (exprs.length === 1 && !isParens) return formatTableOrderByItem(exprs[0], indent);
  return `(${exprs.map((e) => formatTableOrderByItem(e, indent)).join(', ')})`;
}

function formatPrimaryKeyExprs(exprs: Expression[], indent: string): string {
  if (exprs.length === 1) return formatExpr(exprs[0], indent);
  return `(${exprs.map((e) => formatExpr(e, indent)).join(', ')})`;
}

function formatStringLiteral(str: string): string {
  return `'${str.replace(/'/g, "\\'")}'`;
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
      let s = formatStatement(q, indent);
      // Prepend leading comments on union members
      if (q.leadingComments && q.leadingComments.length > 0) {
        s = q.leadingComments.join('\n') + '\n' + s;
      }
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

// ── Per-kind expression formatters ──────────────────────────────────────────
// Each function accepts the specific expression type and indent, handles the
// parenthesized flag, and returns a string. Leading/trailing comments are NOT
// rendered here — that is formatExpr's responsibility.

function formatLiteral(expr: Extract<Expression, { kind: 'literal' }>): string {
  let result: string;
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
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatColumnRef(expr: Extract<Expression, { kind: 'columnRef' }>): string {
  let result = expr.parts.map(quoteIdent).join('.');
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatAsterisk(expr: Extract<Expression, { kind: 'asterisk' }>, indent: string): string {
  let result =
    '*' +
    (expr.transformers
      ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
      : '');
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatQualifiedAsterisk(
  expr: Extract<Expression, { kind: 'qualifiedAsterisk' }>,
  indent: string,
): string {
  return (
    `${expr.parts.map(quoteIdent).join('.')}.*` +
    (expr.transformers
      ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
      : '')
  );
}

function formatTupleExpansion(
  expr: Extract<Expression, { kind: 'tupleExpansion' }>,
  indent: string,
): string {
  return (
    `${formatExpr(expr.expr, indent)}.*` +
    (expr.transformers
      ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
      : '')
  );
}

function formatColumnsExpr(
  expr: Extract<Expression, { kind: 'columnsExpr' }>,
  indent: string,
): string {
  const argsStr = expr.args.map((a) => formatExpr(a, indent)).join(', ');
  const base = `${expr.qualifier ? quoteIdent(expr.qualifier) + '.' : ''}COLUMNS(${argsStr})`;
  return (
    base +
    (expr.transformers
      ? expr.transformers.map((t) => ' ' + formatTransformer(t, indent)).join('')
      : '')
  );
}

function formatQueryParam(expr: Extract<Expression, { kind: 'queryParam' }>): string {
  return `{${expr.name}:${expr.type}}`;
}

function formatAlias(expr: Extract<Expression, { kind: 'alias' }>, indent: string): string {
  // MySQL global variables (@@varname) are formatted as @@varname directly
  if (expr.alias.startsWith('@@')) return expr.alias;
  const aliasStr = quoteIdent(expr.alias);
  // Wrap lambda expressions in parens so AS binds to the lambda, not its body
  const innerStr =
    expr.expr.kind === 'lambdaExpr'
      ? `(${formatExpr(expr.expr, indent)})`
      : formatExpr(expr.expr, indent);
  let result = `${innerStr} AS ${aliasStr}`;
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatArray(expr: Extract<Expression, { kind: 'arrayLiteral' }>, indent: string): string {
  let result =
    expr.source !== undefined
      ? expr.source
      : `[${expr.elements.map((e) => formatExpr(e, indent)).join(', ')}]`;
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatTuple(expr: Extract<Expression, { kind: 'tupleLiteral' }>, indent: string): string {
  let result =
    expr.source !== undefined
      ? expr.source
      : `(${expr.elements.map((e) => formatExpr(e, indent)).join(', ')})`;
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatCastExpr(expr: Extract<Expression, { kind: 'castExpr' }>, indent: string): string {
  let result: string;
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
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatLambdaExpr(
  expr: Extract<Expression, { kind: 'lambdaExpr' }>,
  indent: string,
): string {
  let result: string;
  if (expr.params.length === 1) {
    result = `${expr.params[0]} -> ${formatExpr(expr.body, indent)}`;
  } else {
    result = `(${expr.params.join(', ')}) -> ${formatExpr(expr.body, indent)}`;
  }
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatUnaryExpr(expr: Extract<Expression, { kind: 'unaryExpr' }>, indent: string): string {
  // NOT formatting depends on inner expression type:
  // - Simple (literal, columnRef, functionCall, castExpr, etc.): NOT inner (space form, low precedence)
  // - Complex (AND/OR, tuple, alias, subquery): NOT(inner) (PrimaryBase form, high precedence)
  // The NOT(inner) form uses PrimaryBase's KW_NOT "(" ExpressionWithImplicitAlias ")" rule
  const inner = formatExpr(expr.expr, indent);
  const innerPrec = exprPrecedence(expr.expr);
  let result: string;
  if (
    innerPrec <= 2 ||
    expr.expr.kind === 'tupleLiteral' ||
    expr.expr.kind === 'alias' ||
    expr.expr.kind === 'subqueryExpr'
  ) {
    result = `NOT(${inner})`;
  } else {
    result = `NOT ${inner}`;
  }
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatBinaryExpr(
  expr: Extract<Expression, { kind: 'binaryExpr' }>,
  indent: string,
): string {
  let leftStr = wrapChildCore(expr.left, expr.op, false, indent);
  const rightStr = wrapChildCore(expr.right, expr.op, true, indent);
  // Render leading comments on the left operand
  if (expr.left.leadingComments && expr.left.leadingComments.length > 0) {
    const lc = expr.left.leadingComments.map((c) => `${indent}${c}`).join('\n');
    leftStr = lc + '\n' + indent + leftStr;
  }
  let result: string;
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
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatNaryExpr(expr: Extract<Expression, { kind: 'naryExpr' }>, indent: string): string {
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
  let result = parts.join('\n');
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatSubqueryExpr(
  expr: Extract<Expression, { kind: 'subqueryExpr' }>,
  indent: string,
): string {
  const innerIndent = indent + '    ';
  return `(\n${formatStatement(expr.query, innerIndent)}\n${indent})`;
}

function formatInExpr(expr: Extract<Expression, { kind: 'inExpr' }>, indent: string): string {
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
  let result: string;
  if (Array.isArray(expr.values)) {
    result = `${inExprStr} ${op} (${expr.values.map((v) => formatExpr(v, indent)).join(', ')})`;
  } else {
    const innerIndent = indent + '    ';
    result = `${inExprStr} ${op} (\n${formatStatement(expr.values.query, innerIndent)}\n${indent})`;
  }
  if (isParenthesized(expr)) result = `(${result})`;
  return result;
}

function formatJsonSubcolumn(
  expr: Extract<Expression, { kind: 'jsonSubcolumn' }>,
  indent: string,
): string {
  // Backtick-quote the type if it contains characters that require quoting (parens, spaces, etc.)
  const needsQuoting = /[^a-zA-Z0-9_]/.test(expr.type);
  const typeStr = needsQuoting ? `\`${expr.type}\`` : expr.type;
  let result = `${formatExpr(expr.expr, indent)}.:${typeStr}`;
  if (expr.path && expr.path.length > 0) {
    result +=
      '.' + expr.path.map((p: string) => (/[^a-zA-Z0-9_]/.test(p) ? `\`${p}\`` : p)).join('.');
  }
  return result;
}

// Format an expression without rendering its leading/trailing comments.
// Used by list formatters and operator cases that handle comments with their own layout.
function formatExprCore(expr: Expression, indent: string): string {
  switch (expr.kind) {
    case 'literal':
      return formatLiteral(expr);
    case 'columnRef':
      return formatColumnRef(expr);
    case 'asterisk':
      return formatAsterisk(expr, indent);
    case 'qualifiedAsterisk':
      return formatQualifiedAsterisk(expr, indent);
    case 'tupleExpansion':
      return formatTupleExpansion(expr, indent);
    case 'columnsExpr':
      return formatColumnsExpr(expr, indent);
    case 'queryParam':
      return formatQueryParam(expr);
    case 'alias':
      return formatAlias(expr, indent);
    case 'arrayLiteral':
      return formatArray(expr, indent);
    case 'tupleLiteral':
      return formatTuple(expr, indent);
    case 'functionCall': {
      let result = formatFunctionCall(expr, indent);
      if (isParenthesized(expr)) result = `(${result})`;
      return result;
    }
    case 'castExpr':
      return formatCastExpr(expr, indent);
    case 'lambdaExpr':
      return formatLambdaExpr(expr, indent);
    case 'unaryExpr':
      return formatUnaryExpr(expr, indent);
    case 'binaryExpr':
      return formatBinaryExpr(expr, indent);
    case 'naryExpr':
      return formatNaryExpr(expr, indent);
    case 'subqueryExpr':
      return formatSubqueryExpr(expr, indent);
    case 'inExpr':
      return formatInExpr(expr, indent);
    case 'jsonSubcolumn':
      return formatJsonSubcolumn(expr, indent);
  }
}

function formatFunctionCall(expr: FunctionCall, indent: string): string {
  // Quote function name if it contains special characters (allow dots for qualified names like lambda.nested)
  const funcName = /^[a-zA-Z_][a-zA-Z0-9_.]*$/.test(expr.name)
    ? expr.name
    : `\`${expr.name.replace(/`/g, '``')}\``;
  // NOT(tuple) — from PrimaryBase KW_NOT TupleLiteral rule
  if (expr.name === 'not' && expr.args.length === 1 && expr.args[0].kind === 'tupleLiteral') {
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
  if (spec.baseWindow) {
    parts.push(quoteIdent(spec.baseWindow));
  }
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
  if (from.kind === 'tableFunctionRef') return formatTableFunction(from, indent);
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
  if (from.kind === 'tableFunctionRef') {
    return [
      ...formatFromLeadingComments(from, innerIndent),
      `${innerIndent}${formatTableFunction(from, innerIndent)}`,
    ];
  }
  if (from.kind === 'joinExpr') {
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

function formatCTEBlock(ctes: CTE[], indent: string, recursive?: boolean): string {
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
      const withKw = recursive ? 'WITH RECURSIVE ' : 'WITH ';
      const prefix = i === 0 ? `${indent}${withKw}` : `${indent}`;
      if (cte.kind === 'cteExpr') {
        const suffix = i < ctes.length - 1 ? ',' : '';
        parts.push(
          `${prefix}${formatExprCore(cte.expr, innerIndent)} AS ${quoteIdent(cte.name)}${suffix}`,
        );
      } else if (cte.kind === 'cteTuple') {
        const suffix = i < ctes.length - 1 ? ',' : '';
        const inner = cte.elements
          .map((e: Expression) => `${innerIndent}${formatExpr(e, innerIndent)}`)
          .join(',\n');
        parts.push(`${prefix}(\n${inner})${suffix}`);
      } else {
        const suffix = i < ctes.length - 1 ? '),' : ')';
        const colAliases = cte.columnAliases
          ? ` (${cte.columnAliases.map(quoteIdent).join(', ')})`
          : '';
        // Include leading comments on the CTE body query
        let bodyComments = '';
        if (cte.query.leadingComments && cte.query.leadingComments.length > 0) {
          bodyComments =
            cte.query.leadingComments.map((c: string) => `${innerIndent}${c}`).join('\n') + '\n';
        }
        parts.push(
          `${prefix}${quoteIdent(cte.name)}${colAliases} AS (\n` +
            bodyComments +
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

    if (cte.kind === 'cteTuple') {
      const suffix = isLast ? '' : ',';
      const withKw2 = recursive ? 'WITH RECURSIVE ' : 'WITH ';
      const tuplePrefix = isFirst ? `${indent}${withKw2}` : `${cteIndent}`;
      const inner = cte.elements
        .map((e: Expression) => `${innerIndent}${formatExpr(e, innerIndent)}`)
        .join(',\n');
      lines.push(`${tuplePrefix}(\n${inner})${suffix}${trailingStr}`);
    } else if (cte.kind === 'cteSubquery') {
      const suffix = isLast ? ')' : '),';
      const withKw2 = recursive ? 'WITH RECURSIVE ' : 'WITH ';
      const namePrefix = isFirst ? `${indent}${withKw2}` : `${cteIndent}`;
      const colAliases = cte.columnAliases
        ? ` (${cte.columnAliases.map(quoteIdent).join(', ')})`
        : '';
      lines.push(`${namePrefix}${quoteIdent(cte.name)}${colAliases} AS (`);

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
      const withKw3 = recursive ? 'WITH RECURSIVE ' : 'WITH ';
      const exprPrefix = isFirst ? `${indent}${withKw3}` : `${cteIndent}`;
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
    lines.push(formatCTEBlock(stmt.with, indent, stmt.recursive));
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
      lines.push(`${indent}WINDOW ${quoteIdent(w.name)} AS (${formatWindowSpec(w.spec, indent)})`);
    } else {
      lines.push(`${indent}WINDOW`);
      lines.push(
        stmt.windows
          .map(
            (w) =>
              `${innerIndent}${quoteIdent(w.name)} AS (${formatWindowSpec(w.spec, innerIndent)})`,
          )
          .join(',\n'),
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
