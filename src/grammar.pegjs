// ClickHouse SQL Grammar
{{
  // Keywords that cannot be used as bare identifiers
  const KEYWORDS = new Set([
    'SELECT', 'FROM', 'PREWHERE', 'WHERE', 'GROUP', 'HAVING', 'ORDER', 'BY',
    'LIMIT', 'OFFSET', 'WITH', 'ASC', 'AS', 'AND', 'OR', 'DESC',
    'NULL', 'NOT', 'INTERSECT', 'INTO', 'IN', 'DISTINCT', 'JOIN', 'ON', 'USING', 'FINAL',
    'SETTINGS', 'UNION', 'ILIKE', 'LIKE', 'BETWEEN',
    'EXCEPT', 'WINDOW', 'OVER', 'QUALIFY', 'SAMPLE',
  ]);

  // Flatten a whitespace result { trailing: [...], leading: [...] } into a single array
  function flattenWs(ws) {
    return ws.trailing.concat(ws.leading);
  }

  // Prepend comments to a node's leadingComments (no-op if empty)
  function addLeading(node, comments) {
    if (comments.length > 0) {
      return { ...node, leadingComments: [...comments, ...(node.leadingComments || [])] };
    }
    return node;
  }

  // Append comments to a node's trailingComments (no-op if empty)
  function addTrailing(node, comments) {
    if (comments.length > 0) {
      return { ...node, trailingComments: [...(node.trailingComments || []), ...comments] };
    }
    return node;
  }

  // Shorthand: flatten a whitespace result and prepend as leading comments
  function addWsLeading(node, ws) {
    return addLeading(node, flattenWs(ws));
  }

  // Attach leading and trailing comments from surrounding whitespace (e.g., parenthesized queries)
  function addSurroundingWs(node, beforeWs, afterWs) {
    return addTrailing(addLeading(node, flattenWs(beforeWs)), flattenWs(afterWs));
  }

  // Build a comma-separated list with comment distribution:
  //   ws before comma → all comments go to leading on next item
  //   ws after comma → .trailing goes to trailing on prev item, .leading goes to leading on next
  function buildCommaList(head, tail, itemIndex = 3) {
    const items = [head];
    for (const t of tail) {
      const ws1 = t[0]; // before comma
      const ws2 = t[2]; // after comma
      items[items.length - 1] = addTrailing(items[items.length - 1], ws2.trailing);
      items.push(addLeading(t[itemIndex], [...flattenWs(ws1), ...ws2.leading]));
    }
    return items;
  }

  // Interval unit name lookup (lowercase key → capitalized unit name)
  const INTERVAL_UNITS = {
    nanosecond: 'Nanosecond', nanoseconds: 'Nanosecond', ns: 'Nanosecond',
    microsecond: 'Microsecond', microseconds: 'Microsecond', us: 'Microsecond',
    millisecond: 'Millisecond', milliseconds: 'Millisecond', ms: 'Millisecond',
    second: 'Second', seconds: 'Second', s: 'Second',
    minute: 'Minute', minutes: 'Minute', min: 'Minute',
    hour: 'Hour', hours: 'Hour', h: 'Hour',
    day: 'Day', days: 'Day', d: 'Day',
    week: 'Week', weeks: 'Week', w: 'Week',
    month: 'Month', months: 'Month', m: 'Month',
    quarter: 'Quarter', quarters: 'Quarter', q: 'Quarter',
    year: 'Year', years: 'Year', y: 'Year',
    // SQL_TSI_ prefixed units for TIMESTAMP_ADD/TIMESTAMP_SUB
    sql_tsi_nanosecond: 'Nanosecond', sql_tsi_microsecond: 'Microsecond',
    sql_tsi_millisecond: 'Millisecond', sql_tsi_second: 'Second',
    sql_tsi_minute: 'Minute', sql_tsi_hour: 'Hour', sql_tsi_day: 'Day',
    sql_tsi_week: 'Week', sql_tsi_month: 'Month', sql_tsi_quarter: 'Quarter',
    sql_tsi_year: 'Year',
  };

}}

{
  // Attach source location to a node (must be in per-parse initializer to access location())
  function loc(node) {
    return { ...node, location: location() };
  }
}

// Statements is the top-level rule, supporting UNION ALL and FORMAT clauses
// Allows empty input (e.g., SQL files containing only comments)
Statements
  = pre:_ head:TopLevelStatement headWs:_
    rest:(";"+ ws2:_ TopLevelStatement ws3:_)*
    ";"* finalWs:_ {
      head = addLeading(head, flattenWs(pre));
      // headWs: .trailing = same-line after head → trailing on head
      // headWs: .leading = after-newline before ";" → deferred to next stmt (or trailing on last if single stmt)
      head = addTrailing(head, headWs.trailing);
      let pendingLeading = headWs.leading;
      const stmts = [head];
      for (const r of rest) {
        const ws2val = r[1]; // after ";"
        let stmt = r[2];
        const ws3val = r[3]; // after stmt
        // Same-line after ";" → trailing on prev stmt
        stmts[stmts.length - 1] = addTrailing(stmts[stmts.length - 1], ws2val.trailing);
        // Pending from prev iteration + after-newline after ";" → leading on this stmt
        stmt = addLeading(stmt, [...pendingLeading, ...ws2val.leading]);
        // Same-line after stmt → trailing on this stmt
        stmt = addTrailing(stmt, ws3val.trailing);
        // After-newline after stmt → deferred to next iteration
        pendingLeading = ws3val.leading;
        stmts.push(stmt);
      }
      stmts[stmts.length - 1] = addTrailing(stmts[stmts.length - 1], [...pendingLeading, ...flattenWs(finalWs)]);
      return stmts;
    }
  / _ { return []; }

// A top-level statement is either an EXPLAIN or a union query with optional INTO OUTFILE, FORMAT, and SETTINGS clauses
// SETTINGS can appear before FORMAT (inside SELECT) or after FORMAT
TopLevelStatement
  = ExplainStatement
  / ParallelWithStatement
  / CreateStatement
  / AlterStatement
  / SetStatement
  / UseStatement
  / SystemStatement
  / InsertStatement
  / DropStatement
  / OpaqueStatement
  / query:UnionQuery intoOutfile:( _ IntoOutfileClause )? preSettings:( _ SettingsClause )? format:( _ FormatClause )? postSettings:( _ SettingsClause )* {
      let result = query;
      if (intoOutfile !== null) {
        result = { ...result, intoOutfile: intoOutfile[1] };
      }
      if (format !== null) {
        result = { ...result, format: format[1] };
      }
      // Pre-format settings (SETTINGS clause before FORMAT)
      if (preSettings !== null) {
        result = { ...result, preFormatSettings: preSettings[1] };
      }
      // Post-format settings (SETTINGS after FORMAT)
      if (postSettings.length > 0) {
        const merged = postSettings.reduce((acc, s) => [...acc, ...s[1]], []);
        result = { ...result, postFormatSettings: merged };
      }
      return result;
    }

// IntoOutfileClause: INTO OUTFILE 'path' [TRUNCATE] — output redirection
IntoOutfileClause
  = "INTO"i ![a-zA-Z0-9_] _ "OUTFILE"i ![a-zA-Z0-9_] _ path:StringLiteral ( _ "TRUNCATE"i ![a-zA-Z0-9_] )? { return path; }

// SetStatement: SET key = value [, key = value ...] — changes session-level settings
SetStatement
  = "SET"i ![a-zA-Z0-9_] _ "TRANSACTION"i ![a-zA-Z0-9_] _ "SNAPSHOT"i ![a-zA-Z0-9_] _ snapshot:$[0-9]+ { return loc({ kind: 'transactionControl', snapshot }); }
  / "SET"i ![a-zA-Z0-9_] _ "DEFAULT"i ![a-zA-Z0-9_] _ "ROLE"i ![a-zA-Z0-9_] _ roles:SetRoleList _ "TO"i ![a-zA-Z0-9_] _ users:SetRoleUserList { return loc({ kind: 'setRole', roles, users }); }
  / "SET"i ![a-zA-Z0-9_] _ items:SettingsList { return loc({ kind: 'set', settings: items }); }

SetRoleList
  = "ALL"i ![a-zA-Z0-9_] except:( _ "EXCEPT"i ![a-zA-Z0-9_] _ SetRoleNameList )? { return { kind: 'all', except: except ? except[4] : undefined }; }
  / "NONE"i ![a-zA-Z0-9_] { return { kind: 'none' }; }
  / names:SetRoleNameList { return { kind: 'names', names }; }

SetRoleNameList
  = head:AliasName tail:( _ "," _ AliasName )* { return [head, ...tail.map(t => t[3])]; }

SetRoleUserList
  = head:AliasName tail:( _ "," _ AliasName )* { return [head, ...tail.map(t => t[3])]; }

// UseStatement: USE database — selects the current database
UseStatement
  = "USE"i ![a-zA-Z0-9_] _ db:( QueryParamIdentifier / AliasName ) { return loc({ kind: 'use', database: db }); }

// SystemStatement: SYSTEM FLUSH LOGS, SYSTEM RELOAD CONFIG, etc. — admin commands (body discarded)
SystemStatement
  = "SYSTEM"i ![a-zA-Z0-9_] body:$( ![\n;] . )+ { return loc({ kind: 'system', body: body.trim() }); }

// ── ALTER TABLE statements ──────────────────────────────────────────────────

// AlterStatement: ALTER TABLE [db.]table [ON CLUSTER cluster] command [, command ...] [SETTINGS ...] [FORMAT ...]
AlterStatement
  = "ALTER"i ![a-zA-Z0-9_] _ ("TEMPORARY"i ![a-zA-Z0-9_] _)? "TABLE"i ![a-zA-Z0-9_] _ table:TableRef
    onCluster:( _ OnClusterClause )?
    _ head:AlterCommand tail:( _ "," _ AlterCommand )*
    preSettings:( _ SettingsClause )?
    format:( _ FormatClause )?
    postSettings:( _ SettingsClause )? {
      const commands = [head, ...tail.map(t => t[3])];
      const result = loc({ kind: 'alter', table, commands });
      if (onCluster !== null) result.onCluster = onCluster[1];
      const settings = preSettings !== null ? preSettings[1] : (postSettings !== null ? postSettings[1] : null);
      if (settings !== null) result.settings = settings;
      if (format !== null) result.format = format[1];
      return result;
    }

// Each alter command alternative. Parenthesized commands like (APPLY DELETED MASK) are supported.
AlterCommand
  = "(" _ cmd:AlterCommandInner _ ")" { return { ...cmd, parenthesized: true }; }
  / AlterCommandInner

AlterCommandInner
  = AlterCommandAddColumn
  / AlterCommandDropColumn
  / AlterCommandClearColumn
  / AlterCommandModifyColumn
  / AlterCommandRenameColumn
  / AlterCommandCommentColumn
  / AlterCommandMaterializeColumn
  / AlterCommandModifyOrderBy
  / AlterCommandModifySampleBy
  / AlterCommandRemoveSampleBy
  / AlterCommandModifyTTL
  / AlterCommandRemoveTTL
  / AlterCommandMaterializeTTL
  / AlterCommandModifySetting
  / AlterCommandResetSetting
  / AlterCommandModifyQuery
  / AlterCommandModifyComment
  / AlterCommandAddIndex
  / AlterCommandDropIndex
  / AlterCommandClearIndex
  / AlterCommandMaterializeIndex
  / AlterCommandAddProjection
  / AlterCommandDropProjection
  / AlterCommandClearProjection
  / AlterCommandMaterializeProjection
  / AlterCommandAddConstraint
  / AlterCommandDropConstraint
  / AlterCommandAddStatistics
  / AlterCommandDropStatistics
  / AlterCommandClearStatistics
  / AlterCommandModifyStatistics
  / AlterCommandMaterializeStatistics
  / AlterCommandUpdate
  / AlterCommandDelete
  / AlterCommandDropPartition
  / AlterCommandDropDetachedPartition
  / AlterCommandAttachPartition
  / AlterCommandReplacePartition
  / AlterCommandMovePartition
  / AlterCommandFetchPartition
  / AlterCommandFreezePartition
  / AlterCommandFreezeAll
  / AlterCommandApplyDeletedMask
  / AlterCommandApplyPatches
  / AlterCommandRewriteParts

// ── Column commands ─────────────────────────────────────────────────────────

AlterCommandAddColumn
  = "ADD"i ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifNotExists:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ col:AlterColumnElement
    after:( _ "AFTER"i ![a-zA-Z0-9_] _ AlterColumnRef / _ "FIRST"i ![a-zA-Z0-9_] )? {
      const result = loc({ kind: 'alterCommand', commandType: 'ADD_COLUMN', column: col });
      if (after !== null && after[1] && typeof after[4] === 'string') result.afterColumn = after[4];
      return result;
    }

AlterCommandDropColumn
  = "DROP"i ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ col:AlterColumnRef
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DROP_COLUMN', columnName: col });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandClearColumn
  = "CLEAR"i ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ col:AlterColumnRef
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DROP_COLUMN', columnName: col });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandModifyColumn
  = ("MODIFY"i / "ALTER"i) ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName _ "TYPE"i ![a-zA-Z0-9_] _ type:ColumnDataType {
      const col = loc({ kind: 'columnDef', name, type });
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_COLUMN', column: col });
    }
  / ("MODIFY"i / "ALTER"i) ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ col:AlterModifyColumnElement
    removeProp:( _ "REMOVE"i ![a-zA-Z0-9_] _ AlterRemoveProperty )?
    modifySetReset:( _ AlterModifyColumnSettingClause )?
    after:( _ "AFTER"i ![a-zA-Z0-9_] _ AlterColumnRef / _ "FIRST"i ![a-zA-Z0-9_] )? {
      const result = loc({ kind: 'alterCommand', commandType: 'MODIFY_COLUMN', column: col });
      if (modifySetReset !== null) result.columnSettingOp = modifySetReset[1];
      if (after !== null && after[1] && typeof after[4] === 'string') result.afterColumn = after[4];
      return result;
    }

// MODIFY COLUMN column element: like ColumnElement but with extra negative lookaheads
// for MODIFY/RESET/REMOVE/AFTER/FIRST that can follow the column definition
AlterModifyColumnElement
  = name:$(AliasName ("." AliasName)+)
    type:( _ !("DEFAULT"i ![a-zA-Z0-9_] / "MATERIALIZED"i ![a-zA-Z0-9_] / "EPHEMERAL"i ![a-zA-Z0-9_] / "ALIAS"i ![a-zA-Z0-9_] / "COMMENT"i ![a-zA-Z0-9_] / "CODEC"i ![a-zA-Z0-9_] / "TTL"i ![a-zA-Z0-9_] / "STATISTICS"i ![a-zA-Z0-9_] / "SETTINGS"i ![a-zA-Z0-9_] / "NULL"i ![a-zA-Z0-9_] / "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] / "REMOVE"i ![a-zA-Z0-9_] / "MODIFY"i ![a-zA-Z0-9_] / "RESET"i ![a-zA-Z0-9_] / "FIRST"i ![a-zA-Z0-9_] / "AFTER"i ![a-zA-Z0-9_] / "," / ")") ColumnDataType )?
    def:( _ ColumnDefault )?
    comment:( _ ColumnComment )?
    codec:( _ ColumnCodec )?
    ttl:( _ ColumnTTL )? {
      const result = loc({ kind: 'columnDef', name });
      if (type !== null) result.type = type[2];
      if (def !== null) { result.defaultKind = def[1].kind; if (def[1].expr) result.defaultExpr = def[1].expr; }
      if (comment !== null) result.comment = comment[1];
      if (codec !== null) result.codec = codec[1];
      if (ttl !== null) result.ttl = ttl[1];
      return result;
    }
  / name:AliasName
    type:( _ !("DEFAULT"i ![a-zA-Z0-9_] / "MATERIALIZED"i ![a-zA-Z0-9_] / "EPHEMERAL"i ![a-zA-Z0-9_] / "ALIAS"i ![a-zA-Z0-9_] / "COMMENT"i ![a-zA-Z0-9_] / "CODEC"i ![a-zA-Z0-9_] / "TTL"i ![a-zA-Z0-9_] / "STATISTICS"i ![a-zA-Z0-9_] / "SETTINGS"i ![a-zA-Z0-9_] / "NULL"i ![a-zA-Z0-9_] / "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] / "AUTO_INCREMENT"i ![a-zA-Z0-9_] / "COLLATE"i ![a-zA-Z0-9_] / "PRIMARY"i ![a-zA-Z0-9_] / "REMOVE"i ![a-zA-Z0-9_] / "MODIFY"i ![a-zA-Z0-9_] / "RESET"i ![a-zA-Z0-9_] / "FIRST"i ![a-zA-Z0-9_] / "AFTER"i ![a-zA-Z0-9_] / "," / ")") ColumnDataType )?
    collate:( _ "COLLATE"i ![a-zA-Z0-9_] _ AliasName )?
    nullable1:( _ NullableModifier )?
    autoIncrement:( _ "AUTO_INCREMENT"i ![a-zA-Z0-9_] )?
    primaryKey:( _ "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] )?
    def:( _ ColumnDefault )?
    nullable2:( _ NullableModifier )?
    comment:( _ ColumnComment )?
    codec:( _ ColumnCodec )?
    stats:( _ ColumnStatistics )?
    ttl:( _ ColumnTTL )?
    colSettings:( _ ColumnSettings )? {
      const result = loc({ kind: 'columnDef', name });
      if (type !== null) result.type = type[2];
      else if (autoIncrement !== null) result.type = { name: 'INT', args: [] };
      const nullable = nullable2 !== null ? nullable2[1] : (nullable1 !== null ? nullable1[1] : null);
      if (collate !== null) result.collate = collate[4];
      if (nullable !== null) result.nullable = nullable;
      if (primaryKey !== null) result.primaryKey = true;
      if (def !== null) { result.defaultKind = def[1].kind; if (def[1].expr) result.defaultExpr = def[1].expr; }
      if (comment !== null) result.comment = comment[1];
      if (codec !== null) result.codec = codec[1];
      if (stats !== null) result.statistics = stats[1];
      if (ttl !== null) result.ttl = ttl[1];
      if (colSettings !== null) result.columnSettings = colSettings[1];
      return result;
    }

AlterRemoveProperty
  = "DEFAULT"i ![a-zA-Z0-9_] { return 'DEFAULT'; }
  / "MATERIALIZED"i ![a-zA-Z0-9_] { return 'MATERIALIZED'; }
  / "ALIAS"i ![a-zA-Z0-9_] { return 'ALIAS'; }
  / "COMMENT"i ![a-zA-Z0-9_] { return 'COMMENT'; }
  / "CODEC"i ![a-zA-Z0-9_] { return 'CODEC'; }
  / "TTL"i ![a-zA-Z0-9_] { return 'TTL'; }
  / "SETTINGS"i ![a-zA-Z0-9_] { return 'SETTINGS'; }

AlterModifyColumnSettingClause
  = "MODIFY"i ![a-zA-Z0-9_] _ "SETTING"i ![a-zA-Z0-9_] _ settings:SettingsList { return { op: 'MODIFY_SETTING', settings }; }
  / "RESET"i ![a-zA-Z0-9_] _ "SETTING"i ![a-zA-Z0-9_] _ names:AlterResetSettingNames { return { op: 'RESET_SETTING', names }; }

AlterCommandRenameColumn
  = "RENAME"i ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ oldName:AlterColumnRef _ "TO"i ![a-zA-Z0-9_] _ newName:AlterColumnRef {
      return loc({ kind: 'alterCommand', commandType: 'RENAME_COLUMN', oldName, newName });
    }

AlterCommandCommentColumn
  = "COMMENT"i ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ col:AlterColumnRef _ comment:StringLiteral {
      return loc({ kind: 'alterCommand', commandType: 'COMMENT_COLUMN', columnName: col, comment });
    }

AlterCommandMaterializeColumn
  = "MATERIALIZE"i ![a-zA-Z0-9_] _ "COLUMN"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ col:AlterColumnRef
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'MATERIALIZE_COLUMN', columnName: col });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

// Column element variant for ALTER that allows dotted names (e.g. AddedNested1.C Array(String))
// Tries dotted name first (requires dot present), falls back to ColumnElement for plain names
AlterColumnElement
  = name:$(AliasName ("." AliasName)+)
    type:( _ !("DEFAULT"i ![a-zA-Z0-9_] / "MATERIALIZED"i ![a-zA-Z0-9_] / "EPHEMERAL"i ![a-zA-Z0-9_] / "ALIAS"i ![a-zA-Z0-9_] / "COMMENT"i ![a-zA-Z0-9_] / "CODEC"i ![a-zA-Z0-9_] / "TTL"i ![a-zA-Z0-9_] / "STATISTICS"i ![a-zA-Z0-9_] / "SETTINGS"i ![a-zA-Z0-9_] / "NULL"i ![a-zA-Z0-9_] / "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] / "AUTO_INCREMENT"i ![a-zA-Z0-9_] / "COLLATE"i ![a-zA-Z0-9_] / "PRIMARY"i ![a-zA-Z0-9_] / "," / ")") ColumnDataType )?
    def:( _ ColumnDefault )?
    comment:( _ ColumnComment )?
    codec:( _ ColumnCodec )?
    ttl:( _ ColumnTTL )? {
      const result = loc({ kind: 'columnDef', name });
      if (type !== null) result.type = type[2];
      if (def !== null) { result.defaultKind = def[1].kind; if (def[1].expr) result.defaultExpr = def[1].expr; }
      if (comment !== null) result.comment = comment[1];
      if (codec !== null) result.codec = codec[1];
      if (ttl !== null) result.ttl = ttl[1];
      return result;
    }
  / ColumnElement

// Projection definition without the leading PROJECTION keyword (used in ALTER ADD PROJECTION)
AlterProjectionDef
  = name:AliasName _ "(" _ query:SelectStatement _ ")"
    projSettings:( _ "WITH"i ![a-zA-Z0-9_] _ "SETTINGS"i ![a-zA-Z0-9_] _ "(" _ SettingsList _ ")" )? {
      const result = loc({ kind: 'projectionDef', name, query });
      if (projSettings !== null) result.projectionSettings = projSettings[9];
      return result;
    }
  / name:AliasName _ "INDEX"i ![a-zA-Z0-9_] _ indexExpr:IndexExpr _ "TYPE"i ![a-zA-Z0-9_] _ indexType:IndexTypeSpec {
      return loc({ kind: 'projectionDef', name, indexExpr, indexType });
    }

// Constraint definition without the leading CONSTRAINT keyword (used in ALTER ADD CONSTRAINT)
AlterConstraintDef
  = name:AliasName _ ct:("CHECK"i / "ASSUME"i) ![a-zA-Z0-9_] _ expr:Expression {
      return loc({ kind: 'constraintDef', name, constraintType: ct.toUpperCase(), expr });
    }

// Index definition without the leading INDEX keyword (used in ALTER ADD INDEX)
AlterIndexDef
  = name:AliasName _ expr:IndexExpr _ "TYPE"i ![a-zA-Z0-9_] _ indexType:IndexTypeSpec
    gran:( _ "GRANULARITY"i ![a-zA-Z0-9_] _ n:$[0-9]+ { return parseInt(n, 10); } )? {
      const result = loc({ kind: 'indexDef', name, expr, indexType });
      if (gran !== null) result.granularity = gran;
      return result;
    }

// Column references in ALTER can include dots (e.g. NestedColumn.A)
AlterColumnRef
  = head:AliasName tail:( "." AliasName )* { return head + tail.map(t => '.' + t[1]).join(''); }

// ── Index commands ──────────────────────────────────────────────────────────

AlterCommandAddIndex
  = "ADD"i ![a-zA-Z0-9_] _ "INDEX"i ![a-zA-Z0-9_]
    ifNotExists:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ idx:AlterIndexDef
    after:( _ "AFTER"i ![a-zA-Z0-9_] _ AliasName / _ "FIRST"i ![a-zA-Z0-9_] )? {
      const result = loc({ kind: 'alterCommand', commandType: 'ADD_INDEX', index: idx });
      if (after !== null && after[1] && typeof after[4] === 'string') result.afterIndex = after[4];
      return result;
    }

AlterCommandDropIndex
  = "DROP"i ![a-zA-Z0-9_] _ "INDEX"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DROP_INDEX', indexName: name });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandClearIndex
  = "CLEAR"i ![a-zA-Z0-9_] _ "INDEX"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DROP_INDEX', indexName: name });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandMaterializeIndex
  = "MATERIALIZE"i ![a-zA-Z0-9_] _ "INDEX"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'MATERIALIZE_INDEX', indexName: name });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

// ── Projection commands ─────────────────────────────────────────────────────

AlterCommandAddProjection
  = "ADD"i ![a-zA-Z0-9_] _ "PROJECTION"i ![a-zA-Z0-9_]
    ifNotExists:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ proj:AlterProjectionDef
    after:( _ "AFTER"i ![a-zA-Z0-9_] _ AliasName )? {
      const result = loc({ kind: 'alterCommand', commandType: 'ADD_PROJECTION', projection: proj });
      if (after !== null) result.afterProjection = after[4];
      return result;
    }

AlterCommandDropProjection
  = "DROP"i ![a-zA-Z0-9_] _ "PROJECTION"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DROP_PROJECTION', projectionName: name });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandClearProjection
  = "CLEAR"i ![a-zA-Z0-9_] _ "PROJECTION"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DROP_PROJECTION', projectionName: name });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandMaterializeProjection
  = "MATERIALIZE"i ![a-zA-Z0-9_] _ "PROJECTION"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'MATERIALIZE_PROJECTION', projectionName: name });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

// ── Constraint commands ─────────────────────────────────────────────────────

AlterCommandAddConstraint
  = "ADD"i ![a-zA-Z0-9_] _ "CONSTRAINT"i ![a-zA-Z0-9_]
    ifNotExists:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ constraint:AlterConstraintDef {
      return loc({ kind: 'alterCommand', commandType: 'ADD_CONSTRAINT', constraint });
    }

AlterCommandDropConstraint
  = "DROP"i ![a-zA-Z0-9_] _ "CONSTRAINT"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName {
      return loc({ kind: 'alterCommand', commandType: 'DROP_CONSTRAINT', constraintName: name });
    }

// ── Statistics commands ─────────────────────────────────────────────────────

AlterCommandAddStatistics
  = "ADD"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifNotExists:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ columns:AlterStatisticsColumns _ "TYPE"i ![a-zA-Z0-9_] _ types:AlterStatisticsTypes {
      return loc({ kind: 'alterCommand', commandType: 'ADD_STATISTICS', statColumns: columns, statTypes: types });
    }

AlterCommandDropStatistics
  = "DROP"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ "ALL"i ![a-zA-Z0-9_] {
      return loc({ kind: 'alterCommand', commandType: 'DROP_STATISTICS' });
    }
  / "DROP"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ columns:AlterStatisticsColumns {
      return loc({ kind: 'alterCommand', commandType: 'DROP_STATISTICS', statColumns: columns });
    }

AlterCommandModifyStatistics
  = "MODIFY"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ columns:AlterStatisticsColumns _ "TYPE"i ![a-zA-Z0-9_] _ types:AlterStatisticsTypes {
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_STATISTICS', statColumns: columns, statTypes: types });
    }

AlterCommandClearStatistics
  = "CLEAR"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ "ALL"i ![a-zA-Z0-9_] {
      return loc({ kind: 'alterCommand', commandType: 'DROP_STATISTICS' });
    }
  / "CLEAR"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ columns:AlterStatisticsColumns {
      return loc({ kind: 'alterCommand', commandType: 'DROP_STATISTICS', statColumns: columns });
    }

AlterCommandMaterializeStatistics
  = "MATERIALIZE"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ "ALL"i ![a-zA-Z0-9_] {
      return loc({ kind: 'alterCommand', commandType: 'MATERIALIZE_STATISTICS' });
    }
  / "MATERIALIZE"i ![a-zA-Z0-9_] _ "STATISTICS"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ columns:AlterStatisticsColumns {
      return loc({ kind: 'alterCommand', commandType: 'MATERIALIZE_STATISTICS', statColumns: columns });
    }

AlterStatisticsColumns
  = head:AliasName tail:( _ "," _ AliasName )* { return [head, ...tail.map(t => t[3])]; }

AlterStatisticsTypes
  = head:IndexTypeSpec tail:( _ "," _ IndexTypeSpec )* { return [head, ...tail.map(t => t[3])]; }

// ── Mutation commands ───────────────────────────────────────────────────────

AlterCommandUpdate
  = "UPDATE"i ![a-zA-Z0-9_] _ assignments:AlterUpdateAssignmentList _ partition:AlterInPartitionClause _ "WHERE"i ![a-zA-Z0-9_] _ where:Expression {
      return loc({ kind: 'alterCommand', commandType: 'UPDATE', assignments, where, partition });
    }
  / "UPDATE"i ![a-zA-Z0-9_] _ assignments:AlterAssignmentList _ "WHERE"i ![a-zA-Z0-9_] _ where:Expression {
      return loc({ kind: 'alterCommand', commandType: 'UPDATE', assignments, where });
    }

AlterAssignmentList
  = head:AlterAssignment tail:( _ "," _ AlterAssignment )* { return [head, ...tail.map(t => t[3])]; }

AlterAssignment
  = col:AlterColumnRef _ "=" _ expr:TernaryExpr {
      return { column: col, expr };
    }

// Assignment list for UPDATE ... IN PARTITION — uses AddExpr (not TernaryExpr) for values
// to prevent 'x + 1 IN PARTITION' being parsed as the SQL IN operator
AlterUpdateAssignmentList
  = head:AlterUpdateAssignment tail:( _ "," _ AlterUpdateAssignment )* { return [head, ...tail.map(t => t[3])]; }

AlterUpdateAssignment
  = col:AlterColumnRef _ "=" _ expr:AddExpr {
      return { column: col, expr };
    }

AlterCommandDelete
  = "DELETE"i ![a-zA-Z0-9_] _ "WHERE"i ![a-zA-Z0-9_] _ where:Expression
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'DELETE', where });
      if (partition !== null) result.partition = partition[1];
      return result;
    }
  / "DELETE"i ![a-zA-Z0-9_] _ partition:AlterInPartitionClause _ "WHERE"i ![a-zA-Z0-9_] _ where:Expression {
      return loc({ kind: 'alterCommand', commandType: 'DELETE', where, partition });
    }

// ── Partition commands ──────────────────────────────────────────────────────

AlterCommandDropPartition
  = ("DROP"i / "DETACH"i) ![a-zA-Z0-9_] _ "PART"i ![a-zA-Z0-9_] _ partName:StringLiteral {
      return loc({ kind: 'alterCommand', commandType: 'DROP_PARTITION', partName: partName });
    }
  / ("DROP"i / "DETACH"i) ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr {
      return loc({ kind: 'alterCommand', commandType: 'DROP_PARTITION', partition: part });
    }

AlterCommandDropDetachedPartition
  = "DROP"i ![a-zA-Z0-9_] _ "DETACHED"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr {
      return loc({ kind: 'alterCommand', commandType: 'DROP_DETACHED_PARTITION', partition: part });
    }

AlterCommandAttachPartition
  = "ATTACH"i ![a-zA-Z0-9_] _ "PART"i ![a-zA-Z0-9_] _ partName:StringLiteral {
      return loc({ kind: 'alterCommand', commandType: 'ATTACH_PARTITION', partName: partName });
    }
  / "ATTACH"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr _ "FROM"i ![a-zA-Z0-9_] _ fromTable:TableRef {
      return loc({ kind: 'alterCommand', commandType: 'REPLACE_PARTITION', partition: part, fromTable: fromTable });
    }
  / "ATTACH"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr
    from:( _ "FROM"i ![a-zA-Z0-9_] _ TableRef )? {
      const result = loc({ kind: 'alterCommand', commandType: 'ATTACH_PARTITION', partition: part });
      if (from !== null) result.fromTable = from[4];
      return result;
    }

AlterCommandReplacePartition
  = "REPLACE"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr _ "FROM"i ![a-zA-Z0-9_] _ table:TableRef {
      return loc({ kind: 'alterCommand', commandType: 'REPLACE_PARTITION', partition: part, fromTable: table });
    }

AlterCommandMovePartition
  = "MOVE"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr _ "TO"i ![a-zA-Z0-9_] _
    dest:( "TABLE"i ![a-zA-Z0-9_] _ table:TableRef { return { destType: 'TABLE', table }; }
         / "DISK"i ![a-zA-Z0-9_] _ disk:StringLiteral { return { destType: 'DISK', value: disk }; }
         / "VOLUME"i ![a-zA-Z0-9_] _ vol:StringLiteral { return { destType: 'VOLUME', value: vol }; }
         / "SHARD"i ![a-zA-Z0-9_] _ shard:StringLiteral { return { destType: 'SHARD', value: shard }; } ) {
      return loc({ kind: 'alterCommand', commandType: 'MOVE_PARTITION', partition: part, moveDest: dest });
    }

AlterCommandFetchPartition
  = "FETCH"i ![a-zA-Z0-9_] _ ("PARTITION"i / "PART"i) ![a-zA-Z0-9_]
    _ part:AlterFetchPartitionExpr _ "FROM"i ![a-zA-Z0-9_] _ path:( StringLiteral / QueryParam ) {
      return loc({ kind: 'alterCommand', commandType: 'FETCH_PARTITION', partition: part, fromPath: path });
    }

// Partition expression for FETCH that doesn't use general Expression to avoid packrat issues
AlterFetchPartitionExpr
  = "ALL"i ![a-zA-Z0-9_] { return { partitionKind: 'all' }; }
  / "ID"i ![a-zA-Z0-9_] _ id:( StringLiteral / QueryParam ) { return { partitionKind: 'id', id }; }
  / expr:TernaryExpr { return { partitionKind: 'expr', expr }; }

AlterCommandFreezePartition
  = "FREEZE"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr
    withName:( _ "WITH"i ![a-zA-Z0-9_] _ "NAME"i ![a-zA-Z0-9_] _ StringLiteral )? {
      return loc({ kind: 'alterCommand', commandType: 'FREEZE_PARTITION', partition: part });
    }

AlterCommandFreezeAll
  = "FREEZE"i ![a-zA-Z0-9_]
    withName:( _ "WITH"i ![a-zA-Z0-9_] _ "NAME"i ![a-zA-Z0-9_] _ StringLiteral )? {
      return loc({ kind: 'alterCommand', commandType: 'FREEZE_ALL' });
    }

// ── Table-level commands ────────────────────────────────────────────────────

AlterCommandModifyTTL
  = "MODIFY"i ![a-zA-Z0-9_] _ "TTL"i ![a-zA-Z0-9_] _ head:TTLItem tail:( _ "," _ TTLItem )* {
      const ttl = [head, ...tail.map(t => t[3])];
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_TTL', ttl });
    }

AlterCommandRemoveTTL
  = "REMOVE"i ![a-zA-Z0-9_] _ "TTL"i ![a-zA-Z0-9_] {
      return loc({ kind: 'alterCommand', commandType: 'REMOVE_TTL' });
    }

AlterCommandMaterializeTTL
  = "MATERIALIZE"i ![a-zA-Z0-9_] _ "TTL"i ![a-zA-Z0-9_]
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'MATERIALIZE_TTL' });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandModifyOrderBy
  = "MODIFY"i ![a-zA-Z0-9_] _ "ORDER"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ expr:Expression {
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_ORDER_BY', expr });
    }

AlterCommandModifySampleBy
  = "MODIFY"i ![a-zA-Z0-9_] _ "SAMPLE"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ expr:Expression {
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_SAMPLE_BY', expr });
    }

AlterCommandRemoveSampleBy
  = "REMOVE"i ![a-zA-Z0-9_] _ "SAMPLE"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] {
      return loc({ kind: 'alterCommand', commandType: 'REMOVE_SAMPLE_BY' });
    }

AlterCommandModifySetting
  = "MODIFY"i ![a-zA-Z0-9_] _ "SETTING"i ![a-zA-Z0-9_] _ settings:SettingsList {
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_SETTING', settings });
    }

AlterCommandResetSetting
  = "RESET"i ![a-zA-Z0-9_] _ "SETTING"i ![a-zA-Z0-9_] _ names:AlterResetSettingNames {
      return loc({ kind: 'alterCommand', commandType: 'RESET_SETTING', settingNames: names });
    }

AlterResetSettingNames
  = head:AliasName tail:( _ "," _ AliasName )* { return [head, ...tail.map(t => t[3])]; }

AlterCommandModifyQuery
  = "MODIFY"i ![a-zA-Z0-9_] _ "QUERY"i ![a-zA-Z0-9_] _ query:UnionQuery {
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_QUERY', query });
    }

AlterCommandModifyComment
  = "MODIFY"i ![a-zA-Z0-9_] _ "COMMENT"i ![a-zA-Z0-9_] _ comment:StringLiteral {
      return loc({ kind: 'alterCommand', commandType: 'MODIFY_COMMENT', comment });
    }

// ── Other commands ──────────────────────────────────────────────────────────

AlterCommandApplyDeletedMask
  = "APPLY"i ![a-zA-Z0-9_] _ "DELETED"i ![a-zA-Z0-9_] _ "MASK"i ![a-zA-Z0-9_]
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'APPLY_DELETED_MASK' });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandApplyPatches
  = "APPLY"i ![a-zA-Z0-9_] _ "PATCHES"i ![a-zA-Z0-9_]
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'APPLY_PATCHES' });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

AlterCommandRewriteParts
  = "REWRITE"i ![a-zA-Z0-9_] _ "PARTS"i ![a-zA-Z0-9_]
    partition:( _ AlterInPartitionClause )? {
      const result = loc({ kind: 'alterCommand', commandType: 'REWRITE_PARTS' });
      if (partition !== null) result.partition = partition[1];
      return result;
    }

// ── Partition expression helpers ────────────────────────────────────────────

// A partition expression: PARTITION ALL, PARTITION ID 'xxx', or PARTITION expr
AlterPartitionExpr
  = "ALL"i ![a-zA-Z0-9_] { return { partitionKind: 'all' }; }
  / "ID"i ![a-zA-Z0-9_] _ id:( StringLiteral / QueryParam ) { return { partitionKind: 'id', id }; }
  / expr:TernaryExpr { return { partitionKind: 'expr', expr }; }

// IN PARTITION clause used by CLEAR COLUMN/INDEX, MATERIALIZE, APPLY DELETED MASK, etc.
AlterInPartitionClause
  = "IN"i ![a-zA-Z0-9_] _ "PARTITION"i ![a-zA-Z0-9_] _ part:AlterPartitionExpr { return part; }
  / "IN"i ![a-zA-Z0-9_] _ "PART"i ![a-zA-Z0-9_] _ id:StringLiteral { return { partitionKind: 'id', id }; }

// OpaqueStatement: statements we recognize but don't fully parse (TRUNCATE, etc.)
// The body is consumed as raw text until end of statement.
OpaqueStatement
  = keyword:( "ALTER"i / "RENAME"i / "ATTACH"i / "DETACH"i / "OPTIMIZE"i / "CHECK"i / "DESCRIBE"i / "DESC"i / "EXISTS"i / "SHOW"i / "GRANT"i / "REVOKE"i / "EXCHANGE"i / "KILL"i / "UNDO"i / "DELETE"i / "BACKUP"i / "RESTORE"i / "BEGIN"i / "COMMIT"i / "ROLLBACK"i / "WATCH"i / "UNDROP"i / "MOVE"i / "TRUNCATE"i ) ![a-zA-Z0-9_] _ body:$( ![\n;] . )* { return loc({ kind: 'system', body: (keyword + ' ' + body).trim() }); }

// ── DROP statements ─────────────────────────────────────────────────────────

// DropIndexStatement: DROP INDEX [IF EXISTS] name ON [db.]table
DropIndexStatement
  = "DROP"i ![a-zA-Z0-9_] _ "INDEX"i ![a-zA-Z0-9_]
    ifExists:( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ indexName:AliasName _ "ON"i ![a-zA-Z0-9_] _ table:TableRef {
      return loc({ kind: 'drop', targetType: 'INDEX', table, indexName });
    }

// DropStatement: DROP [TEMPORARY] TABLE/VIEW/DICTIONARY/DATABASE/FUNCTION [IF EXISTS|IF EMPTY] [db.]name [, ...] [ON CLUSTER ...] [SYNC|NO DELAY] [SETTINGS ...] [FORMAT ...]
// For access control objects (USER, ROLE, etc.), falls back to opaque parsing with specific label.
DropStatement
  = DropIndexStatement
  / "DROP"i ![a-zA-Z0-9_] temp:( _ "TEMPORARY"i ![a-zA-Z0-9_] )?
    _ targetType:DropTargetType
    ifClause:( _ "IF"i ![a-zA-Z0-9_] _ ( "EXISTS"i / "EMPTY"i ) ![a-zA-Z0-9_] )?
    _ head:TableRef tail:( _ "," _ TableRef )*
    cluster:( _ OnClusterClause )?
    sync:( _ ( "SYNC"i / "NO"i ![a-zA-Z0-9_] _ "DELAY"i ) ![a-zA-Z0-9_] )?
    settings:( _ SettingsClause )?
    format:( _ FormatClause )? {
      const tables = [head, ...tail.map(t => t[3])];
      const result = { kind: 'drop', targetType };
      if (tables.length === 1) {
        result.table = tables[0];
      } else {
        result.tables = tables;
      }
      if (temp !== null) result.temporary = true;
      if (ifClause !== null) result.ifExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      if (settings !== null) result.settings = settings[1];
      if (format !== null) result.format = format[1];
      return loc(result);
    }
  / body:$( "DROP"i ![a-zA-Z0-9_] ( "'" ( "''" / "\\'" / "\\\\" / !"'" ( [\n\r] / . ) )* "'" / !";" ( [\n\r] / . ) )* ) { return loc({ kind: 'system', body: body.trim() }); }

DropTargetType
  = "TABLE"i ![a-zA-Z0-9_] { return 'TABLE'; }
  / "VIEW"i ![a-zA-Z0-9_] { return 'VIEW'; }
  / "DICTIONARY"i ![a-zA-Z0-9_] { return 'DICTIONARY'; }
  / "DATABASE"i ![a-zA-Z0-9_] { return 'DATABASE'; }
  / "FUNCTION"i ![a-zA-Z0-9_] { return 'FUNCTION'; }

// ── INSERT statements ────────────────────────────────────────────────────────

// InsertStatement: INSERT INTO [TABLE] target [(columns)] [SETTINGS ...] [data]
// target can be a table reference or TABLE FUNCTION / FUNCTION call
InsertStatement
  = "INSERT"i ![a-zA-Z0-9_] _ "INTO"i ![a-zA-Z0-9_] _ target:InsertTarget
    partitionBy:( _ "PARTITION"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ Expression )?
    columns:( _ InsertColumnList )?
    insertSettings:( _ SettingsClause )?
    data:InsertDataClause {
      const result = { kind: 'insert', target: target };
      if (partitionBy !== null) result.partitionBy = partitionBy[7];
      if (columns !== null) result.columns = columns[1];
      if (insertSettings !== null) result.insertSettings = insertSettings[1];
      if (data !== null) {
        result.selectQuery = data.query;
        if (data.querySettings) result.querySettings = data.querySettings;
      }
      return loc(result);
    }

// InsertTarget: identifies what to insert into (table or table function)
InsertTarget
  = "TABLE"i ![a-zA-Z0-9_] _ "FUNCTION"i ![a-zA-Z0-9_] _ func:InsertFunctionCall { return { kind: 'function', func }; }
  / "FUNCTION"i ![a-zA-Z0-9_] _ func:InsertFunctionCall { return { kind: 'function', func }; }
  / "TABLE"i ![a-zA-Z0-9_] _ table:TableRef { return { kind: 'table', table }; }
  / table:TableRef { return { kind: 'table', table }; }

// InsertFunctionCall: parses a function call in INSERT INTO [TABLE] FUNCTION context
InsertFunctionCall
  = name:FunctionName _ "(" _ args:FunctionCallArgList? _ ")" {
      return loc({ kind: 'tableFunctionRef', name, args: args !== null ? args : [] });
    }

// InsertColumnList: optional column list with support for trailing comma and complex expressions
// Supports identifiers, asterisks with transformers, qualified asterisks, COLUMNS(), etc.
InsertColumnList
  = "(" _ head:SelectItem tail:( _ "," _ SelectItem )* _ ","? _ ")" {
      return buildCommaList(head, tail);
    }

// InsertDataClause: VALUES (skipped), SELECT query, FORMAT (skipped), or empty
// For INSERT...SELECT...FORMAT, the FORMAT + data is consumed after the SELECT
InsertDataClause
  = _ "VALUES"i ![a-zA-Z0-9_] InsertRawData { return null; }
  / _ "FORMAT"i ![a-zA-Z0-9_] InsertRawData { return null; }
  / _ query:UnionQuery querySettings:( _ SettingsClause )? ( _ FormatClause InsertRawData )? { return { query, querySettings: querySettings ? querySettings[1] : null }; }
  / "" { return null; }

// InsertRawData: consumes everything until ";" or end of input (including newlines, strings)
InsertRawData
  = ( "'" ( "''" / "\\'" / "\\\\" / !"'" ( [\n\r] / . ) )* "'"
    / !";" ( [\n\r] / . )
  )*

// ── CREATE statements ────────────────────────────────────────────────────────

// PARALLEL WITH: chains multiple statements (CREATE, INSERT, TRUNCATE, etc.)
ParallelWithStatement
  = head:CreateStatement tail:( _ "PARALLEL"i ![a-zA-Z0-9_] _ "WITH"i ![a-zA-Z0-9_] _ CreateStatement )+ {
      return loc({ kind: 'parallelWith', queries: [head, ...tail.map(t => t[7])] });
    }
  / head:ParallelWithItem tail:( _ "PARALLEL"i ![a-zA-Z0-9_] _ "WITH"i ![a-zA-Z0-9_] _ ParallelWithItem )+ {
      return loc({ kind: 'parallelWith', queries: [head, ...tail.map(t => t[7])] });
    }

ParallelWithItem
  = InsertStatement
  / DropStatement
  / TruncateStatement

// TruncateStatement: TRUNCATE [TABLE] [IF EXISTS] [db.]table — minimal parsing for PARALLEL WITH support
TruncateStatement
  = "TRUNCATE"i ![a-zA-Z0-9_] ( _ "TABLE"i ![a-zA-Z0-9_] )? ( _ "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )? _ table:TableRef {
      return loc({ kind: 'truncate', table });
    }

// Unified entry point for all CREATE/REPLACE statements
CreateStatement
  = CreateFunctionStatement
  / CreateViewStatement
  / CreateMaterializedViewStatement
  / CreateDatabaseStatement
  / CreateIndexStatement
  / CreateDictionaryStatement
  / CreateWorkloadStatement
  / CreateUserStatement
  / CreateRoleStatement
  / CreateRowPolicyStatement
  / CreateQuotaStatement
  / CreateSettingsProfileStatement
  / CreateNamedCollectionStatement
  / CreateResourceStatement
  / CreateWindowViewStatement
  / CreateLiveViewStatement
  / CreateTableStatement

// CreateFunctionStatement: CREATE [OR REPLACE] FUNCTION name AS lambda
CreateFunctionStatement
  = "CREATE"i ![a-zA-Z0-9_] _ orReplace:( "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] _ )? "FUNCTION"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName cluster:( _ OnClusterClause )? _ KW_AS _ expr:Expression {
      return loc({ kind: 'createFunction', name, functionExpr: expr });
    }

// CreateViewStatement: CREATE [OR REPLACE] [TEMPORARY] VIEW [IF NOT EXISTS] [db.]name [(columns)] [ON CLUSTER ...] AS query
CreateViewStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    temp:( _ "TEMPORARY"i ![a-zA-Z0-9_] )?
    _ "VIEW"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ table:TableRef
    cluster:( _ OnClusterClause )?
    schema:( _ CreateTableSchema )?
    _ KW_AS _ query:UnionQuery {
      const result = { kind: 'createView', table };
      if (orReplace !== null) result.orReplace = true;
      if (temp !== null) result.temporary = true;
      if (ifne !== null) result.ifNotExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      if (schema !== null) Object.assign(result, schema[1]);
      result.asQuery = query;
      return loc(result);
    }

// CreateMaterializedViewStatement: CREATE MATERIALIZED VIEW [IF NOT EXISTS] [db.]name [REFRESH ...] [TO [db.]table] [ENGINE ...] [POPULATE] AS query
CreateMaterializedViewStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "MATERIALIZED"i ![a-zA-Z0-9_] _ "VIEW"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ table:TableRef
    uuid:( _ "UUID"i ![a-zA-Z0-9_] _ StringLiteral )?
    cluster:( _ OnClusterClause )?
    refresh:( _ RefreshClause )?
    toTable:( _ "TO"i ![a-zA-Z0-9_] _ TableRef )?
    schema:( _ CreateTableSchema )?
    engine:( _ EngineClause )?
    clauses:CreateTableClauses
    populate:( _ "POPULATE"i ![a-zA-Z0-9_] )?
    empty:( _ "EMPTY"i ![a-zA-Z0-9_] )?
    _ KW_AS _ query:UnionQuery
    format:( _ FormatClause )? {
      const result = { kind: 'createMaterializedView', table };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      if (refresh !== null) result.refresh = refresh[1];
      if (toTable !== null) result.toTable = toTable[4];
      if (schema !== null) Object.assign(result, schema[1]);
      if (engine !== null) result.engine = engine[1];
      Object.assign(result, clauses);
      if (populate !== null) result.populate = true;
      if (empty !== null) result.empty = true;
      result.asQuery = query;
      if (format !== null) result.format = format[1];
      return loc(result);
    }

// CreateDatabaseStatement: CREATE DATABASE [IF NOT EXISTS] name [ON CLUSTER ...] [ENGINE ...] [COMMENT ...]
// Also accepts ORDER BY / SETTINGS (which ClickHouse may reject but should parse)
CreateDatabaseStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "DATABASE"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:( QueryParamIdentifier / AliasName )
    cluster:( _ OnClusterClause )?
    engine:( _ EngineClause )?
    clauses:CreateTableClauses
    comment:( _ CreateCommentClause )?
    format:( _ FormatClause )? {
      const result = { kind: 'createDatabase', name };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      if (engine !== null) result.engine = engine[1];
      if (comment !== null) result.comment = comment[1];
      if (clauses.orderBy) result.orderBy = clauses.orderBy;
      if (clauses.settings) result.settings = clauses.settings;
      if (format !== null) result.format = format[1];
      return loc(result);
    }

// CreateIndexStatement: CREATE [UNIQUE] INDEX name ON [db.]table (expr) [TYPE type] [GRANULARITY n]
CreateIndexStatement
  = "CREATE"i ![a-zA-Z0-9_] unique:( _ "UNIQUE"i ![a-zA-Z0-9_] )?
    _ "INDEX"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName _ "ON"i ![a-zA-Z0-9_] _ table:TableRef
    _ indexExpr:CreateIndexExprs
    indexType:( _ "TYPE"i ![a-zA-Z0-9_] _ IndexTypeSpec )?
    gran:( _ "GRANULARITY"i ![a-zA-Z0-9_] _ n:$[0-9]+ { return parseInt(n, 10); } )? {
      const result = { kind: 'createIndex', table, indexName: name, indexExpr: indexExpr };
      if (indexType !== null) result.indexType = indexType[4];
      if (gran !== null) result.granularity = gran;
      return loc(result);
    }

CreateIndexExprs
  = "(" _ head:IndexColumnExpr tail:(_ "," _ IndexColumnExpr)* _ ")" {
      const exprs = [head, ...tail.map(t => t[3])];
      return exprs.length > 1 ? loc({ kind: 'functionCall', name: 'tuple', args: exprs }) : exprs[0];
    }
  / expr:TernaryExpr { return expr; }

// CreateDictionaryStatement: CREATE [OR REPLACE] DICTIONARY [IF NOT EXISTS] [db.]name (attrs) PRIMARY KEY ... SOURCE(...) LIFETIME(...) LAYOUT(...)
CreateDictionaryStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "DICTIONARY"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ table:TableRef
    cluster:( _ OnClusterClause )?
    _ "(" _ attrs:DictAttrList _ ")"
    _ dictDef:DictDefinition {
      const result = { kind: 'createDictionary', table };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      result.dictAttrs = attrs;
      result.dictDef = dictDef;
      return loc(result);
    }

DictAttrList
  = head:DictAttr tail:(_ "," _ DictAttr)* (_ ",")? { return [head, ...tail.map(t => t[3])]; }

DictAttr
  = name:AliasName _ type:ColumnDataType
    def:( _ "DEFAULT"i ![a-zA-Z0-9_] _ TernaryExpr )?
    expr:( _ "EXPRESSION"i ![a-zA-Z0-9_] _ TernaryExpr )?
    injective:( _ "INJECTIVE"i ![a-zA-Z0-9_] )?
    isObjMap:( _ "IS_OBJECT_ID"i ![a-zA-Z0-9_] )?
    hierarch:( _ "HIERARCHICAL"i ![a-zA-Z0-9_] )?
    bidirect:( _ "BIDIRECTIONAL"i ![a-zA-Z0-9_] )? {
      const result = { name, type };
      if (def !== null) result.defaultValue = def[4];
      if (expr !== null) result.expression = expr[4];
      return result;
    }

DictDefinition
  = clauses:( _ DictClause )+ {
      const result = {};
      for (const c of clauses) {
        const clause = c[1];
        if (clause.primaryKey) result.primaryKey = clause.primaryKey;
        else if (clause.source) result.source = clause.source;
        else if (clause.lifetime) result.lifetime = clause.lifetime;
        else if (clause.layout) result.layout = clause.layout;
        else if (clause.range) result.range = clause.range;
        else if (clause.settings) result.settings = clause.settings;
        else if (clause.comment !== undefined) result.comment = clause.comment;
      }
      return result;
    }

DictClause
  = "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] _ head:Expression tail:(_ "," _ Expression)* {
      return { primaryKey: [head, ...tail.map(t => t[3])] };
    }
  / "SOURCE"i ![a-zA-Z0-9_] _ "(" _ name:AliasName _ "(" _ pairs:DictKeyValueList? _ ")" _ ")" {
      return { source: { name: name.toLowerCase(), pairs: pairs || [] } };
    }
  / "LIFETIME"i ![a-zA-Z0-9_] _ "(" _ items:DictLifetimeItems _ ")" {
      return { lifetime: items };
    }
  / "LIFETIME"i ![a-zA-Z0-9_] _ "(" _ val:$[0-9]+ _ ")" {
      return { lifetime: { value: parseInt(val, 10) } };
    }
  / "LAYOUT"i ![a-zA-Z0-9_] _ "(" _ name:AliasName args:( _ "(" _ DictKeyValueList? _ ")" )? _ ")" {
      return { layout: { name: name.toUpperCase(), pairs: args !== null ? (args[3] || []) : [] } };
    }
  / "RANGE"i ![a-zA-Z0-9_] _ "(" _ items:DictKeyValueList _ ")" {
      return { range: items };
    }
  / KW_SETTINGS _ items:SettingsList {
      return { settings: items };
    }
  / "SETTINGS"i ![a-zA-Z0-9_] _ "(" _ items:SettingsList? _ ")" {
      return { settings: items || [] };
    }
  / "COMMENT"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return { comment: str.value };
    }

DictLifetimeItems
  = head:DictLifetimeItem tail:( _ DictLifetimeItem )* {
      const result = {};
      const items = [head, ...tail.map(t => t[1])];
      for (const item of items) Object.assign(result, item);
      return result;
    }

DictLifetimeItem
  = "MIN"i ![a-zA-Z0-9_] _ val:$[0-9]+ { return { min: parseInt(val, 10) }; }
  / "MAX"i ![a-zA-Z0-9_] _ val:$[0-9]+ { return { max: parseInt(val, 10) }; }

DictKeyValueList
  = head:DictKeyValuePair tail:( _ DictKeyValuePair )* { return [head, ...tail.map(t => t[1])]; }

DictKeyValuePair
  = name:AliasName _ value:Expression { return { name, value }; }
  / name:AliasName _ "(" _ pairs:DictStructurePairList _ ")" { return { name, value: pairs }; }
  / name:AliasName _ value:ClickHouseTypeArgs { return { name, value: loc({ kind: 'literal', type: 'String', value: value }) }; }

// Structure pairs inside dictionary SOURCE: "a String\n b Decimal(18,8)"
DictStructurePairList
  = head:DictStructurePair tail:( _ DictStructurePair )* { return [head, ...tail.map(t => t[1])]; }

DictStructurePair
  = name:AliasName _ type:ColumnDataType { return { name, type }; }

// Index column expression: expression with optional ASC/DESC (DESC is ignored in explain output)
IndexColumnExpr
  = expr:Expression dir:( _ ("ASC"i / "DESC"i) ![a-zA-Z0-9_] )? { return expr; }

// CreateWorkloadStatement: CREATE [OR REPLACE] WORKLOAD name [IN parent] [SETTINGS ...]
CreateWorkloadStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "WORKLOAD"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    parent:( _ "IN"i ![a-zA-Z0-9_] _ AliasName )?
    settings:( _ SettingsClause )? {
      const result = { kind: 'createWorkload', name };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      if (parent !== null) result.parentWorkload = parent[4];
      return loc(result);
    }

// Individual CREATE statement rules for access control and other object types.

// ── CREATE USER ──────────────────────────────────────────────────────────────
CreateUserStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplacePre:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "USER"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    orReplacePost:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ names:CreateUserNameList
    clauses:( _ CreateUserClause )*
    {
      const result = { kind: 'createUser', names };
      if (orReplacePre !== null || orReplacePost !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      for (const c of clauses) {
        const clause = c[1];
        if (clause.auth !== undefined) result.auth = clause.auth;
        if (clause.host !== undefined) result.host = clause.host;
        if (clause.settings !== undefined) result.settings = clause.settings;
        if (clause.defaultRole !== undefined) result.defaultRole = clause.defaultRole;
        if (clause.defaultDatabase !== undefined) result.defaultDatabase = clause.defaultDatabase;
        if (clause.grantees !== undefined) result.grantees = clause.grantees;
        if (clause.validUntil !== undefined) result.validUntil = clause.validUntil;
        if (clause.onCluster !== undefined) result.onCluster = clause.onCluster;
      }
      return loc(result);
    }

CreateUserClause
  = CreateUserIdentifiedClause
  / CreateUserHostClause
  / CreateUserSettingsClause
  / CreateUserDefaultRoleClause
  / CreateUserDefaultDatabaseClause
  / CreateUserGranteesClause
  / CreateUserValidUntilClause
  / CreateUserOnClusterClause

CreateUserIdentifiedClause
  = "NOT"i ![a-zA-Z0-9_] _ "IDENTIFIED"i ![a-zA-Z0-9_] { return { auth: [{}] }; }
  / "IDENTIFIED"i ![a-zA-Z0-9_] _ auth:CreateUserAuthMethods { return { auth }; }

CreateUserHostClause
  = "HOST"i ![a-zA-Z0-9_] _ items:HostItemList { return { host: items }; }

CreateUserSettingsClause
  = "SETTINGS"i ![a-zA-Z0-9_] _ "NONE"i ![a-zA-Z0-9_] { return { settings: 'NONE' }; }
  / "SETTINGS"i ![a-zA-Z0-9_] _ items:AccessControlSettingsList { return { settings: items }; }

CreateUserDefaultRoleClause
  = "DEFAULT"i ![a-zA-Z0-9_] _ "ROLE"i ![a-zA-Z0-9_] _ roles:SetRoleList { return { defaultRole: roles }; }

CreateUserDefaultDatabaseClause
  = "DEFAULT"i ![a-zA-Z0-9_] _ "DATABASE"i ![a-zA-Z0-9_] _ db:AliasName { return { defaultDatabase: db }; }

CreateUserGranteesClause
  = "GRANTEES"i ![a-zA-Z0-9_] _ target:SetRoleList { return { grantees: target }; }

CreateUserValidUntilClause
  = "VALID"i ![a-zA-Z0-9_] _ "UNTIL"i ![a-zA-Z0-9_] _ str:StringLiteral { return { validUntil: str.value }; }

CreateUserOnClusterClause
  = "ON"i ![a-zA-Z0-9_] _ "CLUSTER"i ![a-zA-Z0-9_] _ name:( StringLiteral { return text(); } / AliasName ) { return { onCluster: name }; }

CreateUserNameList
  = head:CreateUserNameItem tail:( _ "," _ CreateUserNameItem )* { return [head, ...tail.map(t => t[3])]; }

CreateUserNameItem
  = name:CreateUserNameValue host:( "@" host:( "'" chars:$[^']* "'" { return "'" + chars + "'"; } / $[a-zA-Z0-9_.%:]+ ) { return host; } )? {
      const result = { name };
      if (host !== null) result.host = host;
      return result;
    }

CreateUserNameValue
  = "{" body:$[^}]* "}" { return '{' + body + '}'; }
  / "'" chars:SingleQuotedUserChar* "'" { return "'" + chars.join("") + "'"; }
  / AliasName

SingleQuotedUserChar
  = "''" { return "'"; }
  / "\\'" { return "'"; }
  / "\\\\" { return "\\"; }
  / !"'" c:. { return c; }

CreateUserAuthMethods
  // SSH key auth: all KEY...TYPE... entries are one method
  = "WITH"i ![a-zA-Z0-9_] _ "ssh_key"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ keys:CreateUserSSHKeyList {
      return [{ sshKeys: keys }];
    }
  // Comma-separated auth methods
  / head:CreateUserAuthMethod tail:( _ "," _ CreateUserAuthMethod )* {
      return [head, ...tail.map(t => t[3])];
    }

CreateUserAuthMethod
  // WITH type_name BY/REALM/SERVER 'secret'
  = "WITH"i ![a-zA-Z0-9_] _ [a-zA-Z_][a-zA-Z0-9_]* _ secret:CreateUserAuthSecret { return secret; }
  // WITH type_name (no secret, e.g. no_password)
  / "WITH"i ![a-zA-Z0-9_] _ [a-zA-Z_][a-zA-Z0-9_]* { return {}; }
  // type_name BY/REALM/SERVER 'secret' (after comma, no WITH keyword)
  / [a-zA-Z_][a-zA-Z0-9_]* _ secret:CreateUserAuthSecret { return secret; }
  // bare BY 'secret' (implicit continuation of previous type)
  / secret:CreateUserAuthSecret { return secret; }

CreateUserAuthSecret
  = "BY"i ![a-zA-Z0-9_] _ str:CreateUserAuthSecretValue { return { secret: str }; }
  / "REALM"i ![a-zA-Z0-9_] _ str:CreateUserAuthSecretValue { return { secret: str }; }
  / "SERVER"i ![a-zA-Z0-9_] _ str:CreateUserAuthSecretValue { return { secret: str }; }

CreateUserAuthSecretValue
  = str:StringLiteral { return str.value; }
  / "{" body:$[^}]* "}" { return '{' + body + '}'; }

CreateUserSSHKeyList
  = head:CreateUserSSHKey tail:( _ "," _ CreateUserSSHKey )* { return 1 + tail.length; }

CreateUserSSHKey
  = "KEY"i ![a-zA-Z0-9_] _ StringLiteral _ "TYPE"i ![a-zA-Z0-9_] _ StringLiteral

// ── HOST items ───────────────────────────────────────────────────────────────
HostItemList
  = head:HostItems tail:( _ "," _ HostItems )* {
      const result = [];
      for (const items of [head, ...tail.map(t => t[3])]) {
        if (Array.isArray(items)) result.push(...items);
        else result.push(items);
      }
      return result;
    }

HostItems
  = "ANY"i ![a-zA-Z0-9_] { return { kind: 'any' }; }
  / "NONE"i ![a-zA-Z0-9_] { return { kind: 'none' }; }
  / "LOCAL"i ![a-zA-Z0-9_] { return { kind: 'local' }; }
  / "NAME"i ![a-zA-Z0-9_] _ str:StringLiteral { return { kind: 'name', value: str.value }; }
  / "REGEXP"i ![a-zA-Z0-9_] _ str:StringLiteral { return { kind: 'regexp', value: str.value }; }
  / "LIKE"i ![a-zA-Z0-9_] _ strs:HostStringList { return strs.map(s => ({ kind: 'like', value: s })); }
  / "IP"i ![a-zA-Z0-9_] _ strs:HostStringList { return strs.map(s => ({ kind: 'ip', value: s })); }

HostStringList
  = head:StringLiteral tail:( _ "," _ StringLiteral )* { return [head.value, ...tail.map(t => t[3].value)]; }

// ── Access Control SETTINGS ──────────────────────────────────────────────────
AccessControlSettingsList
  = head:AccessControlSettingsItem tail:( _ "," _ AccessControlSettingsItem )* { return [head, ...tail.map(t => t[3])]; }

AccessControlSettingsItem
  = "PROFILE"i ![a-zA-Z0-9_] _ name:( StringLiteral { return text(); } / AliasName ) { return { kind: 'profile', name }; }
  / "INHERIT"i ![a-zA-Z0-9_] _ name:( StringLiteral { return text(); } / AliasName ) { return { kind: 'inherit', name }; }
  / name:AccessControlSettingName val:( _ "=" _ Expression )? min:( _ "MIN"i ![a-zA-Z0-9_] _ ( "=" _ )? Expression )? max:( _ "MAX"i ![a-zA-Z0-9_] _ ( "=" _ )? Expression )? mod:( _ ("CONST"i / "WRITABLE"i / "READONLY"i) ![a-zA-Z0-9_] )? {
      const result = { kind: 'setting', name };
      if (val !== null) result.value = val[3];
      if (min !== null) result.min = min[5];
      if (max !== null) result.max = max[5];
      if (mod !== null) result.modifier = mod[1].toUpperCase();
      return result;
    }

AccessControlSettingName
  = head:AliasName tail:( "." AliasName )* { return tail.length > 0 ? head + tail.map(t => '.' + t[1]).join('') : head; }

// ── CREATE ROLE ──────────────────────────────────────────────────────────────
CreateRoleStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "ROLE"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ names:CreateUserNameList
    settings:( _ CreateRoleSettingsClause )?
    {
      const result = { kind: 'createRole', names };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      if (settings !== null) result.settings = settings[1];
      return loc(result);
    }

CreateRoleSettingsClause
  = "SETTINGS"i ![a-zA-Z0-9_] _ "NONE"i ![a-zA-Z0-9_] { return 'NONE'; }
  / "SETTINGS"i ![a-zA-Z0-9_] _ items:AccessControlSettingsList { return items; }

// ── CREATE ROW POLICY ────────────────────────────────────────────────────────
CreateRowPolicyStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplacePre:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ hasRow:( "ROW"i ![a-zA-Z0-9_] _ )? "POLICY"i ![a-zA-Z0-9_]
    orReplacePost:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ targetsResult:RowPolicyTargets
    clauses:( _ RowPolicyClause )*
    {
      const result = { kind: 'createRowPolicy', targets: targetsResult.targets };
      if (orReplacePre !== null || orReplacePost !== null) result.orReplace = true;
      if (hasRow !== null) result.hasRowKeyword = true;
      if (ifne !== null) result.ifNotExists = true;
      if (targetsResult.onCluster) result.onCluster = targetsResult.onCluster;
      for (const c of clauses) {
        const clause = c[1];
        if (clause.using !== undefined) result.using = clause.using;
        if (clause.restrictive !== undefined) result.restrictive = clause.restrictive;
        if (clause.to !== undefined) result.to = clause.to;
        if (clause.onCluster !== undefined) result.onCluster = clause.onCluster;
      }
      return loc(result);
    }

RowPolicyTargets
  = head:RowPolicyTarget tail:( _ "," _ RowPolicyTarget )* {
      const result = { targets: [], onCluster: null };
      for (const target of [head, ...tail.map(t => t[3])]) {
        if (target.onCluster) result.onCluster = target.onCluster;
        for (const table of target.tables) {
          result.targets.push({ names: target.names, table });
        }
      }
      return result;
    }

RowPolicyTarget
  = names:RowPolicyNameList cluster:( _ OnClusterClause )? _ "ON"i ![a-zA-Z0-9_] _ tables:RowPolicyTableList {
      const result = { names, tables };
      if (cluster !== null) result.onCluster = cluster[1];
      return result;
    }

RowPolicyTableList
  = head:RowPolicyTableRef tail:( _ "," _ !RowPolicyTargetLookahead RowPolicyTableRef )* { return [head, ...tail.map(t => t[4])]; }

RowPolicyTableRef
  = db:( QueryParamIdentifier / AliasName ) _ "." _ table:( "*" { return '*'; } / QueryParamIdentifier / AliasName ) {
      return loc({ kind: 'tableRef', database: db, table: table });
    }
  / table:( QueryParamIdentifier / AliasName ) {
      return loc({ kind: 'tableRef', table: table });
    }

RowPolicyTargetLookahead
  = AliasName _ "ON"i ![a-zA-Z0-9_]

RowPolicyNameList
  = head:AliasName tail:( _ "," _ AliasName !( _ "." ) )* { return [head, ...tail.map(t => t[3])]; }

RowPolicyClause
  = "FOR"i ![a-zA-Z0-9_] _ "SELECT"i ![a-zA-Z0-9_] { return {}; }
  / "USING"i ![a-zA-Z0-9_] _ expr:Expression { return { using: expr }; }
  / "AS"i ![a-zA-Z0-9_] _ mode:("RESTRICTIVE"i / "PERMISSIVE"i) ![a-zA-Z0-9_] { return { restrictive: mode.toUpperCase() }; }
  / "TO"i ![a-zA-Z0-9_] _ target:SetRoleList { return { to: target }; }
  / "ON"i ![a-zA-Z0-9_] _ "CLUSTER"i ![a-zA-Z0-9_] _ name:( StringLiteral { return text(); } / AliasName ) { return { onCluster: name }; }

// ── CREATE QUOTA ─────────────────────────────────────────────────────────────
CreateQuotaStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "QUOTA"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ names:QuotaNameList
    clauses:( _ ","? _ QuotaClause )*
    {
      const result = { kind: 'createQuota', names };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      const intervals = [];
      for (const c of clauses) {
        const clause = c[3];
        if (clause.keyed !== undefined) result.keyed = clause.keyed;
        if (clause.interval !== undefined) intervals.push(clause.interval);
        if (clause.to !== undefined) result.to = clause.to;
      }
      if (intervals.length > 0) result.intervals = intervals;
      return loc(result);
    }

QuotaNameList
  = head:AccessControlNameValue tail:( _ "," _ AccessControlNameValue )* { return [head, ...tail.map(t => t[3])]; }

AccessControlNameValue
  = "'" chars:SingleQuotedUserChar* "'" { return "'" + chars.join("") + "'"; }
  / AliasName

QuotaClause
  = QuotaKeyedClause
  / QuotaIntervalClause
  / "TO"i ![a-zA-Z0-9_] _ target:SetRoleList { return { to: target }; }

QuotaKeyedClause
  = "NOT"i ![a-zA-Z0-9_] _ "KEYED"i ![a-zA-Z0-9_] { return { keyed: { notKeyed: true } }; }
  / ("KEYED"i / "KEY"i) ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ keys:QuotaKeyList { return { keyed: { keys } }; }

QuotaKeyList
  = head:QuotaKeyName tail:( _ "," _ QuotaKeyName )* { return [head, ...tail.map(t => t[3])]; }

QuotaKeyName
  = StringLiteral { return text(); }
  / AliasName

QuotaIntervalClause
  = "FOR"i ![a-zA-Z0-9_] _ randomized:( "RANDOMIZED"i ![a-zA-Z0-9_] _ )? ( "INTERVAL"i ![a-zA-Z0-9_] _ )? duration:QuotaDuration _ unit:QuotaTimeUnit body:( _ QuotaIntervalBody )? {
      const result = { duration, unit: unit.toUpperCase() };
      if (randomized !== null) result.randomized = true;
      if (body !== null) {
        const b = body[1];
        if (b.trackingOnly) result.trackingOnly = true;
        if (b.noLimits) result.noLimits = true;
        if (b.limits) result.limits = b.limits;
      }
      return { interval: result };
    }

QuotaDuration
  = $( [0-9]+ ( "." [0-9]+ )? )

QuotaTimeUnit
  = ("SECOND"i / "MINUTE"i / "HOUR"i / "DAY"i / "WEEK"i / "MONTH"i / "QUARTER"i / "YEAR"i) ("S"i)? ![a-zA-Z0-9_] { return text().replace(/s$/i, ''); }

QuotaIntervalBody
  = "TRACKING"i ![a-zA-Z0-9_] _ "ONLY"i ![a-zA-Z0-9_] { return { trackingOnly: true }; }
  / "NO"i ![a-zA-Z0-9_] _ "LIMITS"i ![a-zA-Z0-9_] { return { noLimits: true }; }
  / limits:QuotaLimitList { return { limits }; }

QuotaLimitList
  = head:QuotaLimitItem tail:( _ "," _ !QuotaLimitListEnd QuotaLimitItem )* { return [head, ...tail.map(t => t[4])]; }

QuotaLimitListEnd
  = "FOR"i ![a-zA-Z0-9_]
  / "TO"i ![a-zA-Z0-9_]
  / "KEYED"i ![a-zA-Z0-9_]
  / "KEY"i ![a-zA-Z0-9_]
  / "NOT"i ![a-zA-Z0-9_] _ "KEYED"i ![a-zA-Z0-9_]

QuotaLimitItem
  // MAX name = value / MAX name value / name MAX value / name = value / name value
  = "MAX"i ![a-zA-Z0-9_] _ name:QuotaLimitName _ ( "=" _ )? value:Expression { return { name: name.toUpperCase(), value }; }
  / name:QuotaLimitName _ "MAX"i ![a-zA-Z0-9_] _ value:Expression { return { name: name.toUpperCase(), value }; }
  / name:QuotaLimitName _ "=" _ value:Expression { return { name: name.toUpperCase(), value }; }
  / name:QuotaLimitName _ value:Expression { return { name: name.toUpperCase(), value }; }

QuotaLimitName
  = ("RESULT"i / "READ"i / "EXECUTION"i) " " ("ROWS"i / "BYTES"i / "TIME"i) { return text().toUpperCase().replace(/ /g, '_'); }
  / $( [a-zA-Z_]+ ( "_" [a-zA-Z_]+ )* )

// ── CREATE SETTINGS PROFILE ──────────────────────────────────────────────────
CreateSettingsProfileStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplacePre:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ hasSK:( "SETTINGS"i ![a-zA-Z0-9_] _ )? "PROFILE"i ![a-zA-Z0-9_]
    orReplacePost:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ names:QuotaNameList
    settings:( _ CreateRoleSettingsClause )?
    to:( _ "TO"i ![a-zA-Z0-9_] _ SetRoleList )?
    {
      const result = { kind: 'createSettingsProfile', names };
      if (orReplacePre !== null || orReplacePost !== null) result.orReplace = true;
      if (hasSK !== null) result.hasSettingsKeyword = true;
      if (ifne !== null) result.ifNotExists = true;
      if (settings !== null) result.settings = settings[1];
      if (to !== null) result.to = to[4];
      return loc(result);
    }

// ── CREATE NAMED COLLECTION ──────────────────────────────────────────────────
CreateNamedCollectionStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "NAMED"i ![a-zA-Z0-9_] _ "COLLECTION"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    cluster:( _ OnClusterClause )?
    _ "AS"i ![a-zA-Z0-9_] _ items:NamedCollectionItemList
    {
      const result = { kind: 'createNamedCollection', name, items };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      return loc(result);
    }

NamedCollectionItemList
  = head:NamedCollectionItem tail:( _ "," _ NamedCollectionItem )* { return [head, ...tail.map(t => t[3])]; }

NamedCollectionItem
  = key:AliasName _ "=" _ value:Expression { return { key, value }; }

// ── CREATE RESOURCE ──────────────────────────────────────────────────────────
CreateResourceStatement
  = "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    _ "RESOURCE"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ name:AliasName
    _ "(" _ specs:ResourceSpecList _ ")"
    {
      const result = { kind: 'createResource', name, specs };
      if (orReplace !== null) result.orReplace = true;
      if (ifne !== null) result.ifNotExists = true;
      return loc(result);
    }

ResourceSpecList
  = head:ResourceSpec tail:( _ "," _ ResourceSpec )* { return [head, ...tail.map(t => t[3])]; }

ResourceSpec
  = operation:$("READ"i / "WRITE"i) ![a-zA-Z0-9_] _ resourceType:$("DISK"i / "ANY"i) ![a-zA-Z0-9_] _ resourceName:AliasName {
      return { operation: operation.toUpperCase(), resourceType: resourceType.toUpperCase(), resourceName };
    }

// ── CREATE WINDOW VIEW (raw body) ───────────────────────────────────────────
CreateWindowViewStatement
  = "CREATE"i ![a-zA-Z0-9_] _ ( "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] _ )? "WINDOW"i ![a-zA-Z0-9_] _ "VIEW"i ![a-zA-Z0-9_] body:$( ![;] . )* {
      return loc({ kind: 'createWindowView', rawBody: body.trim() });
    }

// ── CREATE LIVE VIEW (raw body) ─────────────────────────────────────────────
CreateLiveViewStatement
  = "CREATE"i ![a-zA-Z0-9_] _ ( "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] _ )? "LIVE"i ![a-zA-Z0-9_] _ "VIEW"i ![a-zA-Z0-9_] body:$( ![;] . )* {
      return loc({ kind: 'createLiveView', rawBody: body.trim() });
    }

// CreateTableStatement: handles all CREATE TABLE and REPLACE TABLE forms
CreateTableStatement
  = header:CreateTableHeader _ body:CreateTableBody format:( _ FormatClause )? {
      const result = { ...header, ...body };
      if (format !== null) result.format = format[1];
      // Promote column-level PRIMARY KEY to primaryKey if no explicit PRIMARY KEY clause
      if (result._columnPrimaryKeys && !result.primaryKey) {
        result.primaryKey = result._columnPrimaryKeys;
      }
      delete result._columnPrimaryKeys;
      return loc(result);
    }

// Header: CREATE [OR REPLACE] [TEMPORARY] TABLE [IF NOT EXISTS] [db.]table [ON CLUSTER ...]
// Also: REPLACE TABLE [db.]table [ON CLUSTER ...]
CreateTableHeader
  = "REPLACE"i ![a-zA-Z0-9_] _ "TABLE"i ![a-zA-Z0-9_] _ table:TableRef cluster:( _ OnClusterClause )? {
      const result = { kind: 'createTable', replace: true, table };
      if (cluster !== null) result.onCluster = cluster[1];
      return result;
    }
  / "CREATE"i ![a-zA-Z0-9_] orReplace:( _ "OR"i ![a-zA-Z0-9_] _ "REPLACE"i ![a-zA-Z0-9_] )?
    temp:( _ "TEMPORARY"i ![a-zA-Z0-9_] )?
    _ "TABLE"i ![a-zA-Z0-9_]
    ifne:( _ "IF"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] )?
    _ table:TableRef
    cluster:( _ OnClusterClause )? {
      const result = { kind: 'createTable', table };
      if (orReplace !== null) result.orReplace = true;
      if (temp !== null) result.temporary = true;
      if (ifne !== null) result.ifNotExists = true;
      if (cluster !== null) result.onCluster = cluster[1];
      return result;
    }

OnClusterClause
  = "ON"i ![a-zA-Z0-9_] _ "CLUSTER"i ![a-zA-Z0-9_] _ name:( StringLiteral { return text(); } / AliasName ) { return name; }

// RefreshClause: REFRESH AFTER|EVERY N unit [APPEND]
RefreshClause
  = "REFRESH"i ![a-zA-Z0-9_] body:$( _ !("TO"i ![a-zA-Z0-9_] / "ENGINE"i ![a-zA-Z0-9_] / "(" / KW_AS / "EMPTY"i ![a-zA-Z0-9_] / "POPULATE"i ![a-zA-Z0-9_] / "ORDER"i ![a-zA-Z0-9_] / "PARTITION"i ![a-zA-Z0-9_] / "PRIMARY"i ![a-zA-Z0-9_] / "SAMPLE"i ![a-zA-Z0-9_] / "TTL"i ![a-zA-Z0-9_] / KW_SETTINGS / "COMMENT"i ![a-zA-Z0-9_]) . )+ {
      return body.trim();
    }

// Body: the various syntax forms after the header
CreateTableBody
  // Form: CLONE AS [db.]table [ENGINE ...] [clauses]
  = "CLONE"i ![a-zA-Z0-9_] _ "AS"i ![a-zA-Z0-9_] _ asTable:TableRef engine:( _ EngineClause )? clauses:CreateTableClauses {
      const result = { clone: true, asTable };
      if (engine !== null) result.engine = engine[1];
      Object.assign(result, clauses);
      return result;
    }
  // UUID clause (ignored, just skip it)
  / "UUID"i ![a-zA-Z0-9_] _ StringLiteral _ body:CreateTableBody { return body; }
  // Form: (columns) ENGINE ... [clauses] [AS SELECT ...]
  / schema:CreateTableSchema _ engine:EngineClause clauses:CreateTableClauses asQuery:( _ KW_AS _ UnionQuery )? {
      const result = { ...schema, engine };
      Object.assign(result, clauses);
      if (asQuery !== null) result.asQuery = asQuery[3];
      return result;
    }
  // Form: (columns) [clauses] AS table_function(...) — explicit columns with table function
  / schema:CreateTableSchema clauses:CreateTableClauses _ "AS"i ![a-zA-Z0-9_] _ name:AliasName _ "(" _ args:EngineArgList? _ ")" {
      const result = { ...schema, asTableFunction: { name, args: args || [] } };
      Object.assign(result, clauses);
      return result;
    }
  // Form: (columns) — no ENGINE (for TEMPORARY tables etc.)
  / schema:CreateTableSchema clauses:CreateTableClauses empty:( _ "EMPTY"i ![a-zA-Z0-9_] )? asQuery:( _ KW_AS _ &( KW_SELECT / KW_WITH / "(" ) UnionQuery )? {
      const result = { ...schema };
      Object.assign(result, clauses);
      if (empty !== null) result.empty = true;
      if (asQuery !== null) result.asQuery = asQuery[4];
      return result;
    }
  // Form: ENGINE ... [clauses] [EMPTY] AS SELECT ... (no explicit column schema)
  / engine:EngineClause clauses:CreateTableClauses empty:( _ "EMPTY"i ![a-zA-Z0-9_] )? _ KW_AS _ asQuery:UnionQuery {
      const result = { engine, asQuery };
      Object.assign(result, clauses);
      if (empty !== null) result.empty = true;
      return result;
    }
  // Form: ENGINE ... [clauses] AS table_name — schema from another table with explicit engine
  / engine:EngineClause clauses:CreateTableClauses _ "AS"i ![a-zA-Z0-9_] _ asTable:TableRef {
      const result = { engine, asTable };
      Object.assign(result, clauses);
      return result;
    }
  // Form: ENGINE ... [clauses] (no columns, no AS — empty table with engine)
  / engine:EngineClause clauses:CreateTableClauses {
      const result = { engine };
      Object.assign(result, clauses);
      return result;
    }
  // Form: [clauses] AS SELECT ... (no schema, no engine, e.g. default engine with ORDER BY)
  / &( "ORDER"i / "PARTITION"i / "PRIMARY"i / "SAMPLE"i / "TTL"i ) clauses:CreateTableClauses _ KW_AS _ asQuery:UnionQuery {
      const result = { asQuery };
      Object.assign(result, clauses);
      return result;
    }
  // Form: "EMPTY AS table_name" — ClickHouse extension (table ref, not SELECT)
  / "EMPTY"i ![a-zA-Z0-9_] _ "AS"i ![a-zA-Z0-9_] _ !( KW_SELECT / KW_WITH / "(" ) asTable:TableRef {
      return { empty: true, asTable };
    }
  // Form: "EMPTY AS SELECT ..." — ClickHouse extension
  / "EMPTY"i ![a-zA-Z0-9_] _ KW_AS _ asQuery:UnionQuery {
      return { empty: true, asQuery };
    }
  // Form: AS SELECT ... (no engine, for temporary tables)
  / KW_AS _ &( KW_SELECT / KW_WITH / "(" ) asQuery:UnionQuery {
      return { asQuery };
    }
  // Form: AS table_function(...) — must check before AS [db.]table
  / "AS"i ![a-zA-Z0-9_] _ name:AliasName _ "(" _ args:EngineArgList? _ ")" {
      const result = { asTableFunction: { name, args: args || [] } };
      return result;
    }
  // Form: AS [db.]table [ENGINE ...] [clauses] — schema from another table
  / "AS"i ![a-zA-Z0-9_] _ asTable:TableRef engine:( _ EngineClause )? clauses:CreateTableClauses {
      const result = { asTable };
      if (engine !== null) result.engine = engine[1];
      Object.assign(result, clauses);
      return result;
    }

// Schema: parenthesized column definitions
CreateTableSchema
  = "(" _ elements:TableElementList _ ")" {
      // Separate primary key from other elements
      const tableElements = [];
      let primaryKeyInSchema = null;
      const columnPrimaryKeys = [];
      for (const el of elements) {
        if (el._primaryKey) {
          primaryKeyInSchema = el._primaryKey;
        } else {
          tableElements.push(el);
          if (el.kind === 'columnDef' && el.primaryKey) {
            columnPrimaryKeys.push({ kind: 'columnRef', parts: [el.name] });
          }
        }
      }
      const result = {};
      if (tableElements.length > 0) result.tableElements = tableElements;
      if (primaryKeyInSchema !== null) result.primaryKeyInSchema = primaryKeyInSchema;
      if (columnPrimaryKeys.length > 0) result._columnPrimaryKeys = columnPrimaryKeys;
      return result;
    }

TableElementList
  = head:TableElement tail:(_ "," _ TableElement)* trailing_comma:(_ ",")? {
      return [head, ...tail.map(t => t[3])];
    }

TableElement
  = ConstraintElement
  / ForeignKeyElement
  / ProjectionIndexElement
  / IndexElement
  / ProjectionElement
  / PrimaryKeyElement
  / ColumnElement

// PROJECTION with INDEX: e.g. "PROJECTION region_proj INDEX region TYPE basic"
ProjectionIndexElement
  = "PROJECTION"i ![a-zA-Z0-9_] _ name:AliasName _ "INDEX"i ![a-zA-Z0-9_] _ indexExpr:IndexExpr _ "TYPE"i ![a-zA-Z0-9_] _ indexType:IndexTypeSpec {
      return loc({ kind: 'projectionDef', name, indexExpr, indexType });
    }

ColumnElement
  = name:AliasName
    type:( _ !("DEFAULT"i ![a-zA-Z0-9_] / "MATERIALIZED"i ![a-zA-Z0-9_] / "EPHEMERAL"i ![a-zA-Z0-9_] / "ALIAS"i ![a-zA-Z0-9_] / "COMMENT"i ![a-zA-Z0-9_] / "CODEC"i ![a-zA-Z0-9_] / "TTL"i ![a-zA-Z0-9_] / "STATISTICS"i ![a-zA-Z0-9_] / "SETTINGS"i ![a-zA-Z0-9_] / "NULL"i ![a-zA-Z0-9_] / "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] / "AUTO_INCREMENT"i ![a-zA-Z0-9_] / "COLLATE"i ![a-zA-Z0-9_] / "PRIMARY"i ![a-zA-Z0-9_] / "," / ")") ColumnDataType )?
    collate:( _ "COLLATE"i ![a-zA-Z0-9_] _ AliasName )?
    nullable1:( _ NullableModifier )?
    autoIncrement:( _ "AUTO_INCREMENT"i ![a-zA-Z0-9_] )?
    primaryKey:( _ "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] )?
    def:( _ ColumnDefault )?
    nullable2:( _ NullableModifier )?
    comment:( _ ColumnComment )?
    codec:( _ ColumnCodec )?
    stats:( _ ColumnStatistics )?
    ttl:( _ ColumnTTL )?
    colSettings:( _ ColumnSettings )? {
      const result = loc({ kind: 'columnDef', name });
      if (type !== null) result.type = type[2];
      else if (autoIncrement !== null) result.type = { name: 'INT', args: [] };
      const nullable = nullable2 !== null ? nullable2[1] : (nullable1 !== null ? nullable1[1] : null);
      if (collate !== null) result.collate = collate[4];
      if (nullable !== null) result.nullable = nullable;
      if (primaryKey !== null) result.primaryKey = true;
      if (def !== null) { result.defaultKind = def[1].kind; if (def[1].expr) result.defaultExpr = def[1].expr; }
      if (comment !== null) result.comment = comment[1];
      if (codec !== null) result.codec = codec[1];
      if (stats !== null) result.statistics = stats[1];
      if (ttl !== null) result.ttl = ttl[1];
      if (colSettings !== null) result.columnSettings = colSettings[1];
      return result;
    }

NullableModifier
  = "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] { return 'NOT NULL'; }
  / "NULL"i ![a-zA-Z0-9_] { return 'NULL'; }

ColumnDefault
  = "DEFAULT"i ![a-zA-Z0-9_] _ expr:TernaryExpr { return { kind: 'DEFAULT', expr }; }
  / "MATERIALIZED"i ![a-zA-Z0-9_] _ expr:TernaryExpr { return { kind: 'MATERIALIZED', expr }; }
  / "ALIAS"i ![a-zA-Z0-9_] _ expr:TernaryExpr { return { kind: 'ALIAS', expr }; }
  / "EPHEMERAL"i ![a-zA-Z0-9_] expr:( _ !("COMMENT"i ![a-zA-Z0-9_] / "CODEC"i ![a-zA-Z0-9_] / "TTL"i ![a-zA-Z0-9_] / "STATISTICS"i ![a-zA-Z0-9_] / "SETTINGS"i ![a-zA-Z0-9_] / "NULL"i ![a-zA-Z0-9_] / "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] / "," / ")") TernaryExpr )? {
      const result = { kind: 'EPHEMERAL' };
      if (expr !== null) result.expr = expr[2];
      return result;
    }

ColumnComment
  = "COMMENT"i ![a-zA-Z0-9_] _ str:StringLiteral { return str.value; }

ColumnCodec
  = "CODEC"i ![a-zA-Z0-9_] _ "(" _ items:CodecItemList _ ")" { return items; }

CodecItemList
  = head:CodecItemEntry tail:( _ "," _ CodecItemEntry )* { return [head, ...tail.map(t => t[3])]; }

CodecItemEntry
  = name:$([a-zA-Z_][a-zA-Z0-9_-]*) args:( _ "(" _ ExpressionList? _ ")" )? {
      const result = { name };
      if (args !== null) result.args = args[3] || [];
      return result;
    }
  // Quoted codec name like 'AES-128-GCM-SIV'
  / "'" name:$[^']+ "'" args:( _ "(" _ ExpressionList? _ ")" )? {
      const result = { name };
      if (args !== null) result.args = args[3] || [];
      return result;
    }
  // Backtick-quoted codec name like `@`
  / "`" name:$[^`]+ "`" args:( _ "(" _ ExpressionList? _ ")" )? {
      const result = { name };
      if (args !== null) result.args = args[3] || [];
      return result;
    }

ColumnStatistics
  = "STATISTICS"i ![a-zA-Z0-9_] _ "(" _ items:CodecItemList _ ")" { return items; }

ColumnTTL
  = "TTL"i ![a-zA-Z0-9_] _ expr:Expression { return expr; }

ColumnSettings
  = "SETTINGS"i ![a-zA-Z0-9_] _ "(" _ head:ColumnSettingItem tail:( _ "," _ ColumnSettingItem )* _ ")" {
      return [head, ...tail.map(t => t[3])];
    }

ColumnSettingItem
  = name:$([a-zA-Z_][a-zA-Z0-9_]*) _ "=" _ val:TernaryExpr {
      return { name, value: val };
    }

ConstraintElement
  = "CONSTRAINT"i ![a-zA-Z0-9_] _ name:AliasName _ ct:("CHECK"i / "ASSUME"i) ![a-zA-Z0-9_] _ expr:Expression {
      return loc({ kind: 'constraintDef', name, constraintType: ct.toUpperCase(), expr });
    }

// FOREIGN KEY: parsed and ignored (ClickHouse accepts but ignores foreign keys)
ForeignKeyElement
  = "FOREIGN"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] _ "(" _ cols:ExpressionList _ ")"
    _ "REFERENCES"i ![a-zA-Z0-9_] _ table:TableRef _ "(" _ refCols:ExpressionList _ ")"
    actions:( _ ForeignKeyAction )* {
      return loc({ kind: 'foreignKeyDef', columns: cols, refTable: table, refColumns: refCols });
    }

ForeignKeyAction
  = "ON"i ![a-zA-Z0-9_] _ ("DELETE"i / "UPDATE"i) ![a-zA-Z0-9_] _
    ("CASCADE"i / "RESTRICT"i / "SET"i ![a-zA-Z0-9_] _ "NULL"i / "NO"i ![a-zA-Z0-9_] _ "ACTION"i) ![a-zA-Z0-9_]

IndexElement
  = "INDEX"i ![a-zA-Z0-9_] _ name:AliasName _ expr:IndexExpr _ "TYPE"i ![a-zA-Z0-9_] _ indexType:IndexTypeSpec
    gran:( _ "GRANULARITY"i ![a-zA-Z0-9_] _ n:$[0-9]+ { return parseInt(n, 10); } )? {
      const result = loc({ kind: 'indexDef', name, expr, indexType });
      if (gran !== null) result.granularity = gran;
      return result;
    }

// Index expression: either a parenthesized expression or a regular expression
IndexExpr
  = "(" _ head:Expression tail:(_ "," _ Expression)* _ ")" {
      if (tail.length === 0) return head;
      return loc({ kind: 'functionCall', name: 'tuple', args: [head, ...tail.map(t => t[3])] });
    }
  / Expression

// Index type: name with optional args. Args can contain settings like tokenizer = ngrams(3)
IndexTypeSpec
  = name:$([a-zA-Z_][a-zA-Z0-9_]*) args:( _ "(" _ IndexTypeArgList? _ ")" )? {
      const result = { name };
      if (args !== null) result.args = args[3] || [];
      return result;
    }

IndexTypeArgList
  = head:IndexTypeArgEntry tail:( _ "," _ IndexTypeArgEntry )* { return [head, ...tail.map(t => t[3])]; }

// Each index type arg is parsed as an Expression (handles tokenizer = ngrams(3) as equals expr)
IndexTypeArgEntry = Expression

ProjectionElement
  = "PROJECTION"i ![a-zA-Z0-9_] _ name:AliasName _ "(" _ query:SelectStatement _ ")"
    projSettings:( _ "WITH"i ![a-zA-Z0-9_] _ "SETTINGS"i ![a-zA-Z0-9_] _ "(" _ SettingsList _ ")" )? {
      const result = loc({ kind: 'projectionDef', name, query });
      if (projSettings !== null) result.projectionSettings = projSettings[9];
      return result;
    }

PrimaryKeyElement
  = "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] _ exprs:PrimaryKeyExprs {
      return { _primaryKey: exprs };
    }

PrimaryKeyExprs
  = "(" _ ")" { return []; }
  / "(" _ head:Expression tail:(_ "," _ Expression)* _ ")" {
      return [head, ...tail.map(t => t[3])];
    }
  / expr:Expression { return [expr]; }

// Engine clause: ENGINE [=] name[(args)]
EngineClause
  = "ENGINE"i ![a-zA-Z0-9_] _ "="? _ name:AliasName args:( _ "(" _ EngineArgList? _ ")" )? {
      const result = { name };
      if (args !== null) result.args = args[3] !== null ? args[3] : [];
      return result;
    }

EngineArgList
  = head:Expression tail:(_ "," _ Expression)* {
      return [head, ...tail.map(t => t[3])];
    }

// Clauses that follow the ENGINE clause in a CREATE TABLE statement
// Order is flexible — clauses can appear in any order
CreateTableClauses
  = clauses:( _ CreateTableClause )* {
      const result = {};
      let sawOrdering = false; // true after ORDER BY or PRIMARY KEY
      let sawComment = false;
      for (const c of clauses) {
        const clause = c[1];
        if (clause.orderBy) { result.orderBy = clause.orderBy; sawOrdering = true; }
        else if (clause.partitionBy) result.partitionBy = clause.partitionBy;
        else if (clause.primaryKey) { result.primaryKey = clause.primaryKey; if (sawOrdering) result.primaryKeyAfterOrderBy = true; sawOrdering = true; }
        else if (clause.sampleBy) result.sampleBy = clause.sampleBy;
        else if (clause.ttl) result.ttl = clause.ttl;
        else if (clause.settings) {
          if (result.settings || sawComment) { result.querySettings = clause.settings; }
          else { result.settings = clause.settings; if (sawOrdering) result.settingsAfterOrderBy = true; }
        }
        else if (clause.comment !== undefined) { result.comment = clause.comment; sawComment = true; }
      }
      return result;
    }

CreateTableClause
  = c:CreateOrderByClause { return { orderBy: c }; }
  / c:CreatePartitionByClause { return { partitionBy: c }; }
  / c:CreatePrimaryKeyClause { return { primaryKey: c }; }
  / c:CreateSampleByClause { return { sampleBy: c }; }
  / c:CreateTTLClause { return { ttl: c }; }
  / c:SettingsClause { return { settings: c }; }
  / c:CreateCommentClause { return { comment: c }; }

CreateOrderByClause
  = "ORDER"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ "(" _ head:CreateOrderByItem tail:(_ "," _ CreateOrderByItem)* _ ")" !( _ [*/%+\-] ) {
      const items = [head, ...tail.map(t => t[3])];
      items._parenthesized = true;
      return items;
    }
  / "ORDER"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ head:CreateOrderByItem tail:(_ "," _ CreateOrderByItem)* {
      return [head, ...tail.map(t => t[3])];
    }

CreateOrderByItem
  = expr:TernaryExpr dir:( _ ("ASC"i / "DESC"i) ![a-zA-Z0-9_] )? { return { expr, dir: dir ? dir[1].toUpperCase() : undefined }; }

CreatePartitionByClause
  = "PARTITION"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ "(" _ ")" {
      return loc({ kind: 'functionCall', name: 'tuple', args: [] });
    }
  / "PARTITION"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ expr:TernaryExpr { return expr; }

CreatePrimaryKeyClause
  = "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] _ "(" _ ")" {
      return [];
    }
  / "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] _ "(" _ head:Expression tail:(_ "," _ Expression)* _ ")" {
      return [head, ...tail.map(t => t[3])];
    }
  / "PRIMARY"i ![a-zA-Z0-9_] _ "KEY"i ![a-zA-Z0-9_] _ expr:TernaryExpr {
      return [expr];
    }

CreateSampleByClause
  = "SAMPLE"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ expr:TernaryExpr { return expr; }

CreateTTLClause
  = "TTL"i ![a-zA-Z0-9_] _ head:TTLItem tail:( _ "," _ TTLItem )* {
      return [head, ...tail.map(t => t[3])];
    }

TTLItem
  = expr:TernaryExpr suffix:( _ TTLSuffix )? {
      const item = { expr };
      if (suffix !== null && suffix[1].where) item.where = suffix[1].where;
      return item;
    }

// TTL suffixes — we capture WHERE clause but discard others
TTLSuffix
  = "DELETE"i ![a-zA-Z0-9_] w:( _ "WHERE"i ![a-zA-Z0-9_] _ TernaryExpr )? { return w !== null ? { where: w[4] } : {}; }
  / "TO"i ![a-zA-Z0-9_] _ ("DISK"i / "VOLUME"i) ![a-zA-Z0-9_] _ ( "IF"i ![a-zA-Z0-9_] _ "EXISTS"i ![a-zA-Z0-9_] _ )? StringLiteral { return {}; }
  / "RECOMPRESS"i ![a-zA-Z0-9_] _ ColumnCodec { return {}; }
  / "WHERE"i ![a-zA-Z0-9_] _ w:TernaryExpr { return { where: w }; }
  / "GROUP"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ TTLGroupByList ( _ "SET"i ![a-zA-Z0-9_] _ TTLSetList )? { return {}; }

TTLGroupByList
  = head:TernaryExpr tail:( _ "," _ TernaryExpr )* { return [head, ...tail.map(t => t[3])]; }

TTLSetList
  = head:TTLSetItem tail:( _ "," _ TTLSetItem )* { return [head, ...tail.map(t => t[3])]; }

TTLSetItem
  = name:AddExpr _ "=" _ value:TernaryExpr { return { name, value }; }

CreateCommentClause
  = "COMMENT"i ![a-zA-Z0-9_] _ str:StringLiteral { return str.value; }

// ExplainStatement: EXPLAIN [AST|SYNTAX|QUERY TREE|PLAN|PIPELINE|ESTIMATE|TABLE OVERRIDE] [settings] [query] [FORMAT ...]
// Settings are key=value pairs without the SETTINGS keyword (e.g. EXPLAIN actions=1 SELECT ...).
ExplainStatement
  = "EXPLAIN"i ![a-zA-Z0-9_] _
    type:ExplainType? _
    settings:ExplainSettingsList? _
    query:UnionQuery?
    format:( _ FormatClause )?
    postSettings:( _ SettingsClause )? {
      const result = loc({ kind: 'explain' });
      if (type !== null) result.explainType = type;
      if (settings !== null && settings.length > 0) result.settings = settings;
      if (query !== null) result.query = query;
      if (format !== null) result.format = format[1];
      if (postSettings !== null) result.postFormatSettings = postSettings[1];
      return result;
    }

// ExplainType: the keyword identifying the EXPLAIN output type
ExplainType
  = "QUERY"i ![a-zA-Z0-9_] _ "TREE"i ![a-zA-Z0-9_] { return 'QUERY TREE'; }
  / "TABLE"i ![a-zA-Z0-9_] _ "OVERRIDE"i ![a-zA-Z0-9_] { return 'TABLE OVERRIDE'; }
  / "CURRENT"i ![a-zA-Z0-9_] _ "TRANSACTION"i ![a-zA-Z0-9_] { return 'CURRENT TRANSACTION'; }
  / "AST"i ![a-zA-Z0-9_] { return 'AST'; }
  / "SYNTAX"i ![a-zA-Z0-9_] { return 'SYNTAX'; }
  / "PLAN"i ![a-zA-Z0-9_] { return 'PLAN'; }
  / "PIPELINE"i ![a-zA-Z0-9_] { return 'PIPELINE'; }
  / "ESTIMATE"i ![a-zA-Z0-9_] { return 'ESTIMATE'; }

// ExplainSettingsList: comma-separated key=value pairs immediately after EXPLAIN [type], without the SETTINGS keyword
ExplainSettingsList
  = head:ExplainSettingItem tail:(_ "," _ ExplainSettingItem)* {
      return [head, ...tail.map((t) => t[3])];
    }

// ExplainSettingItem: key = value pair (must be followed by '=' to avoid consuming SELECT as a setting name)
ExplainSettingItem
  = name:SettingName _ "=" _ value:UnaryExpr {
      return { name, value };
    }

// FORMAT clause - specifies the output format
FormatClause
  = KW_FORMAT _ name:FormatName { return name; }

// Format name: an identifier or backtick-quoted identifier (e.g. FORMAT `Null`)
FormatName
  = chars:$([a-zA-Z_][a-zA-Z0-9_]*) { return chars; }
  / '`' chars:BacktickChar* '`' { return chars.join(''); }

// UnionQuery: UNION and EXCEPT at lowest precedence (left-assoc), INTERSECT at higher precedence.
// ClickHouse precedence: INTERSECT > EXCEPT = UNION (left-to-right).
// 1 EXCEPT 2 INTERSECT 3  →  1 EXCEPT (2 INTERSECT 3)
UnionQuery
  = head:IntersectQuery tail:( _ UnionExceptOp _ IntersectQuery )* {
      if (tail.length === 0) return head;
      let result = head;
      for (const t of tail) {
        const op = t[1];
        const right = addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])]);
        if (op === 'UNION') {
          // UNION ALL: flatten into existing union (if it's also ALL)
          if (result.kind === 'union' && !result.unionMode) {
            result = loc({ kind: 'union', queries: [...result.queries, right] });
          } else {
            result = loc({ kind: 'union', queries: [result, right] });
          }
        } else if (op === 'UNION DISTINCT') {
          // UNION DISTINCT: always create a new union node with mode
          result = loc({ kind: 'union', queries: [result, right], unionMode: 'DISTINCT' });
        } else {
          result = loc({ kind: 'intersect', op, left: result, right });
        }
      }
      return result;
    }

// IntersectQuery: INTERSECT at higher precedence than EXCEPT/UNION (left-assoc).
IntersectQuery
  = head:UnionQueryAtom tail:( _ IntersectOp _ UnionQueryAtom )* {
      if (tail.length === 0) return head;
      let result = head;
      for (const t of tail) {
        result = loc({ kind: 'intersect', op: 'INTERSECT', left: result, right: addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])]) });
      }
      return result;
    }

// UnionExceptOp: UNION [ALL|DISTINCT] or EXCEPT [ALL|DISTINCT]
UnionExceptOp
  = KW_UNION _ mode:UnionAllOrDistinct? { return mode === 'DISTINCT' ? 'UNION DISTINCT' : 'UNION'; }
  / "EXCEPT"i   ![a-zA-Z0-9_] ( _ UnionAllOrDistinct )? { return 'EXCEPT'; }

// IntersectOp: INTERSECT [ALL|DISTINCT]
IntersectOp
  = "INTERSECT"i ![a-zA-Z0-9_] ( _ UnionAllOrDistinct )? { return 'INTERSECT'; }

// UnionAllOrDistinct: supports UNION ALL and UNION DISTINCT
UnionAllOrDistinct
  = KW_ALL { return 'ALL'; }
  / "DISTINCT"i ![a-zA-Z0-9_] { return 'DISTINCT'; }
  / "EXCEPT"i   ![a-zA-Z0-9_] ( _ UnionAllOrDistinct )? { return 'EXCEPT'; }

// UnionQueryAtom: a single SELECT or EXPLAIN statement, optionally wrapped in parentheses
UnionQueryAtom
  = "(" beforeQuery:_ query:UnionQuery afterQuery:_ ")" {
      query = addSurroundingWs(query, beforeQuery, afterQuery);
      // Mark bare parenthesized selects so they can be wrapped in SelectWithUnionQuery
      // when they appear inside INTERSECT/EXCEPT or UNION DISTINCT
      if (query.kind === 'select') return { ...query, parenthesized: true };
      return query;
    }
  / ExplainStatement
  / SelectStatement

// SelectStatement: the core SELECT query rule with all optional clauses.
// Clause order follows ClickHouse syntax: WITH, SELECT, FROM, PREWHERE, WHERE, GROUP BY, HAVING,
// WINDOW, QUALIFY, ORDER BY, LIMIT BY, LIMIT, OFFSET, FETCH, SETTINGS.
// Some clauses can appear in multiple positions (WINDOW, QUALIFY, WITH TOTALS/CUBE/ROLLUP).
// e.g. SELECT a, b FROM t WHERE x > 1 GROUP BY a ORDER BY b LIMIT 10
// e.g. WITH cte AS (SELECT 1) SELECT * FROM cte
// e.g. SELECT TOP 5 WITH TIES * FROM t ORDER BY score DESC
SelectStatement
  = withClause:( CTEClause _ )?
    KW_SELECT selectComments:_ distinct:( DistinctClause _ )? top:( "TOP"i ![a-zA-Z0-9_] _ UnaryExpr _ ( KW_WITH _ "TIES"i ![a-zA-Z0-9_] _ )? )?
    select:SelectItemList selectTrailing:_HWS
    withModifier1:( _ WithModifierClause )?
    from:( _ FromClause )?
    prewhere:( _ PrewhereClause )?
    where:( _ WhereClause )?
    withModifier2:( _ WithModifierClause )?
    groupBy:( _ GroupByClause )?
    having:( _ HavingClause )?
    window1:( _ WindowClause )?
    qualify1:( _ QualifyClause )?
    orderBy:( _ OrderByClause )?
    limitBy:( _ LimitByClause )?
    limit:( _ LimitClause )?
    offset:( _ OffsetClause )?
    fetch:( _ FetchClause )?
    window2:( _ WindowClause )?
    qualify2:( _ QualifyClause )?
    settings:( _ SettingsClause )? {
      const result = loc({ kind: 'select' });
      let withTrailingComments = [];
      if (withClause !== null) {
        const wcd = withClause[0];
        result.with = wcd.items;
        const kwComments = flattenWs(wcd.keywordComments);
        if (kwComments.length > 0) result.leadingComments = kwComments;
        withTrailingComments = flattenWs(withClause[1]);
      }
      // Distinct clause
      const distVal = distinct !== null ? distinct[0] : null;
      if (distVal !== null && typeof distVal === 'object' && distVal.kind === 'distinctOn') {
        result.distinct = { kind: 'distinctOn', on: distVal.on };
      } else {
        const distStr = Array.isArray(distVal) ? distVal[0] : distVal;
        if (distStr !== null && distStr !== undefined && distStr.toString().toUpperCase() === 'DISTINCT') result.distinct = { kind: 'distinct' };
      }
      result.select = select;
      // selectTrailing: same-line comments after the last select item (from _HWS)
      const _selectTrailing = selectTrailing;
      if (from !== null) {
        result.from = from[1];
        const fromLeading = flattenWs(from[0]);
        if (fromLeading.length > 0) result.fromLeadingComments = fromLeading;
      }
      // Keep prewhere and where as separate fields for correct explain output
      if (prewhere !== null) result.prewhere = addWsLeading(prewhere[1], prewhere[0]);
      if (where !== null) result.where = addWsLeading(where[1], where[0]);
      // WITH TOTALS/CUBE/ROLLUP modifiers (can appear without GROUP BY)
      const wm = withModifier1 !== null ? withModifier1[1] : (withModifier2 !== null ? withModifier2[1] : null);
      if (wm !== null) {
        if (wm === 'TOTALS') result.withTotals = true;
        if (wm === 'ROLLUP') result.withRollup = true;
        if (wm === 'CUBE') result.withCube = true;
      }
      // GROUP BY clause (discriminated union)
      if (groupBy !== null) {
        const gb = groupBy[1];
        const gbc = flattenWs(groupBy[0]);
        if (gb.all) {
          result.groupBy = { kind: 'all' };
          if (gb.withTotals) result.withTotals = true;
          if (gb.withCube) result.withCube = true;
          if (gb.withRollup) result.withRollup = true;
        } else if (gb.groupingSets) {
          result.groupBy = { kind: 'groupingSets', sets: gb.groupingSets };
          if (gb.withTotals) result.withTotals = true;
        } else {
          // Attach pre-GROUP BY whitespace comments to first item
          let gbItems = gb.items;
          if (gbc.length > 0 && gbItems.length > 0) {
            gbItems = gbItems.slice();
            gbItems[0] = addLeading(gbItems[0], gbc);
          }
          result.groupBy = { kind: 'expressions', items: gbItems };
          if (gb.withTotals) result.withTotals = true;
          if (gb.withCube) result.withCube = true;
          if (gb.withRollup) result.withRollup = true;
        }
      }
      if (having !== null) result.having = addWsLeading(having[1], having[0]);
      if (orderBy !== null) {
        result.orderBy = orderBy[1];
      }
      // LIMIT BY clause
      if (limitBy !== null) {
        const lb = limitBy[1];
        result.limitBy = { count: lb.count, by: lb.by };
        if (lb.limitByOffset !== undefined) result.limitBy.offset = lb.limitByOffset;
      }
      // LIMIT clause
      if (limit !== null) {
        const lc = limit[1];
        const limitObj = { count: lc.count };
        if (lc.comma) { result.offset = lc.offset; limitObj.commaSyntax = true; }
        if (lc.withTies) limitObj.withTies = true;
        result.limit = limitObj;
      }
      // Standalone OFFSET clause
      if (offset !== null) result.offset = offset[1];
      // SQL standard FETCH NEXT n ROWS ONLY/WITH TIES — overrides limit count
      if (fetch !== null) {
        const fc = fetch[1];
        if (!result.limit) result.limit = {};
        result.limit.count = fc.count;
        if (fc.withTies) result.limit.withTies = true;
      }
      const windows = window1 !== null ? window1[1] : (window2 !== null ? window2[1] : null);
      if (windows !== null) result.windows = windows;
      const qualify = qualify1 !== null ? qualify1 : qualify2;
      if (qualify !== null) result.qualify = addWsLeading(qualify[1], qualify[0]);
      if (settings !== null) result.settings = settings[1];
      // SELECT TOP n — sets the limit (SQL Server compat syntax)
      if (top !== null && result.limit === undefined) result.limit = { count: top[3] };
      // Comments between WITH block/SELECT keyword and first item → leadingComments on first select item
      const selectCommentsFlat = [...withTrailingComments, ...flattenWs(selectComments)];
      if (selectCommentsFlat.length > 0 && result.select.length > 0) {
        result.select[0] = addLeading(result.select[0], selectCommentsFlat);
      }
      // Trailing same-line comment after the last select item:
      // If clauses follow, attach to the last select item (it will appear inline before the next clause).
      // If no clauses follow, store as statement-level trailingComments (Statements rule will merge).
      if (_selectTrailing.length > 0) {
        const hasFollowingClause = result.from || result.prewhere || result.where || result.groupBy
          || result.having || result.orderBy || result.limitBy || result.limit || result.offset
          || result.windows || result.qualify || result.settings;
        if (hasFollowingClause) {
          result.select[result.select.length - 1] = addTrailing(result.select[result.select.length - 1], _selectTrailing);
        } else {
          result.trailingComments = _selectTrailing;
        }
      }
      return result;
    }

// DistinctClause: DISTINCT [ON (cols)] or ALL
// DISTINCT ON (cols) is a PostgreSQL-style DISTINCT ON extension supported by ClickHouse.
DistinctClause
  = KW_DISTINCT _ "ON"i ![a-zA-Z0-9_] _ "(" _ cols:ExpressionList _ ")" {
      return { kind: 'distinctOn', on: cols };
    }
  / KW_DISTINCT { return 'DISTINCT'; }
  / KW_ALL { return 'ALL'; }

// ── Clauses ──────────────────────────────────────────────────────────────────

CTEClause
  = KW_WITH wc:_ "RECURSIVE"i ![a-zA-Z0-9_] _ items:CTEItemList { return { items: items, keywordComments: wc }; }
  / KW_WITH wc:_ items:CTEItemList { return { items: items, keywordComments: wc }; }

CTEItemList
  = head:CTEItem tail:(_ "," _ CTEItem)* lastWs:_HWS {
      const items = buildCommaList(head, tail);
      if (lastWs.length > 0) {
        items[items.length - 1] = addTrailing(items[items.length - 1], lastWs);
      }
      return items;
    }

CTEItem
// Subquery CTE: name AS (SELECT ...)
  = name:Identifier _ KW_AS _ "(" beforeQuery:_ query:UnionQuery afterQuery:_ ")" {
      return { kind: 'cteSubquery', name, query: addSurroundingWs(query, beforeQuery, afterQuery) };
    }
  // Expression CTE: expr AS name (ClickHouse extension)
  / expr:TernaryExpr afterExpr:_ KW_AS _ name:Identifier {
      return { kind: 'cteExpr', name, expr: addTrailing(expr, flattenWs(afterExpr)) };
    }

// SelectItemList: supports optional trailing comma (ClickHouse extension).
// The !SelectClauseKeyword guard prevents clause-starting keywords (FROM, WHERE, etc.)
// from being consumed as select items via the last-resort AliasName rule.
SelectItemList
  = head:SelectItem tail:(_ "," _ !SelectClauseKeyword SelectItem)* (_ "," _)? {
      return buildCommaList(head, tail, 4);
    }

// SelectClauseKeyword: keywords that start SELECT sub-clauses (used as negative lookahead
// in SelectItemList to prevent consuming them as select items after a trailing comma)
// SelectClauseKeyword: strong clause-starting keywords that cannot be column names.
// Note: SETTINGS, FORMAT, QUALIFY, EXCEPT, WINDOW are omitted since they can appear as column names.
SelectClauseKeyword
  = ("FROM"i / "WHERE"i / "PREWHERE"i / "GROUP"i / "HAVING"i / "ORDER"i / "LIMIT"i
  / "OFFSET"i / "UNION"i / "INTERSECT"i / "INTO"i / "FETCH"i) ![a-zA-Z0-9_]

SelectItem
  = expr:TernaryExpr alias:SelectItemAlias? {
      if (alias !== null) {
        // Unwrap auto-alias from @@varname when an explicit alias is provided
        const inner = (expr.kind === 'alias' && typeof expr.alias === 'string' && expr.alias.charAt(0) === '@') ? expr.expr : expr;
        return loc({ kind: 'alias', expr: inner, alias });
      }
      return expr;
    }

SelectItemAlias
  = _ KW_AS _ alias:AliasName { return alias; }
  / _ !KW_FORMAT !("PARALLEL"i ![a-zA-Z0-9_] _ "WITH"i ![a-zA-Z0-9_]) alias:Identifier { return alias; }

FromClause
  = KW_FROM comments:_ expr:JoinExpr { return addWsLeading(expr, comments); }

JoinExpr
  = head:FromAtom tail:( _ JoinPart )* {
      return tail.reduce((acc, t) => ({ left: acc, ...t[1] }), head);
    }

// FromAtom: a single table source — subquery, table function, or table reference.
// Each can have an optional alias, FINAL modifier (for ReplacingMergeTree dedup), and SAMPLE clause.
// e.g. (SELECT 1) AS t, numbers(10), system.one FINAL, my_table SAMPLE 0.1
FromAtom
  = "(" beforeQuery:_ query:UnionQuery afterQuery:_ ")" alias:FromAtomAlias? final:( _ KW_FINAL )? sample:( _ SampleClause )? {
      const result = loc({ kind: 'subqueryFrom', query: addSurroundingWs(query, beforeQuery, afterQuery) });
      if (final !== null) result.final = true;
      if (sample !== null) result.sample = sample[1];
      if (alias !== null) {
        if (typeof alias === 'object') {
          if (alias.alias !== undefined) result.alias = alias.alias;
          if (alias.columnAliases !== undefined) result.columnAliases = alias.columnAliases;
        } else {
          result.alias = alias;
        }
      }
      return result;
    }
  / table:TableFunctionRef alias:FromAtomAlias? final:( _ KW_FINAL )? sample:( _ SampleClause )? {
      let result = final !== null ? { ...table, final: true } : table;
      if (sample !== null) result = { ...result, sample: sample[1] };
      if (alias !== null) result = { ...result, alias: typeof alias === 'object' ? alias.alias : alias };
      return result;
    }
  / table:TableRef alias:FromAtomAlias? final:( _ KW_FINAL )? sample:( _ SampleClause )? {
      let result = final !== null ? { ...table, final: true } : table;
      if (sample !== null) result = { ...result, sample: sample[1] };
      if (alias !== null) result = { ...result, alias: typeof alias === 'object' ? alias.alias : alias };
      return result;
    }

// SampleClause: SAMPLE ratio [OFFSET ratio]
// Supports integer (e.g., SAMPLE 100), float (e.g., SAMPLE 0.1), and fraction (e.g., SAMPLE 1/10) forms,
// with an optional OFFSET ratio for sharding.
SampleClause
  = "SAMPLE"i ![a-zA-Z0-9_] _ ratio:SampleRatioExpr offset:( _ "OFFSET"i ![a-zA-Z0-9_] _ SampleRatioExpr )? {
      const result = { ratio };
      if (offset !== null) result.offset = offset[4];
      return result;
    }

// SampleRatioExpr: a ratio value, either a fraction (num/den) or a simple number
SampleRatioExpr
  = num:SampleNumber _ "/" _ den:SampleNumber { return { num, den }; }
  / num:SampleNumber { return { num }; }

// SampleNumber: a non-negative integer or float literal (no leading sign)
SampleNumber
  = digits:$([0-9][0-9_]*) "." frac:$([0-9_]*)? exp:SampleExponent? {
      return digits.replace(/_/g, '') + '.' + (frac !== null ? frac.replace(/_/g, '') : '') + (exp !== null ? exp : '');
    }
  / "." digits:$([0-9_]+) exp:SampleExponent? {
      return '.' + digits.replace(/_/g, '') + (exp !== null ? exp : '');
    }
  / digits:$([0-9][0-9_]*) exp:SampleExponent {
      return digits.replace(/_/g, '') + exp;
    }
  / digits:$([0-9][0-9_]*) { return digits.replace(/_/g, ''); }

SampleExponent
  = e:$[eE] sign:$[+-]? digits:$[0-9]+ { return e + (sign !== null ? sign : '') + digits; }

// Alias for FROM atoms. Without AS keyword, we exclude join-starting keywords
// to prevent them from being consumed as aliases (e.g., "... ) ANY LEFT JOIN")
// Also exclude FORMAT so it isn't consumed as an alias (FORMAT is not in Keyword to allow use as table function).
// Optional column alias list after the table alias: AS x (a, b) — standard SQL subquery column aliases.
FromAtomAlias
  = _ KW_AS _ alias:AliasName cols:( _ "(" _ head:AliasName tail:( _ "," _ AliasName )* _ ")" { return [head, ...tail.map((t) => t[3])]; } )? {
      return cols !== null ? { alias, columnAliases: cols } : alias;
    }
  // Column aliases without table alias: (n1, n2) or (n1) — standard SQL subquery column aliases
  / _ "(" _ !( KW_SELECT / KW_WITH / "EXPLAIN"i ![a-zA-Z0-9_] ) head:AliasName tail:( _ "," _ AliasName )* _ ")" {
      return { columnAliases: [head, ...tail.map((t) => t[3])] };
    }
  / _ !JoinKeyword !ArrayJoinKeyword !KW_FORMAT !("PARALLEL"i ![a-zA-Z0-9_] _ "WITH"i ![a-zA-Z0-9_]) alias:Identifier { return alias; }

TableFunctionRef
  = name:FunctionName _ "(" _ args:TableFunctionArgList? settings:( ( _ "," )? _ KW_SETTINGS _ SettingsList )? _ ")" {
      const result = loc({ kind: 'tableFunctionRef', name, args: args !== null ? args : [] });
      if (settings !== null) result.settings = settings[4];
      return result;
    }

// TableFunctionArgList: like FunctionCallArgList but stops before a trailing ", SETTINGS ..."
TableFunctionArgList
  = head:FunctionCallArgGuarded tail:(_ "," _ FunctionCallArgGuarded)* {
      return buildCommaList(head, tail);
    }

JoinPart
  = join_type:ArrayJoinKeyword exprs:( _ ExpressionList )? {
      return loc({ kind: 'arrayJoinExpr', joinType: join_type, expressions: exprs ? exprs[1] : [] });
    }
  / join_type:JoinKeyword _ right:FromAtom _ constraint:JoinConstraint {
      return loc({ kind: 'joinExpr', joinType: join_type, right, constraint });
    }
  / join_type:JoinKeyword _ right:FromAtom {
      return loc({ kind: 'joinExpr', joinType: join_type, right });
    }
  // Comma-separated tables: implicit CROSS JOIN without constraint
  / "," _ right:FromAtom {
      return loc({ kind: 'joinExpr', joinType: 'CROSS', right });
    }

// JoinKeyword: [GLOBAL] [strictness] [direction] [OUTER] JOIN — returns direction string.
// Structured as optional qualifiers to avoid ~80 brute-force alternatives.
JoinKeyword
  // PASTE JOIN (special case): [ANY|ALL] PASTE JOIN
  = (KW_ANY / KW_ALL)? _ "PASTE"i ![a-zA-Z0-9_] _ KW_JOIN { return "PASTE"; }
  // Standard joins: [GLOBAL] [strictness-before] [direction] [strictness-after] [OUTER] JOIN
  / (KW_GLOBAL _)?
    (JoinStrictness _)?
    dir:(
      KW_CROSS { return "CROSS"; }
      / KW_FULL { return "FULL"; }
      / KW_LEFT { return "LEFT"; }
      / KW_RIGHT { return "RIGHT"; }
      / KW_INNER { return "INNER"; }
    )?
    // Handle strictness/qualifier after direction: LEFT ANY JOIN, LEFT ASOF JOIN, etc.
    (_ JoinStrictness)?
    (_ KW_OUTER)?
    _ KW_JOIN { return dir !== null ? dir : "INNER"; }

// JoinStrictness: any/all/semi/anti/asof qualifier (consumed but not used in AST)
JoinStrictness = KW_ANY / KW_ALL / KW_SEMI / KW_ANTI / KW_ASOF

ArrayJoinKeyword
  = KW_LEFT _ KW_ARRAY _ KW_JOIN { return "LEFT ARRAY"; }
  / KW_ARRAY _ KW_JOIN { return "ARRAY"; }

// JoinConstraint: ON expr, USING (cols), USING cols (no parens, one or more)
// USING () with empty list is valid in ClickHouse (treated as a full cross join with renaming)
// USING also supports aliased columns: USING (a AS b) — the alias is discarded for AST purposes
JoinConstraint
  = KW_ON comments:_ expr:Expression { return { kind: 'on', expr: addWsLeading(expr, comments) }; }
  / KW_USING _ "(" _ cols:UsingColumnList? _ ")" { return { kind: 'using', columns: cols !== null ? cols : [] }; }
  // USING * — wildcard join key (ClickHouse extension)
  / KW_USING _ "*" { return { kind: 'using', columns: ['*'] }; }
  / KW_USING _ cols:IdentifierList { return { kind: 'using', columns: cols }; }

// UsingColumnList: comma-separated identifiers with optional AS alias (alias is discarded)
UsingColumnList
  = head:UsingColumn tail:( _ "," _ UsingColumn )* {
      return [head, ...tail.map((t) => t[3])];
    }

UsingColumn
  = name:Identifier _ KW_AS _ alias:AliasName { return { name, alias }; }
  / name:Identifier { return name; }

IdentifierList
  = head:Identifier tail:( _ "," _ Identifier )* {
      return [head, ...tail.map((t) => t[3])];
    }

// PrewhereClause: PREWHERE expr (treated same as WHERE for AST purposes)
PrewhereClause
  = KW_PREWHERE comments:_ expr:Expression { return addWsLeading(expr, comments); }

WhereClause
  = KW_WHERE comments:_ expr:Expression { return addWsLeading(expr, comments); }

GroupByClause
  = KW_GROUP _ KW_BY _ KW_ALL modifiers:GroupByModifier* {
      const withTotals = modifiers.some((m) => m === 'TOTALS');
      const withCube = modifiers.some((m) => m === 'CUBE');
      const withRollup = modifiers.some((m) => m === 'ROLLUP');
      return { all: true, withTotals, withCube, withRollup };
    }
  / KW_GROUP _ KW_BY _ "GROUPING"i ![a-zA-Z0-9_] _ "SETS"i ![a-zA-Z0-9_] _ "(" _ sets:GroupingSets _ ")" modifiers:GroupByModifier* {
      const withTotals = modifiers.some((m) => m === 'TOTALS');
      return { groupingSets: sets, withTotals };
    }
  / KW_GROUP _ KW_BY keywordComments:_ exprList:ExpressionList modifiers:GroupByModifier* {
      const withTotals = modifiers.some((m) => m === 'TOTALS');
      const withCube = modifiers.some((m) => m === 'CUBE');
      const withRollup = modifiers.some((m) => m === 'ROLLUP');
      // Attach keyword comments as leadingComments on the first item
      const items = exprList;
      const kc = flattenWs(keywordComments);
      if (kc.length > 0 && items.length > 0) {
        items[0] = addLeading(items[0], kc);
      }
      return { items, withTotals, withCube, withRollup };
    }

// GroupingSets: comma-separated list of grouping sets (each set is a parenthesized list or bare expr)
GroupingSets
  = head:GroupingSet tail:(_ "," _ GroupingSet)* {
      return [head, ...tail.map((t) => t[3])];
    }

// GroupingSet: either a parenthesized list of expressions or a single bare expression
GroupingSet
  = "(" _ items:ExpressionList _ ")" { return items; }
  / "(" _ ")" { return []; }
  / expr:TernaryExpr { return [expr]; }

// GroupByModifier: WITH ROLLUP, WITH CUBE, or WITH TOTALS
GroupByModifier
  = _ KW_WITH _ KW_TOTALS { return 'TOTALS'; }
  / _ KW_WITH _ "ROLLUP"i ![a-zA-Z0-9_] { return 'ROLLUP'; }
  / _ KW_WITH _ "CUBE"i ![a-zA-Z0-9_] { return 'CUBE'; }

// WithModifierClause: standalone WITH TOTALS/ROLLUP/CUBE (can appear after SELECT list without GROUP BY)
WithModifierClause
  = KW_WITH _ KW_TOTALS { return 'TOTALS'; }
  / KW_WITH _ "ROLLUP"i ![a-zA-Z0-9_] { return 'ROLLUP'; }
  / KW_WITH _ "CUBE"i   ![a-zA-Z0-9_] { return 'CUBE'; }

HavingClause
  = KW_HAVING comments:_ expr:Expression { return addWsLeading(expr, comments); }

// QualifyClause: QUALIFY expr — filters rows after window functions, analogous to HAVING for aggregations
QualifyClause
  = "QUALIFY"i ![a-zA-Z0-9_] comments:_ expr:Expression { return addWsLeading(expr, comments); }

OrderByClause
  = KW_ORDER _ KW_BY _ items:OrderByItemList { return items; }

// LimitByClause: LIMIT [offset,] count BY expr_list or LIMIT count OFFSET offset BY expr_list
// LIMIT n BY ALL means no per-column limit — store an empty by list.
LimitByClause
  = KW_LIMIT _ count:TernaryExpr _ KW_BY _ KW_ALL { return { count: count, by: [] }; }
  / KW_LIMIT _ offset:TernaryExpr _ "," _ count:TernaryExpr _ KW_BY _ KW_ALL {
      return { count: count, by: [], limitByOffset: offset };
    }
  / KW_LIMIT _ count:TernaryExpr _ KW_OFFSET _ offset:TernaryExpr _ KW_BY _ KW_ALL {
      return { count: count, by: [], limitByOffset: offset };
    }
  / KW_LIMIT _ offset:TernaryExpr _ "," _ count:TernaryExpr _ KW_BY _ by:ExpressionList {
      return { count: count, by: by, limitByOffset: offset };
    }
  / KW_LIMIT _ count:TernaryExpr _ KW_OFFSET _ offset:TernaryExpr _ KW_BY _ by:ExpressionList {
      return { count: count, by: by, limitByOffset: offset };
    }
  / KW_LIMIT _ count:TernaryExpr _ KW_BY _ by:ExpressionList {
      return { count: count, by: by };
    }

// LimitClause: LIMIT count [WITH TIES] or LIMIT count, offset [WITH TIES]
// The comma syntax (LIMIT count, offset) is a ClickHouse extension where count comes first.
// WITH TIES returns additional rows that tie with the last row in ORDER BY.
// e.g. LIMIT 10, LIMIT 10 WITH TIES, LIMIT 5, 10 (5 rows starting at offset 10)
LimitClause
  = KW_LIMIT _ count:TernaryExpr _ "," _ offset:TernaryExpr _ KW_WITH _ "TIES"i ![a-zA-Z0-9_] { return { count: count, offset: offset, comma: true, withTies: true }; }
  / KW_LIMIT _ count:TernaryExpr _ "," _ offset:TernaryExpr { return { count: count, offset: offset, comma: true }; }
  / KW_LIMIT _ count:TernaryExpr _ KW_WITH _ "TIES"i ![a-zA-Z0-9_] { return { count: count, comma: false, withTies: true }; }
  / KW_LIMIT _ count:TernaryExpr { return { count: count, comma: false }; }

// OffsetClause: OFFSET n [ROW[S]] — SQL standard allows ROWS/ROW keyword after offset value
OffsetClause
  = KW_OFFSET _ count:TernaryExpr ( _ ( "ROWS"i / "ROW"i ) ![a-zA-Z0-9_] )? { return count; }

// FetchClause: FETCH {FIRST|NEXT} n {ROW[S]|ROW} {ONLY|WITH TIES} — SQL standard pagination
FetchClause
  = "FETCH"i ![a-zA-Z0-9_] _ ( "FIRST"i / "NEXT"i ) ![a-zA-Z0-9_] _ count:TernaryExpr _ ( "ROWS"i / "ROW"i ) ![a-zA-Z0-9_] _ ties:( "ONLY"i / KW_WITH _ "TIES"i ) ![a-zA-Z0-9_] {
      return { count: count, withTies: typeof ties === 'string' ? false : true };
    }

SettingsClause
  = KW_SETTINGS _ items:SettingsList { return items; }

// WindowClause: WINDOW name AS (...) [, name AS (...)] - named window definitions
WindowClause
  = KW_WINDOW _ items:WindowItemList { return items; }

WindowItemList
  = head:WindowItem tail:(_ "," _ WindowItem)* {
      return [head, ...tail.map((t) => t[3])];
    }

// WindowItem: name AS (window_spec) - single named window definition
// The spec may optionally start with a base window identifier (window inheritance).
WindowItem
  = name:Identifier _ KW_AS _ "(" _ baseWindow:Identifier _ spec:WindowSpec _ ")" {
      spec.baseWindow = baseWindow;
      return { name, spec };
    }
  / name:Identifier _ KW_AS _ "(" _ spec:WindowSpec _ ")" {
      return { name, spec };
    }

SettingsList
  = head:SettingItem tail:(_ "," _ SettingItem)* {
      return [head, ...tail.map((t) => t[3])];
    }

// SettingName allows any identifier including reserved keywords (e.g. SETTINGS limit=5)
// Also supports compound names like custom_compound.identifier.v1 and param_$1
SettingName
  = head:[a-zA-Z_] tail:[a-zA-Z0-9_$.]* { return head + tail.join(''); }
  / '"' chars:DoubleQuotedChar* '"' { return chars.join(''); }
  / '`' chars:BacktickChar* '`' { return chars.join(''); }

SettingItem
  = name:SettingName _ "=" _ value:UnaryExpr forResource:( _ "FOR"i ![a-zA-Z0-9_] _ AliasName )? {
      const result = { name, value };
      if (forResource !== null) result.forResource = forResource[3];
      return result;
    }
  // Bare setting name without value (e.g. SETTINGS force_index_by_date) — treated as = 1
  / name:SettingName {
      return { name, value: loc({ kind: 'literal', type: 'UInt64', value: '1' }) };
    }

// ── ORDER BY items ────────────────────────────────────────────────────────────

OrderByItemList
  = head:OrderByItem tail:(_ "," _ OrderByItem)* {
      return [head, ...tail.map((t) => t[3])];
    }

// OrderByItem: expr [AS alias] [ASC|DESC] [NULLS FIRST|LAST] [COLLATE 'locale'] [WITH FILL [FROM a] [TO b] [STEP n]]
// The optional AS alias creates an alias expression (e.g. ORDER BY f(x) AS y DESC).
OrderByItem
  = expr:TernaryExpr
    alias:( _ KW_AS _ AliasName )?
    dir:( _ ( KW_DESC / KW_ASC ) )?
    nulls:( _ "NULLS"i ![a-zA-Z0-9_] _ ( "FIRST"i / "LAST"i ) ![a-zA-Z0-9_] )?
    collate:( _ "COLLATE"i ![a-zA-Z0-9_] _ StringLiteral )?
    fill:( _ "WITH"i ![a-zA-Z0-9_] _ "FILL"i ![a-zA-Z0-9_] fillArgs:WithFillArgs? )?
    {
      const resolvedExpr = alias !== null ? loc({ kind: 'alias', expr, alias: alias[3] }) : expr;
      const result = loc({ kind: 'orderByItem', expr: resolvedExpr, direction: dir !== null ? dir[1].toUpperCase() : 'ASC' });
      if (collate !== null) result.collate = collate[4].value;
      if (fill !== null) {
        const fillArgs = fill[6];
        if (fillArgs !== null) {
          if (fillArgs.fillFrom !== undefined) result.fillFrom = fillArgs.fillFrom;
          if (fillArgs.fillTo !== undefined) result.fillTo = fillArgs.fillTo;
          if (fillArgs.fillStep !== undefined) result.fillStep = fillArgs.fillStep;
          if (fillArgs.fillStaleness !== undefined) result.fillStaleness = fillArgs.fillStaleness;
          if (fillArgs.interpolate !== undefined) result.interpolate = fillArgs.interpolate;
        }
      }
      return result;
    }

// WITH FILL optional sub-clauses: FROM expr TO expr STEP expr STALENESS expr [INTERPOLATE (...)]
WithFillArgs
  = from:( _ "FROM"i ![a-zA-Z0-9_] _ TernaryExpr )?
    to:( _ "TO"i ![a-zA-Z0-9_] _ TernaryExpr )?
    step:( _ "STEP"i ![a-zA-Z0-9_] _ TernaryExpr )?
    staleness:( _ "STALENESS"i ![a-zA-Z0-9_] _ TernaryExpr )?
    interp:( _ "INTERPOLATE"i ![a-zA-Z0-9_] _ "(" _ InterpolateList _ ")" )? {
      const result = {};
      if (from !== null && from[4] !== null) result.fillFrom = from[4];
      if (to !== null && to[4] !== null) result.fillTo = to[4];
      if (step !== null && step[4] !== null) result.fillStep = step[4];
      if (staleness !== null && staleness[4] !== null) result.fillStaleness = staleness[4];
      if (interp !== null) result.interpolate = interp[6];
      return result;
    }

// InterpolateList: list of column [AS expr] items inside INTERPOLATE (...)
InterpolateList
  = head:InterpolateItem tail:( _ "," _ InterpolateItem )* { return [head, ...tail.map((t) => t[3])]; }
  / _ { return []; }

InterpolateItem
  = col:Identifier _ KW_AS _ expr:Expression { return { col: col, expr: expr }; }
  / col:Identifier { return { col: col }; }

// ── Expressions (precedence: ternary < OR < AND < comparison < add < mul < unary < primary) ────

ExpressionList
  = head:Expression tail:(_ "," _ Expression)* { return buildCommaList(head, tail); }

// Expression: alias form or ternary expression
Expression
  = expr:TernaryExpr asWs:_ KW_AS _ alias:AliasName {
      // Unwrap auto-alias (e.g. @@varname) if an explicit AS alias is provided
      const inner = (expr.kind === 'alias' && typeof expr.alias === 'string' && expr.alias.charAt(0) === '@') ? expr.expr : expr;
      return loc({ kind: 'alias', expr: addTrailing(inner, flattenWs(asWs)), alias });
    }
  / TernaryExpr

// ExpressionWithImplicitAlias: like Expression but also supports bare alias without AS keyword
// (ClickHouse extension). Used in function call args and special function syntax (SUBSTRING, TRIM, etc.)
// The implicit alias must be followed by a delimiter (, ) FROM FOR) to avoid ambiguity.
ExpressionWithImplicitAlias
  = expr:TernaryExpr asWs:_ KW_AS _ alias:AliasName {
      const inner = (expr.kind === 'alias' && typeof expr.alias === 'string' && expr.alias.charAt(0) === '@') ? expr.expr : expr;
      return loc({ kind: 'alias', expr: addTrailing(inner, flattenWs(asWs)), alias });
    }
  // Bare alias without AS: must be followed by , ) FROM FOR (as delimiter of the argument context)
  / expr:TernaryExpr aliasWs:_ alias:Identifier &( _ ( "," / ")" / "FROM"i ![a-zA-Z0-9_] / "FOR"i ![a-zA-Z0-9_] ) ) {
      return loc({ kind: 'alias', expr: addTrailing(expr, flattenWs(aliasWs)), alias });
    }
  / TernaryExpr

// TernaryExpr: ternary ? : operator, maps to Function if(cond, then, else)
TernaryExpr
  = cond:OrExpr ws1:_ "?" ws2:_ then:TernaryExpr ws3:_ ":" ws4:_ else_:TernaryExpr {
      return loc({ kind: 'functionCall', name: 'if', args: [
        cond,
        addLeading(then, [...flattenWs(ws1), ...flattenWs(ws2)]),
        addLeading(else_, [...flattenWs(ws3), ...flattenWs(ws4)])
      ] });
    }
  / OrExpr

// OrExpr: n-ary OR expression. Multiple OR operands at the same level are collected
// into a flat list, matching ClickHouse's EXPLAIN AST behavior. Parenthesized sub-expressions
// remain as separate nodes.
OrExpr
  = head:AndExpr tail:(_ KW_OR _ AndExpr)+ {
      const operands = [head, ...tail.map((t) => addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])]))];
      return loc({ kind: 'naryExpr', op: 'OR', operands });
    }
  / AndExpr

// AndExpr: n-ary AND expression. Multiple AND operands at the same level are collected
// into a flat list, matching ClickHouse's EXPLAIN AST behavior.
AndExpr
  = head:NotExpr tail:(_ KW_AND _ NotExpr)+ {
      const operands = [head, ...tail.map((t) => addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])]))];
      return loc({ kind: 'naryExpr', op: 'AND', operands });
    }
  / NotExpr

NotExpr
  // NOT followed by "(" is handled as a high-precedence function-call-like NOT in PrimaryBase;
  // exclude that case here so NOT (0) + NOT (0) parses as plus(not(0), not(0)) like ClickHouse does.
  = KW_NOT !( _ "(" ) comments:_ expr:NotExpr {
      return loc({ kind: 'unaryExpr', op: 'NOT', expr: addWsLeading(expr, comments) });
    }
  / CompareExpr

// CompareExpr: handles IN, LIKE, IS, BETWEEN, and comparison operators.
// IN/LIKE/IS/BETWEEN results can optionally be followed by a comparison operator (e.g. k IN (100) = 1).
// CompareExpr: left-associative chain of comparison operators.
// Uses CompareRightExpr (not NotExpr) to avoid right-associativity — the right operand must not
// start a new comparison chain. E.g. k = (100) = 1 → equals(equals(k,100), 1).
CompareExpr
  = base:CompareBase rest:(_ op:CompareOp _ CompareRightExpr)* {
      return rest.reduce((acc, t) => (loc({
        kind: 'binaryExpr', op: t[1], left: acc,
        right: addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])])
      })), base);
    }

// CompareBase: parse AddExpr once, then branch on comparison/IN/LIKE/BETWEEN suffix.
// Left-factored to avoid re-entering AddExpr for each alternative.
CompareBase
  = left:AddExpr suffix:CompareBaseSuffix? {
      if (suffix === null) return left;
      return suffix(left);
    }

// CompareBaseSuffix: the operator part after AddExpr in a comparison expression.
// Returns a function that takes the left AddExpr and produces the full expression.
CompareBaseSuffix
  // IN variants: [GLOBAL] [NOT] IN (array / parens / bare)
  = _ global:(KW_GLOBAL _)? negated:(KW_NOT _)? KW_IN _ target:InTarget {
      return (left) => {
        const result = loc({ kind: 'inExpr', negated: negated !== null, expr: left, ...target });
        if (global !== null) result.global = true;
        return result;
      };
    }
  // LIKE / ILIKE
  / _ negated:(KW_NOT _)? KW_ILIKE _ right:AddExpr {
      const name = negated !== null ? 'notILike' : 'ilike';
      return (left) => (loc({ kind: 'functionCall', name, args: [left, right] }));
    }
  / _ negated:(KW_NOT _)? KW_LIKE _ right:AddExpr {
      const name = negated !== null ? 'notLike' : 'like';
      return (left) => (loc({ kind: 'functionCall', name, args: [left, right] }));
    }
  // REGEXP
  / _ "REGEXP"i ![a-zA-Z0-9_] _ right:AddExpr {
      return (left) => (loc({ kind: 'functionCall', name: 'match', args: [left, right] }));
    }
  // BETWEEN
  / _ KW_NOT _ KW_BETWEEN _ low:AddExpr _ KW_AND _ high:AddExpr {
      return (left) => (loc({
        kind: 'functionCall', name: 'or', args: [
          loc({ kind: 'functionCall', name: 'less', args: [left, low] }),
          loc({ kind: 'functionCall', name: 'greater', args: [left, high] })
        ]
      }));
    }
  / _ KW_BETWEEN _ low:AddExpr _ KW_AND _ high:AddExpr {
      return (left) => (loc({
        kind: 'functionCall', name: 'and', args: [
          loc({ kind: 'functionCall', name: 'greaterOrEquals', args: [left, low] }),
          loc({ kind: 'functionCall', name: 'lessOrEquals', args: [left, high] })
        ]
      }));
    }
  // IS [NOT] DISTINCT FROM / IS [NOT] NULL
  / _ "IS"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "DISTINCT"i ![a-zA-Z0-9_] _ "FROM"i ![a-zA-Z0-9_] _ right:AddExpr {
      return (left) => (loc({ kind: 'binaryExpr', op: '<=>', left, right }));
    }
  / _ "IS"i ![a-zA-Z0-9_] _ "DISTINCT"i ![a-zA-Z0-9_] _ "FROM"i ![a-zA-Z0-9_] _ right:AddExpr {
      return (left) => (loc({ kind: 'binaryExpr', op: 'IS DISTINCT FROM', left, right }));
    }
  // IS [NOT] NULL with optional arithmetic continuation: "x IS NOT NULL + 1" parses as plus(isNotNull(x), 1).
  // The arith tail allows arithmetic ops to bind tighter than comparison, matching ClickHouse precedence.
  / _ "IS"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] arith:( _ op:AddOp _ right:NotPrefixExpr )* {
      return (left) => {
        const base = loc({ kind: 'functionCall', name: 'isNotNull', args: [left] });
        return arith.reduce((acc, t) => (loc({ kind: 'binaryExpr', op: t[1], left: acc, right: t[3] })), base);
      };
    }
  / _ "IS"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] arith:( _ op:AddOp _ right:NotPrefixExpr )* {
      return (left) => {
        const base = loc({ kind: 'functionCall', name: 'isNull', args: [left] });
        return arith.reduce((acc, t) => (loc({ kind: 'binaryExpr', op: t[1], left: acc, right: t[3] })), base);
      };
    }

// InTarget: the target expression for IN — array literal, parenthesized list, or bare expression
InTarget
  = arr:ArrayLiteral { return { values: [arr] }; }
  / "(" beforeValues:_ values:InValues afterValues:_ ")" {
      // Attach comments to first/last value if they are expression nodes
      if (Array.isArray(values)) {
        const bv = flattenWs(beforeValues);
        const av = flattenWs(afterValues);
        if ((bv.length > 0 || av.length > 0) && values.length > 0) {
          values = values.slice();
          values[0] = addLeading(values[0], bv);
          values[values.length - 1] = addTrailing(values[values.length - 1], av);
        }
      } else if (values && values.kind === 'subqueryExpr') {
        values = addSurroundingWs(values, beforeValues, afterValues);
      }
      return { values };
    }
  / single:PrimaryExpr { return { values: [single] }; }

CompareOp = "<=>" / ">=" / "<=" / "<>" / "!=" / "==" / ">" / "<" / "="

// CompareRightExpr: right-hand side of a comparison operator.
// Includes AddExpr (arithmetic) and boolean NOT prefix, but NOT comparison operators.
// This ensures comparisons are left-associative: k = (100) = 1 → equals(equals(k,100), 1).
// Allows: 1 != NOT 1, k = x + y, k > -5. Does not allow: k = (a = b) unless in parens.
CompareRightExpr
  = KW_NOT _ expr:CompareRightExpr { return loc({ kind: 'unaryExpr', op: 'NOT', expr: expr }); }
  / left:AddExpr suffix:CompareBaseSuffix? {
      if (suffix === null) return left;
      return suffix(left);
    }

InValues
  = query:UnionQuery { return loc({ kind: 'subqueryExpr', query: query }); }
  / ExpressionList

// ── Arithmetic expressions ────────────────────────────────────────────────────

// AddExpr: +/- operators; right side allows NotPrefixExpr so NOT can appear as a right operand
// (e.g. NOT 0 + NOT 0 = NOT(0 + NOT(0)), consistent with ClickHouse precedence rules)
AddExpr
  = head:ConcatExpr tail:(_ op:AddOp _ right:NotPrefixExpr)* {
      return tail.reduce((acc, t) => (loc({
        kind: 'binaryExpr', op: t[1], left: acc,
        right: addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])])
      })), head);
    }

// NotPrefixExpr: allows NOT as a prefix, but only wrapping arithmetic-level expressions (no comparison).
// Used as right-hand side of + and - so that NOT has lower precedence than arithmetic operators.
NotPrefixExpr
  = KW_NOT _ expr:NotPrefixExpr { return loc({ kind: 'unaryExpr', op: 'NOT', expr: expr }); }
  / ConcatExpr

AddOp
  = "+"
  / "-" !">" { return "-"; }
  / "\u2212" { return "-"; }  // Unicode MINUS SIGN (U+2212), used in some ClickHouse SQL files

// ConcatExpr handles the || string concatenation operator, producing a flat concat() call
ConcatExpr
  = head:MulExpr tail:(_ "||" _ MulExpr)* {
      if (tail.length === 0) return head;
      const parts = [head, ...tail.map((t) => addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])]))];
      return loc({ kind: 'functionCall', name: 'concat', args: parts });
    }

MulExpr
  = head:UnaryExpr tail:(_ op:MulOp _ right:UnaryExpr)* {
      return tail.reduce((acc, t) => (loc({
        kind: 'binaryExpr', op: t[1], left: acc,
        right: addLeading(t[3], [...flattenWs(t[0]), ...flattenWs(t[2])])
      })), head);
    }

// MulOp: multiplication-level binary operators including keyword variants DIV and MOD
MulOp
  = $[*/%]
  / "DIV"i ![a-zA-Z0-9_] { return 'DIV'; }
  / "MOD"i ![a-zA-Z0-9_] { return 'MOD'; }

// UnaryExpr: unary minus and plus — minus negates, plus is identity.
// Recurses to support double-negative (e.g. - -1).
// Literal folding: -5 becomes Int64(-5) rather than negate(UInt64(5)), matching ClickHouse EXPLAIN behavior.
// For :: cast chains (e.g. -1::Int32::String), the minus is folded into the innermost literal
// by walking down the cast chain to avoid wrapping the whole expression in negate().
// Falls back to negate(expr) for non-literal or already-negative expressions.
UnaryExpr
  = "+" _ expr:UnaryExpr { return expr; }
  / ("-" / "\u2212") _ expr:UnaryExpr {
      if (expr.kind === 'literal' && expr.type === 'UInt64') {
        // Negate a non-negative integer literal: compute decimal value using BigInt for precision
        const val = expr.value;
        let bigNeg;
        if (val.startsWith('0x') || val.startsWith('0X') || val.startsWith('0b') || val.startsWith('0B')) {
          bigNeg = -BigInt(val);
        } else {
          bigNeg = -BigInt(val);
        }
        // Check if fits in Int64 range [-2^63, 0]
        const INT64_MIN = BigInt('-9223372036854775808');
        if (bigNeg >= INT64_MIN) {
          const intResult = loc({ kind: 'literal', type: 'Int64', value: String(bigNeg) });
          // Preserve source for -0 → "0" since it can't round-trip without original text
          if (bigNeg === BigInt(0)) intResult.source = text();
          return intResult;
        }
        // Overflows Int64: use Float64 (loses precision like ClickHouse does)
        return loc({ kind: 'literal', type: 'Float64', value: String(Number(bigNeg)), source: text() });
      }
      if (expr.kind === 'literal' && expr.type === 'Float64' && expr.value.charAt(0) !== '-') {
        // Negate a positive float literal; update source if present to include the minus sign
        const negResult = loc({ kind: 'literal', type: 'Float64', value: '-' + expr.value });
        if (expr.source) negResult.source = text();
        return negResult;
      }
      if (expr.kind === 'castExpr' && expr.operator) {
        // -value::Type: fold the minus sign into the cast's innermost literal (for :: operator casts)
        // Recurse through nested casts to find the innermost literal
        let innermost = expr;
        while (innermost.kind === 'castExpr' && innermost.operator && innermost.expr.kind === 'castExpr' && innermost.expr.operator) {
          innermost = innermost.expr;
        }
        const inner = innermost.expr;
        if (inner.kind === 'literal' && inner.type !== 'String' && inner.type !== 'NULL' &&
            inner.type !== 'Bool' && inner.value.charAt(0) !== '-') {
          const negInner = { ...inner, value: '-' + inner.value };
          // Update the innermost cast with the negated literal
          // Need to rebuild the chain since we can't mutate
          let result = { ...innermost, expr: negInner };
          // Walk back up rebuilding if there are nested casts
          const stack = [];
          let cur = expr;
          while (cur !== innermost) {
            stack.push(cur);
            cur = cur.expr;
          }
          for (let si = stack.length - 1; si >= 0; si--) {
            result = { ...stack[si], expr: result };
          }
          return result;
        }
      }
      // For all other cases (non-literal, already-negative literal, etc.), wrap in negate()
      return loc({ kind: 'functionCall', name: 'negate', args: [expr] });
    }
  / PrimaryExpr

// ── Primary expressions ───────────────────────────────────────────────────────

// PrimaryExpr: a base expression followed by zero or more postfix operators and optional window clause.
// Postfix operators (PrimaryExprSuffix) are left-associative and include:
//   :: (type cast), [index] (array subscript), .N (tuple element by index),
//   .name (tuple element by name), .:Type (JSON subcolumn), .* (tuple expansion)
// e.g. arr[1], tuple.2, expr::Int32, json.:String, row.*
PrimaryExpr
  = base:PrimaryBase suffixes:PrimaryExprSuffix* NullsHandlingClause? over:OverClause? {
      const result = suffixes.reduce((acc, s) => {
        if (s.kind === 'subscript') {
          return loc({ kind: 'functionCall', name: 'arrayElement', args: [acc, s.index] });
        } else if (s.kind === 'tuple_element') {
          let idxArg;
          const absIndex = s.index.charAt(0) === '-' ? s.index.substring(1) : s.index;
          // Large numbers that exceed UInt64 range are treated as Float64
          let idxLiteral;
          if (absIndex.length > 18) {
            const fval = Number(absIndex);
            idxLiteral = loc({ kind: 'literal', type: 'Float64', value: fval.toExponential().replace('+', '') });
          } else {
            idxLiteral = loc({ kind: 'literal', type: 'UInt64', value: absIndex });
          }
          if (s.index.charAt(0) === '-') {
            // Negative index: wrap as negate(literal)
            idxArg = loc({ kind: 'functionCall', name: 'negate', args: [idxLiteral] });
          } else {
            idxArg = idxLiteral;
          }
          return loc({ kind: 'functionCall', name: 'tupleElement', args: [acc, idxArg] });
        } else if (s.kind === 'field_access') {
          // Named field access: expr.name — tuple element by name
          return loc({ kind: 'functionCall', name: 'tupleElement', args: [acc, loc({ kind: 'literal', type: 'String', value: s.name })] });
        } else if (s.kind === 'json_subcolumn') {
          // .:Type or .:`QuotedType` — JSON subcolumn type annotation
          const node = loc({ kind: 'jsonSubcolumn', expr: acc, type: s.type });
          if (s.path && s.path.length > 0) node.path = s.path;
          return node;
        } else if (s.kind === 'asterisk_access') {
          // expr.* — tuple/expression wildcard expansion
          const node = loc({ kind: 'tupleExpansion', expr: acc });
          if (s.transformers && s.transformers.length > 0) node.transformers = s.transformers;
          return node;
        } else {
          // :: cast operator; mark with operator:true to distinguish from CAST(x AS T)
          return loc({ kind: 'castExpr', expr: acc, type: s.type, operator: true });
        }
      }, base);
      // Attach window spec to function calls with an inline OVER (spec) clause
      if (over !== null && over !== undefined && result !== null && result.kind === 'functionCall') {
        result.window = over;
      }
      return result;
    }

// NullsHandlingClause: RESPECT NULLS or IGNORE NULLS modifier on window functions (discarded)
NullsHandlingClause
  = _ ("RESPECT"i / "IGNORE"i) ![a-zA-Z0-9_] _ "NULLS"i ![a-zA-Z0-9_]

// OverClause: window function OVER clause.
// Returns a WindowSpec for inline specs, or null for bare named-window references.
// Three cases:
//   OVER (name [additional_spec]) — window inheritance; returns additional spec or null if empty
//   OVER (spec)                   — inline window spec; returns spec (possibly empty {})
//   OVER name                     — bare window name reference; returns null
// The first alternative handles both OVER (w) and OVER (w additional_spec), disambiguating
// from OVER (spec) (e.g. OVER (PARTITION BY x)) via the closing ')' check after the identifier.
OverClause
  // OVER (identifier [spec]) — always returns the spec (possibly empty {}) to trigger WindowDefinition
  // Named windows with OVER (w) produce an empty WindowDefinition; OVER (w spec) adds the spec content.
  = _ "OVER"i ![a-zA-Z0-9_] _ "(" _ Identifier _ spec:WindowSpec _ ")" { return spec; }
  // OVER (spec) — inline window spec
  / _ "OVER"i ![a-zA-Z0-9_] _ "(" _ spec:WindowSpec _ ")" { return spec; }
  // OVER name — bare window name reference; NO WindowDefinition (ClickHouse doesn't show one)
  / _ "OVER"i ![a-zA-Z0-9_] _ Identifier { return null; }

// WindowSpec: optional PARTITION BY, ORDER BY, and frame clause
WindowSpec
  = partitionBy:( "PARTITION"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ items:ExpressionList { return items; } )?
    _ orderBy:( "ORDER"i ![a-zA-Z0-9_] _ "BY"i ![a-zA-Z0-9_] _ items:OrderByItemList { return items; } )?
    _ frame:WindowFrameClause? {
      const spec = {};
      if (partitionBy !== null) spec.partitionBy = partitionBy;
      if (orderBy !== null) spec.orderBy = orderBy;
      if (frame !== null) spec.frame = frame;
      return spec;
    }

// WindowFrameClause: ROWS/RANGE/GROUPS BETWEEN start AND end, or ROWS/RANGE/GROUPS bound
WindowFrameClause
  = type:WindowFrameType _ "BETWEEN"i ![a-zA-Z0-9_] _ start:WindowFrameBound _ "AND"i ![a-zA-Z0-9_] _ end:WindowFrameBound {
      return { frameType: type, start: start, end: end };
    }
  / type:WindowFrameType _ bound:WindowFrameBound {
      return { frameType: type, start: bound };
    }

WindowFrameType = ("ROWS"i / "RANGE"i / "GROUPS"i) ![a-zA-Z0-9_] { return text().toLowerCase(); }

// WindowFrameBound: UNBOUNDED PRECEDING/FOLLOWING, CURRENT ROW, or expr PRECEDING/FOLLOWING
WindowFrameBound
  = "UNBOUNDED"i ![a-zA-Z0-9_] _ "PRECEDING"i ![a-zA-Z0-9_] { return { kind: 'unbounded' }; }
  / "UNBOUNDED"i ![a-zA-Z0-9_] _ "FOLLOWING"i ![a-zA-Z0-9_] { return { kind: 'unbounded' }; }
  / "CURRENT"i ![a-zA-Z0-9_] _ "ROW"i ![a-zA-Z0-9_] { return { kind: 'currentRow' }; }
  / expr:TernaryExpr _ "PRECEDING"i ![a-zA-Z0-9_] { return { kind: 'preceding', expr: expr }; }
  / expr:TernaryExpr _ "FOLLOWING"i ![a-zA-Z0-9_] { return { kind: 'following', expr: expr }; }

// OverBody: balanced parentheses content (used in WindowItem for named window body text)
OverBody
  = "(" OverBody* ")"
  / [^()]

// PrimaryExprSuffix: postfix operators applied left-to-right after PrimaryBase.
// Multiple suffixes can chain: expr::Int32[1].name.:String
PrimaryExprSuffix
  = _ "::" _ type:TypeCastIdentifier { return { kind: 'cast', type: type }; }
  // JSON subcolumn type annotation: .:TypeName or .:`QuotedType` with optional trailing .field access
  / "." ":" type:JsonSubcolumnType path:( "." name:Identifier { return name; } )* {
      return { kind: 'json_subcolumn', type: type, path: path };
    }
  / _ "[" _ index:Expression _ "]" { return { kind: 'subscript', index: index }; }
  / _ "." _ index:$[0-9]+ { return { kind: 'tuple_element', index: index }; }
  // Negative tuple element index: expr.-N (e.g. tuple.-1)
  / _ "." _ "-" index:$[0-9]+ { return { kind: 'tuple_element', index: '-' + index }; }
  // Named field access: expr.name — tuple element access by name (e.g. reverse(t).a)
  // Guard against ":N" (JSON subcolumn), "*" (qualified asterisk), digits (integer index above), and "-" (negative index)
  / _ "." _ ![:*0-9\-] name:AliasName { return { kind: 'field_access', name: name }; }
  // Tuple/expression asterisk: expr.* — expands all fields (e.g. tuple(1,'a').* or CAST(...).*).
  // Must come after field_access and before other rules to avoid conflicts.
  / _ "." _ "*" transformers:( _ ColumnTransformer )* {
      return { kind: 'asterisk_access', transformers: transformers.map((t) => t[1]) };
    }

// JSON subcolumn type: either a backtick-quoted type string (for complex types with parens)
// or an unquoted ClickHouse type identifier.
JsonSubcolumnType
  = "`" chars:BacktickChar* "`" { return chars.join(''); }
  / ClickHouseType

TypeCastIdentifier = ClickHouseType

// MySQL-compatible multiword type aliases used in CAST expressions.
// Only truly multi-word types are listed here (single-word aliases pass through unchanged).
// Tries the longest match first to avoid partial matches.
// Returns the type keyword normalized to uppercase with single spaces, matching ClickHouse EXPLAIN output.
// All alternatives return text() normalized to uppercase with single spaces.
MultiWordType
  = MultiWordTypeInner { return text().toUpperCase().replace(/\s+/g, ' ').trim(); }

MultiWordTypeInner
  = "DOUBLE"i _ "PRECISION"i ![a-zA-Z0-9_]
  / "NATIONAL"i _ ( "CHARACTER"i / "CHAR"i ) _ "LARGE"i _ "OBJECT"i ![a-zA-Z0-9_]
  / "NATIONAL"i _ ( "CHARACTER"i / "CHAR"i ) _ "VARYING"i ![a-zA-Z0-9_]
  / "NATIONAL"i _ ( "CHARACTER"i / "CHAR"i ) ![a-zA-Z0-9_]
  / "NCHAR"i _ "LARGE"i _ "OBJECT"i ![a-zA-Z0-9_]
  / "NCHAR"i _ "VARYING"i ![a-zA-Z0-9_]
  / ( "CHARACTER"i / "CHAR"i / "BINARY"i ) _ "LARGE"i _ "OBJECT"i ![a-zA-Z0-9_]
  / ( "CHARACTER"i / "CHAR"i / "BINARY"i ) _ "VARYING"i ![a-zA-Z0-9_]
  / "INT1"i _ ( "SIGNED"i / "UNSIGNED"i ) ![a-zA-Z0-9_]
  / ( "TINYINT"i / "SMALLINT"i / "BIGINT"i ) _ ( "SIGNED"i / "UNSIGNED"i ) ![a-zA-Z0-9_]
  / ( "MEDIUMINT"i / "INTEGER"i / "INT"i ) _ ( "SIGNED"i / "UNSIGNED"i ) ![a-zA-Z0-9_]

// ── Structured data type parsing (for column definitions) ────────────────────

// ColumnDataType: returns a structured { name, args? } object for EXPLAIN AST rendering.
ColumnDataType
  = mw:MultiWordType args:( _ "(" _ ColumnDataTypeArgList? _ ")" )? {
      const result = { name: mw };
      if (args !== null) result.args = args[3] !== null ? args[3] : [];
      return result;
    }
  / "`" name:$[^`]+ "`" { return { name }; }
  / "\"" name:$[^"]+ "\"" { return { name }; }
  // Enum types: parse values as structured list
  / name:$("Enum8"i / "Enum16"i / "Enum"i ![a-zA-Z0-9_]) _ "(" _ values:EnumValueList _ ")" {
      return { name: name.trim(), args: [{ kind: 'enumValues', values }] };
    }
  / name:$("Enum8"i / "Enum16"i / "Enum"i ![a-zA-Z0-9_]) {
      return { name: name.trim() };
    }
  / name:$([a-zA-Z_][a-zA-Z0-9_]*) args:( _ "(" _ ColumnDataTypeArgList? _ ")" )? suffix:( _ ("SIGNED"i / "UNSIGNED"i) ![a-zA-Z0-9_] )? {
      let typeName = name;
      if (suffix !== null) typeName = (name + ' ' + suffix[1]).toUpperCase();
      const result = { name: typeName };
      if (args !== null) result.args = args[3] || [];
      return result;
    }

EnumValueList
  = head:EnumValue tail:( _ "," _ EnumValue )* {
      return [head, ...tail.map(t => t[3])];
    }

EnumValue
  = name:StringLiteral _ "=" _ value:$("-"? _ [0-9]+) { return { name: name.value, value: value.replace(/\s/g, '') }; }
  / "NULL"i ![a-zA-Z0-9_] { return { name: null, value: null }; }
  / name:StringLiteral { return { name: name.value }; }

ColumnDataTypeArgList
  = head:ColumnDataTypeArg tail:( _ "," _ ColumnDataTypeArg )* trailing_comma:( _ "," )? {
      return [head, ...tail.map(t => t[3])];
    }

// A single type argument: could be a sub-type, a named field (Nested/Tuple), a literal, a setting, or a SKIP/REGEXP spec
ColumnDataTypeArg
  // SKIP REGEXP 'pattern' (for JSON type)
  = "SKIP"i ![a-zA-Z0-9_] _ "REGEXP"i ![a-zA-Z0-9_] _ str:$("'" [^']* "'") {
      return { kind: 'literal', value: 'SKIP REGEXP ' + str };
    }
  // SKIP path (for JSON type)
  / "SKIP"i ![a-zA-Z0-9_] _ path:TypeArgFieldName {
      return { kind: 'literal', value: 'SKIP ' + path };
    }
  // Named field: "name Type" (for Nested, named Tuple, JSON typed paths)
  / name:TypeArgFieldName _ &([a-zA-Z_`] / "(" / "'" / "\"") type:ColumnDataType {
      return { kind: 'namedField', name: name.replace(/[`"]/g, ''), type };
    }
  // String literal
  / str:$("'" [^']* "'") { return { kind: 'literal', value: str }; }
  // Numeric literal (possibly negative, with decimal)
  / val:$("-"? [0-9]+ ("." [0-9]*)?) { return { kind: 'literal', value: val }; }
  // Setting: name = value  (for Dynamic(max_types=3), JSON(max_dynamic_paths=10))
  / name:$([a-zA-Z_][a-zA-Z0-9_]*) _ "=" _ val:TernaryExpr {
      return { kind: 'setting', name: name, value: val };
    }
  // Subtype (must be after named field to avoid consuming the name)
  / type:ColumnDataType { return { kind: 'type', type }; }
  // Raw text for other specials
  / raw:$([^ ,)]+) { return { kind: 'literal', value: raw }; }

// Field name for type args: supports bare identifiers, dotted paths, backtick-quoted, and double-quoted identifiers
TypeArgFieldName
  = parts:( TypeArgFieldPart ( "." TypeArgFieldPart )* ) { return text(); }

TypeArgFieldPart
  = "`" [^`]+ "`"
  / '"' [^"]+ '"'
  / [a-zA-Z_\u0080-\uffff][a-zA-Z0-9_\u0080-\uffff]*

// ── Raw data type parsing (for CAST and expression contexts) ─────────────────

// ClickHouseType: a type identifier with optional parenthesized arguments (balanced).
// e.g. Int32, Nullable(String), Enum8('Hello' = 0, 'World' = 1), Tuple(Int32, String),
//      Map(String, UInt64), Array(Nullable(Float64)), DOUBLE PRECISION
// Type arguments are captured as raw text (not parsed as expressions) because they can
// contain non-expression syntax like enum value assignments ('Hello' = 0).
ClickHouseType
  = mw:MultiWordType { return mw; }
  / "`" name:$[^`]+ "`" { return name; }
  / "\"" name:$[^"]+ "\"" { return name; }
  / name:$([a-zA-Z_][a-zA-Z0-9_]*) _ args:ClickHouseTypeArgs? {
      return name + (args !== null ? args : '');
    }
// Parenthesized type arguments (balanced)
ClickHouseTypeArgs
  = "(" parts:ClickHouseTypeArgPart* ")" {
      return "(" + parts.join("") + ")";
    }

ClickHouseTypeArgPart
  = nested:ClickHouseTypeArgs { return nested; }
  / str:$("'" [^']* "'") { return str; }
  / chars:$[^()']+ { return chars; }

// ── Compound expressions ──────────────────────────────────────────────────────

// PrimaryBase: atomic expressions — the leaves and compound literals of the expression tree.
// Order matters: alternatives are tried top-to-bottom with PEG ordered choice.
// Keyword-starting rules (NOT, CASE, INTERVAL, DATE, TIMESTAMP, etc.) must come before
// the fallback AliasName rules at the bottom to prevent keywords being consumed as column names.
PrimaryBase
  = MySQLGlobalVariable
  // NOT(expr) and NOT (expr) — parenthesized NOT as a high-precedence unary operator.
  // This is distinct from NotExpr (low precedence): NOT (0) + NOT (0) → plus(not(0), not(0)).
  // NOT (a, b, c) — NOT applied to a multi-element tuple: not(tuple(a, b, c))
  / KW_NOT _ tuple:TupleLiteral { return loc({ kind: 'functionCall', name: 'not', args: [tuple] }); }
  / KW_NOT _ "(" _ expr:ExpressionWithImplicitAlias _ ")" { return loc({ kind: 'unaryExpr', op: 'NOT', expr: expr }); }
  / ParenGroup
  / ArrayLiteral
  / LambdaExprNoParens
  // {QP:Identifier}.field.col — QueryParam used as a table/db qualifier in a dotted column ref.
  // Must come before QueryParam to prevent {QP:Identifier} being consumed as a bare query param.
  / first:QueryParamIdentifier rest:( _ "." _ part:ColumnRefCont { return part; } )+ {
      return loc({ kind: 'columnRef', parts: [first, ...rest] });
    }
  / QueryParam
  / MapLiteral
  / HeredocLiteral
  / BoolLiteral
  / NullLiteral
  / BinaryStringLiteral
  / HexStringLiteral
  / HexLiteral
  / BinaryNumLiteral
  / FloatLiteral
  / IntegerLiteral
  / StringLiteral
  / CaseExpr
  / IntervalExpr
  / ColumnsExpr
  / FunctionCall
  / QualifiedAsterisk
  // Bare keyword identifier used as column reference only when immediately followed by subscript '['.
  // This allows ClickHouse system-table columns like Settings['key'] where Settings is a reserved word.
  / name:AliasName &(_ "[") { return loc({ kind: 'columnRef', parts: [name] }); }
  / ColumnRef
  // Last resort: allow reserved keywords as bare column references (e.g., GROUP BY in, SELECT count).
  // Only reached when all other PrimaryBase alternatives fail.
  / name:AliasName { return loc({ kind: 'columnRef', parts: [name] }); }
  / Asterisk

// MapLiteral: {'key': value, ...} syntax — parsed as map() function call
// A map literal starts with '{' followed by an expression then ':' (not just an identifier or identifier:type which is QueryParam/Heredoc)
MapLiteral
  = "{" _ "}" { return loc({ kind: 'functionCall', name: 'map', args: [] }); }
  / "{" _ first:MapEntry rest:( _ "," _ MapEntry )* _ "}" {
      const args = [first[0], first[1]];
      for (const r of rest) {
        args.push(r[3][0]);
        args.push(r[3][1]);
      }
      return loc({ kind: 'functionCall', name: 'map', args });
    }

MapEntry
  = key:TernaryExpr _ ":" _ value:TernaryExpr { return [key, value]; }

// MySQLGlobalVariable: @@varname or @@session.varname / @@global.varname syntax.
// Maps to globalVariable('varname') with alias @@varname (session./global. prefix is stripped).
MySQLGlobalVariable
  = "@@" ("session." / "global." / "local.")? name:$[a-zA-Z0-9_]+ {
      return loc({ kind: 'alias', alias: '@@' + name, expr: loc({ kind: 'functionCall', name: 'globalVariable', args: [loc({ kind: 'literal', type: 'String', value: name })] }) });
    }

// ParenGroup: left-factored rule for all "("-prefixed expressions in PrimaryBase.
// After consuming "(", branches on what follows to avoid re-entering "(" for each alternative.
ParenGroup
  // Empty-arg lambda: () -> expr
  = "(" _ ")" _ "->" _ body:Expression {
      return loc({ kind: 'lambdaExpr', params: [], body });
    }
  // Empty tuple: ()
  / "(" _ ")" { return loc({ kind: 'functionCall', name: 'tuple', args: [] }); }
  // Subquery: (SELECT ...) / (WITH ... SELECT ...) / (EXPLAIN ...)
  / "(" beforeQuery:_ &(KW_SELECT / KW_WITH / "EXPLAIN"i ![a-zA-Z0-9_]) query:UnionQuery afterQuery:_ ")" {
      return loc({ kind: 'subqueryExpr', query: addSurroundingWs(query, beforeQuery, afterQuery) });
    }
  // Lambda with parens: (x, y, ...) -> expr
  / "(" _ head:Identifier tail:(_ "," _ Identifier)* _ ")" _ "->" _ body:Expression {
      return loc({ kind: 'lambdaExpr', params: [head, ...tail.map((t) => t[3])], body });
    }
  // Tuple or parenthesized expression: parse first expression, then branch on comma vs close paren
  / "(" beforeFirst:_ first:Expression rest:(_ "," _ Expression)* trailing:(_ ",")? afterLast:_ ")" {
      first = addLeading(first, flattenWs(beforeFirst));
      if (rest.length === 0 && trailing === null) {
        // (expr) — parenthesized expression
        first = addTrailing(first, flattenWs(afterLast));
        return { ...first, parenthesized: true };
      } else if (rest.length === 0) {
        // (expr,) — single-element tuple
        return loc({ kind: 'functionCall', name: 'tuple', args: [first] });
      } else {
        // (expr, expr, ...) — multi-element tuple
        const elems = [first, ...rest.map((r) => r[3])];
        return loc({ kind: 'tupleLiteral', elements: elems, source: text() });
      }
    }

// TupleLiteral: multi-element tuple (used by NOT-tuple rule in PrimaryBase)
TupleLiteral
  // Single-element tuple with trailing comma: (expr,)
  = "(" _ elem:Expression _ "," _ ")" {
      return loc({ kind: 'functionCall', name: 'tuple', args: [elem] });
    }
  // Multi-element tuple (optionally with trailing comma)
  / "(" _ first:Expression _ "," _ rest:ExpressionList _ ","? _ ")" {
      return loc({ kind: 'tupleLiteral', elements: [first, ...rest], source: text() });
    }

ArrayLiteral
  = "[" _ "]" {
      return loc({ kind: 'arrayLiteral', elements: [], source: text() });
    }
  / "[" beforeItems:_ items:ExpressionList afterItems:_ "]" {
      const bi = flattenWs(beforeItems);
      const ai = flattenWs(afterItems);
      if ((bi.length > 0 || ai.length > 0) && items.length > 0) {
        items = items.slice();
        items[0] = addLeading(items[0], bi);
        items[items.length - 1] = addTrailing(items[items.length - 1], ai);
      }
      return loc({ kind: 'arrayLiteral', elements: items, source: text() });
    }

QueryParam
  = "{" _ name:$( "$" [0-9]+ / [a-zA-Z_][a-zA-Z0-9_]* ) _ ":" _ type:$([^}]+) "}" {
      return loc({ kind: 'queryParam', name: name, type: type.trim() });
    }

// HeredocLiteral: PostgreSQL-style dollar-quoted string: $tag$content$tag$ or $$content$$
// The end marker is found by scanning forward in the input (not via PEG backtracking).
// e.g. $$hello world$$, $heredoc$multi-line content$heredoc$
HeredocLiteral
  = "$" tag:$([^$]*) "$" {
      const endMarker = `$${tag}$`;
      const pos = input.indexOf(endMarker, peg$currPos);
      if (pos < 0) { error(`Unterminated heredoc $${tag}$`); }
      const content = input.substring(peg$currPos, pos);
      peg$currPos = pos + endMarker.length;
      // Double backslashes so escapeStringValue in explain.ts outputs them correctly (consistent with StringChar handling of \\)
      return loc({ kind: 'literal', type: 'String', value: content.replace(/\\/g, '\\\\') });
    }

// BoolLiteral: true and false keywords produce Bool literals
BoolLiteral
  = "true"i  ![a-zA-Z0-9_] { return loc({ kind: 'literal', type: 'Bool', value: '1' }); }
  / "false"i ![a-zA-Z0-9_] { return loc({ kind: 'literal', type: 'Bool', value: '0' }); }

NullLiteral
  = "NULL"i ![a-zA-Z0-9_] {
      return loc({ kind: 'literal', type: 'NULL', value: 'NULL' });
    }

// BinaryStringLiteral: b'01010...' syntax - binary digits converted to a UTF-8 string value
BinaryStringLiteral
  = [bB] "'" digits:$[01]* "'" {
      if (digits.length === 0) return loc({ kind: 'literal', type: 'String', value: '' });
      // Pad to multiple of 8 bits, MSB-first, then interpret as UTF-8 bytes
      const padded = digits.padStart(Math.ceil(digits.length / 8) * 8, '0');
      const bytes = [];
      for (let i = 0; i < padded.length; i += 8) {
        bytes.push(parseInt(padded.slice(i, i + 8), 2));
      }
      return loc({ kind: 'literal', type: 'String', value: Buffer.from(bytes).toString('utf-8') });
    }

// HexStringLiteral: x'hexdigits...' syntax - hex digit pairs converted to a UTF-8 string value
HexStringLiteral
  = [xX] "'" digits:$[0-9a-fA-F]* "'" {
      if (digits.length === 0) return loc({ kind: 'literal', type: 'String', value: '' });
      const padded = digits.length % 2 === 1 ? '0' + digits : digits;
      return loc({ kind: 'literal', type: 'String', value: Buffer.from(padded, 'hex').toString('utf-8') });
    }

HexLiteral
  // Hex float literal with fractional part: 0x1.234 or 0x1.234p+01
  // Uses proper separator pattern: no trailing underscore before '.' or 'p' exponent.
  // The ![a-zA-Z0-9_] guard prevents consuming partial tokens (e.g. 0x2_p2 → identifier).
  = "0x"i int:$([0-9a-fA-F]+("_"[0-9a-fA-F]+)*) "." frac:$([0-9a-fA-F]+("_"[0-9a-fA-F]+)*)? exp:HexExponentPart? ![a-zA-Z0-9_] {
      const cleanInt = int.replace(/_/g, '');
      const cleanFrac = (frac || '').replace(/_/g, '');
      const intVal = parseInt(cleanInt, 16);
      const fracVal = cleanFrac.length > 0 ? parseInt(cleanFrac, 16) / Math.pow(16, cleanFrac.length) : 0;
      const value = exp !== null ? (intVal + fracVal) * Math.pow(2, exp) : (intVal + fracVal);
      return loc({ kind: 'literal', type: 'Float64', value: value.toString(), source: text() });
    }
  / "0x"i digits:$([0-9a-fA-F]+("_"[0-9a-fA-F]+)*) exp:HexExponentPart? ![a-zA-Z0-9_] {
      // Remove underscore digit separators
      const clean = digits.replace(/_/g, '');
      // Parse hex with optional exponent (e.g. 0x123p4) as float
      if (exp !== null) {
        return loc({ kind: 'literal', type: 'Float64', value: parseFloat(parseInt(clean, 16) * Math.pow(2, exp)).toString(), source: text() });
      }
      // If significant hex digits exceed 16 (> 64 bits), overflows UInt64 → treat as Float64
      const significant = clean.replace(/^0+/, '') || '0';
      if (significant.length > 16) {
        return loc({ kind: 'literal', type: 'Float64', value: String(Number(BigInt('0x' + clean))), source: text() });
      }
      return loc({ kind: 'literal', type: 'UInt64', value: '0x' + clean });
    }

HexExponentPart
  = [pP] sign:$[+-]? digits:$([0-9]+("_"[0-9]+)*) { return (sign === '-' ? -1 : 1) * parseInt(digits.replace(/_/g, ''), 10); }

BinaryNumLiteral
  = "0b"i digits:$([01]+("_"[01]+)*) ![a-zA-Z0-9_] {
      // Remove underscore digit separators
      const clean = digits.replace(/_/g, '');
      return loc({ kind: 'literal', type: 'UInt64', value: '0b' + clean });
    }

// FloatLiteral: decimal float with optional underscore digit separators.
// Uses proper underscore separator pattern: digits must not start/end with _ and no double __.
// Note: "_ " in Peggy sequences is the whitespace rule; use "_" (quoted) for literal underscore.
// The ![a-zA-Z_] guard prevents partial consumption (e.g. 1e5_ must not match as 1e5).
FloatLiteral
  = "inf"i ![a-zA-Z0-9_] { return loc({ kind: 'literal', type: 'Float64', value: 'inf' }); }
  / "nan"i ![a-zA-Z0-9_] { return loc({ kind: 'literal', type: 'Float64', value: 'nan' }); }
  / digits:$([0-9]+("_"[0-9]+)*) "." frac:$([0-9]+("_"[0-9]+)*)? exp:ExponentPart? ![a-zA-Z_] {
      return loc({ kind: 'literal', type: 'Float64', value: digits.replace(/_/g, '') + '.' + (frac || '').replace(/_/g, '') + (exp || '') });
    }
  / "." digits:$([0-9]+("_"[0-9]+)*) exp:ExponentPart? ![a-zA-Z_] {
      return loc({ kind: 'literal', type: 'Float64', value: '.' + digits.replace(/_/g, '') + (exp || '') });
    }
  / digits:$([0-9]+("_"[0-9]+)*) exp:ExponentPart ![a-zA-Z_] {
      return loc({ kind: 'literal', type: 'Float64', value: digits.replace(/_/g, '') + exp });
    }

// ExponentPart: e/E with optional sign and decimal digits (underscores allowed between digits).
ExponentPart
  = e:$[eE] sign:$[+-]? digits:$([0-9]+("_"[0-9]+)*) { return e + sign + digits.replace(/_/g, ''); }

// ── Lambda expressions ────────────────────────────────────────────────────────

LambdaExprNoParens
  = param:Identifier _ "->" _ body:Expression {
      return loc({ kind: 'lambdaExpr', params: [param], body: body });
    }

// IntervalExpr: INTERVAL expr unit - maps to toIntervalUnit(expr)
// CaseExpr: CASE expressions mapped to multiIf() or caseWithExpression()
// CASE WHEN cond THEN val ... [ELSE default] END → multiIf(cond, val, ..., default_or_null)
// CASE expr WHEN val THEN res ... [ELSE default] END → caseWithExpression(expr, val, res, ..., default_or_null)
// The no-subject form must come first so "CASE WHEN" doesn't try to parse WHEN as the subject expression
CaseExpr
  = "CASE"i ![a-zA-Z0-9_] _ branches:CaseWhenBranch+ elseClause:( _ "ELSE"i ![a-zA-Z0-9_] _ Expression )? _ "END"i ![a-zA-Z0-9_] {
      const args = [];
      for (const branch of branches) {
        args.push(branch[0]);
        args.push(branch[1]);
      }
      args.push(elseClause !== null ? elseClause[4] : loc({ kind: 'literal', type: 'NULL', value: 'NULL' }));
      return loc({ kind: 'functionCall', name: 'multiIf', args });
    }
  / "CASE"i ![a-zA-Z0-9_] _ subject:Expression _ branches:CaseWhenBranch+ elseClause:( _ "ELSE"i ![a-zA-Z0-9_] _ Expression )? _ "END"i ![a-zA-Z0-9_] {
      const args = [subject];
      for (const branch of branches) {
        args.push(branch[0]);
        args.push(branch[1]);
      }
      args.push(elseClause !== null ? elseClause[4] : loc({ kind: 'literal', type: 'NULL', value: 'NULL' }));
      return loc({ kind: 'functionCall', name: 'caseWithExpression', args });
    }

// CaseWhenBranch: a single WHEN ... THEN ... pair in a CASE expression
CaseWhenBranch
  = _ "WHEN"i ![a-zA-Z0-9_] _ cond:Expression _ "THEN"i ![a-zA-Z0-9_] _ val:Expression {
      return [cond, val];
    }

IntervalExpr
  = "INTERVAL"i ![a-zA-Z0-9_] _ expr:Expression _ unit:IntervalUnit {
      return loc({ kind: 'functionCall', name: 'toInterval' + unit, args: [expr] });
    }
  // INTERVAL 'N unit' MySQL-compatible syntax: single string containing value and unit
  / "INTERVAL"i ![a-zA-Z0-9_] _ str:StringLiteral {
      const parts = str.value.trim().split(/\s+/);
      const val = parts[0];
      const unitStr = (parts[1] || '').toUpperCase().replace(/S$/, '');
      const unitMap = {
        NANOSECOND: 'Nanosecond', MICROSECOND: 'Microsecond', MILLISECOND: 'Millisecond',
        SECOND: 'Second', MINUTE: 'Minute', HOUR: 'Hour', DAY: 'Day',
        WEEK: 'Week', MONTH: 'Month', QUARTER: 'Quarter', YEAR: 'Year'
      };
      const unit = unitMap[unitStr] || 'Second';
      const numVal = parseInt(val, 10);
      return loc({ kind: 'functionCall', name: 'toInterval' + unit, args: [loc({ kind: 'literal', type: 'UInt64', value: String(numVal) })] });
    }

// IntervalUnit: time unit keywords for INTERVAL expressions
// Supports full names, plurals (SECONDS, YEARS, ...), and abbreviations (s, m, h, d, w, q, y, ms, us, ns)
IntervalUnit
  = word:$([a-zA-Z_] [a-zA-Z0-9_]*) &{ return INTERVAL_UNITS[word.toLowerCase()] !== undefined; } {
      return INTERVAL_UNITS[word.toLowerCase()];
    }

// TimestampTsiUnit: IntervalUnit including SQL_TSI_ prefixed variants (all handled via INTERVAL_UNITS lookup)
TimestampTsiUnit = IntervalUnit

// ── Function calls ────────────────────────────────────────────────────────────

// DATE_ADD/DATE_SUB function name variants
DateAddName = ("DATE_ADD"i / "DATEADD"i / "TIMESTAMP_ADD"i / "TIMESTAMPADD"i) { return 'plus'; }
DateSubName = ("DATE_SUB"i / "DATESUB"i / "TIMESTAMP_SUB"i / "TIMESTAMPSUB"i) { return 'minus'; }

// DATE_ADD/DATE_SUB argument forms: (unit, amount, date) or (date, INTERVAL ...) or (INTERVAL ..., date)
DateAddSubArgs
  = unit:IntervalUnit _ "," _ amount:ExpressionWithImplicitAlias _ "," _ date:ExpressionWithImplicitAlias {
      return [date, loc({ kind: 'functionCall', name: 'toInterval' + unit, args: [amount] })];
    }
  / date:ExpressionWithImplicitAlias _ "," _ interval:IntervalExpr { return [date, interval]; }
  / interval:IntervalExpr _ "," _ date:ExpressionWithImplicitAlias { return [interval, date]; }

// CAST(expr AS TypeName) - special ClickHouse syntax, expr must be TernaryExpr
// to avoid greedily consuming the type name as an alias
FunctionCall
  // DATE_ADD/DATEADD/TIMESTAMP_ADD/TIMESTAMPADD — all forms → plus(date, interval)
  = fn:DateAddName _ "(" _ args:DateAddSubArgs _ ")" {
      return loc({ kind: 'functionCall', name: fn, args: args });
    }
  // DATE_SUB/DATESUB/TIMESTAMP_SUB/TIMESTAMPSUB — all forms → minus(date, interval)
  / fn:DateSubName _ "(" _ args:DateAddSubArgs _ ")" {
      return loc({ kind: 'functionCall', name: fn, args: args });
    }
  // TIMESTAMP_SUB/TIMESTAMPSUB(SQL_TSI_UNIT, amount, date) with TSI prefix unit → minus(date, toIntervalUnit(amount))
  / DateSubName _ "(" _ unit:TimestampTsiUnit _ "," _ amount:Expression _ "," _ date:Expression _ ")" {
      return loc({ kind: 'functionCall', name: 'minus', args: [date, loc({ kind: 'functionCall', name: 'toInterval' + unit, args: [amount] })] });
    }
  // dateDiff/DATEDIFF/DATE_DIFF with unquoted unit identifier as first arg → convert to canonical lowercase string literal
  / ("dateDiff"i / "DATEDIFF"i / "DATE_DIFF"i) _ "(" _ unit:$([a-zA-Z_][a-zA-Z0-9_]*) _ "," _ rest:FunctionCallArgList _ ")" {
      const unitAliases = {
        'ns': 'nanosecond', 'nanoseconds': 'nanosecond',
        'us': 'microsecond', 'microseconds': 'microsecond',
        'ms': 'millisecond', 'milliseconds': 'millisecond',
        'ss': 'second', 's': 'second', 'seconds': 'second',
        'mi': 'minute', 'n': 'minute', 'minutes': 'minute',
        'hh': 'hour', 'h': 'hour', 'hours': 'hour',
        'dd': 'day', 'd': 'day', 'days': 'day',
        'wk': 'week', 'ww': 'week', 'w': 'week', 'weeks': 'week',
        'mm': 'month', 'm': 'month', 'months': 'month',
        'qq': 'quarter', 'q': 'quarter', 'quarters': 'quarter',
        'yy': 'year', 'yyyy': 'year', 'y': 'year', 'years': 'year',
        'mcs': 'microsecond',
      };
      const lower = unit.toLowerCase();
      const canonical = unitAliases[lower] || lower;
      const unitLiteral = loc({ kind: 'literal', type: 'String', value: canonical });
      return loc({ kind: 'functionCall', name: 'dateDiff', args: [unitLiteral, ...rest] });
    }
  // dateDiff/DATEDIFF/DATE_DIFF with quoted string unit (normalize function name to dateDiff)
  / ("dateDiff"i / "DATEDIFF"i / "DATE_DIFF"i) _ "(" _ args:FunctionCallArgList _ ")" {
      return loc({ kind: 'functionCall', name: 'dateDiff', args: args });
    }
  // SUBSTRING(str FROM pos [FOR len]) — SQL standard substring syntax
  / ( "SUBSTRING"i / "SUBSTR"i / "MID"i ) _ "(" _ str:ExpressionWithImplicitAlias _ "FROM"i ![a-zA-Z0-9_] _ pos:ExpressionWithImplicitAlias len:( _ "FOR"i ![a-zA-Z0-9_] _ ExpressionWithImplicitAlias )? _ ")" {
      const args = [str, pos];
      if (len !== null) args.push(len[4]);
      return loc({ kind: 'functionCall', name: 'substring', args });
    }
  // EXTRACT(unit FROM expr) — SQL standard date/time extraction
  // Supports implicit alias on expr (ClickHouse extension)
  / "EXTRACT"i _ "(" _ unit:ExtractUnit _ "FROM"i ![a-zA-Z0-9_] _ expr:ExpressionWithImplicitAlias _ ")" {
      const funcMap = {
        YEAR: 'toYear', MONTH: 'toMonth', DAY: 'toDayOfMonth',
        HOUR: 'toHour', MINUTE: 'toMinute', SECOND: 'toSecond',
        DOW: 'toDayOfWeek', DOY: 'toDayOfYear', EPOCH: 'toUnixTimestamp',
        WEEK: 'toWeek', QUARTER: 'toQuarter', MICROSECOND: 'toMicrosecond',
        MILLISECOND: 'toMillisecond', CENTURY: 'toCentury', ISOYEAR: 'toISOYear',
        ISOWEEK: 'toISOWeek', TIMEZONE_HOUR: 'timezoneHour', TIMEZONE_MINUTE: 'timezoneMinute',
        YYYY: 'toYear', MM: 'toMonth', DD: 'toDayOfMonth', HH: 'toHour',
        MI: 'toMinute', SS: 'toSecond'
      };
      const funcName = funcMap[unit.toUpperCase()] || ('to' + unit.charAt(0).toUpperCase() + unit.slice(1).toLowerCase());
      return loc({ kind: 'functionCall', name: funcName, args: [expr] });
    }
  / "TRIM"i _ "(" _ direction:TrimDirection _ chars:ExpressionWithImplicitAlias _ "FROM"i ![a-zA-Z0-9_] _ str:ExpressionWithImplicitAlias _ ")" {
      // ClickHouse simplifies TRIM with empty string to just the expression
      if (chars.kind === 'literal' && chars.type === 'String' && chars.value === '') {
        return str;
      }
      const fname = direction === 'LEADING' ? 'trimLeft' : (direction === 'TRAILING' ? 'trimRight' : 'trimBoth');
      return loc({ kind: 'functionCall', name: fname, args: [str, chars] });
    }
  // POSITION(needle IN haystack) — SQL standard POSITION syntax; maps to position(haystack, needle)
  // Uses AddExpr for needle to prevent consuming IN as part of the expression
  / "POSITION"i _ "(" _ needle:AddExpr _ "IN"i ![a-zA-Z0-9_] _ haystack:ExpressionWithImplicitAlias _ ")" {
      return loc({ kind: 'functionCall', name: 'position', args: [haystack, needle] });
    }
  // SQL-standard typed date/time literals: DATE 'string' → toDate('string'), etc.
  / "DATE"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return loc({ kind: 'functionCall', name: 'toDate', args: [str] });
    }
  / "TIMESTAMP"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return loc({ kind: 'functionCall', name: 'toDateTime', args: [str] });
    }
  / "TIME"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return loc({ kind: 'functionCall', name: 'toTime', args: [str] });
    }
  // CAST(expr AS Type) — SQL standard type cast. Also supports aliased form: CAST(expr AS alias AS Type)
  // The alias lookahead (&(KW_AS)) ensures we don't consume the final type name as an alias.
  // e.g. CAST(1 AS Int32), CAST(x AS y AS String)
  / "CAST"i _ "(" _ expr:TernaryExpr alias:( _ ( KW_AS _ )? name:AliasName &( _ KW_AS ) { return name; } )? _ KW_AS _ type:ClickHouseType _ ")" {
      const innerExpr = alias !== null ? loc({ kind: 'alias', expr, alias }) : expr;
      return loc({ kind: 'castExpr', expr: innerExpr, type: type });
    }
  // Generic function call: name([DISTINCT|ALL] args [SETTINGS ...])[(params)]? [FILTER(WHERE ...)]?
  // DISTINCT modifier appends "Distinct" to function name: countDistinct, sumDistinct, etc.
  // Curried form f(params)(args) is used by parametric aggregates: quantile(0.5)(x)
  // FILTER(WHERE cond) transforms f(args) → fIf(args, cond) (SQL standard aggregate filter)
  // The !(")" / ",") guard after DISTINCT/ALL prevents them from being consumed as modifiers
  // when they're actually arguments: has(Settings, 'x') or func(DISTINCT) where DISTINCT is a value.
  / name:FunctionName _ "(" openComments:_ modifier:( ( KW_DISTINCT / KW_ALL ) !( _ ( ")" / "," ) ) _ )? first:FunctionCallArgList? funcSettings:( _ KW_SETTINGS _ SettingsList )? _ ")" second:( _ "(" _ ( ( KW_DISTINCT / KW_ALL ) !( _ ( ")" / "," ) ) _ )? FunctionCallArgList? _ ")" )? filter:FilterClause? {
      const modVal = modifier !== null ? modifier[0] : null;
      const modStr = Array.isArray(modVal) ? modVal[0] : modVal;
      const isDistinct = modStr !== null && modStr !== undefined && modStr.toString().toUpperCase() === 'DISTINCT';
      const effectiveName = isDistinct ? name + 'Distinct' : name;
      // Attach comments between "(" and first arg as leadingComments on first arg
      let args1 = first || [];
      const oc = flattenWs(openComments);
      if (oc.length > 0 && args1.length > 0) {
        args1 = args1.slice();
        args1[0] = addLeading(args1[0], oc);
      }
      let call;
      if (second !== null) {
        // second[3] = modifier2 group, second[4] = FunctionCallArgList?
        const mod2 = second[3];
        const mod2Val = mod2 !== null ? mod2[0] : null;
        const mod2Str = Array.isArray(mod2Val) ? mod2Val[0] : mod2Val;
        const isDistinct2 = mod2Str !== null && mod2Str !== undefined && mod2Str.toString().toUpperCase() === 'DISTINCT';
        const curryName = isDistinct2 ? effectiveName + 'Distinct' : effectiveName;
        call = loc({ kind: 'functionCall', name: curryName, params: args1, args: second[4] || [] });
      } else {
        call = loc({ kind: 'functionCall', name: effectiveName, args: args1 });
      }
      if (funcSettings !== null) call.funcSettings = funcSettings[3];
      if (filter !== null) {
        // count(*) FILTER (WHERE cond) → countIf(cond): drop the asterisk arg
        const filterArgs = (call.args.length === 1 && call.args[0].kind === 'asterisk')
          ? [] : call.args;
        call = loc({ kind: 'functionCall', name: call.name + 'If', args: [...filterArgs, filter] });
      }
      return call;
    }

// ExtractUnit: the date/time unit identifier in EXTRACT(unit FROM expr)
ExtractUnit
  = unit:$([a-zA-Z_][a-zA-Z0-9_]*) { return unit; }

// TrimDirection: LEADING, TRAILING, or BOTH for TRIM function syntax
TrimDirection
  = "LEADING"i  ![a-zA-Z0-9_] { return 'LEADING'; }
  / "TRAILING"i ![a-zA-Z0-9_] { return 'TRAILING'; }
  / "BOTH"i     ![a-zA-Z0-9_] { return 'BOTH'; }

// FilterClause: FILTER(WHERE expr) postfix on aggregate functions
// Transforms funcName(args) into funcNameIf(args..., condition)
FilterClause
  = _ "FILTER"i _ "(" _ "WHERE"i ![a-zA-Z0-9_] _ expr:Expression _ ")" { return expr; }

// FunctionName: like Identifier but allows reserved keywords and digit-prefixed names
// Function calls are disambiguated by the required "(" that follows the name.
FunctionName
  = head:[a-zA-Z_] tail:[a-zA-Z0-9_]* { return head + tail.join(""); }
  / head:[0-9] tail:[a-zA-Z0-9_]* { return head + tail.join(""); }
  / '"' chars:DoubleQuotedChar* '"' { return chars.join(""); }
  / '`' chars:BacktickChar* '`' { return chars.join(""); }

// FunctionCallArgGuarded: like FunctionCallArg but prevents SETTINGS keyword from being consumed as a column
// ref when it is starting a settings clause (SETTINGS identifier = value). This allows:
//   f(SETTINGS x=1)     → SETTINGS is a clause keyword
//   has(Settings, 'x')  → Settings is an identifier (map)
//   Settings['key']     → Settings is a map with subscript access
FunctionCallArgGuarded
  = !( KW_SETTINGS _ [a-zA-Z_][a-zA-Z0-9_]* _ "=" ) arg:FunctionCallArg { return arg; }

// FunctionCallArgList supports multi-param lambdas written without parens:
// e.g. arrayFold(acc, x -> acc + x, [...], init)
// The multi-param lambda consumes all leading identifiers up to the "->".
// Trailing comma is allowed (e.g. if(a, b, c,) — ClickHouse extension).
FunctionCallArgList
  = head:FunctionCallArgGuarded tail:(_ "," _ FunctionCallArgGuarded)* ( _ "," )? {
      return buildCommaList(head, tail);
    }

FunctionCallArg
  = params:MultiLambdaParams _ "->" _ body:Expression {
      return loc({ kind: 'lambdaExpr', params: params, body: body });
    }
  / &(KW_SELECT / KW_WITH) query:UnionQuery {
      return loc({ kind: 'subqueryExpr', query: query });
    }
  // Support implicit aliases in function args: f(expr alias, ...) — ClickHouse extension
  / ExpressionWithImplicitAlias
  // Allow keywords as column name identifiers in function args (e.g. sum(DISTINCT), repeat(ALL, 5))
  / name:AliasName &(_ (")" / ",")) { return loc({ kind: 'columnRef', parts: [name] }); }

// Matches two or more comma-separated identifiers before "->".
// The final identifier uses a lookahead to confirm "->" follows.
MultiLambdaParams
  = head:Identifier _ "," _ tail:MultiLambdaParamsTail {
      return [head, ...tail];
    }

MultiLambdaParamsTail
  = name:Identifier _ "," _ rest:MultiLambdaParamsTail {
      return [name, ...rest];
    }
  / name:Identifier &(_ "->") {
      return [name];
    }

ColumnRef
  // Multi-part qualified name: first.second[.third...] — supports arbitrary nesting depth.
  // e.g. t.col, system.one.dummy, nested.nest.a.b.c (JSON subcolumns).
  // Also supports digit-prefixed identifiers (e.g. 02337_db.table.col),
  // QueryParam identifiers (e.g. {DB:Identifier}.table),
  // JSON object subcolumn ^ prefix (e.g. json.^a), and array subscript suffix (e.g. arr.k1[]).
  = first:ColumnRefFirst rest:( _ "." _ part:ColumnRefCont { return part; } )+ {
      return loc({ kind: 'columnRef', parts: [first, ...rest] });
    }
  // Unqualified: plain identifier (keyword-guarded) or digit-prefixed identifier
  / name:Identifier { return loc({ kind: 'columnRef', parts: [name] }); }
  / name:$([0-9][a-zA-Z0-9_$]+) { return loc({ kind: 'columnRef', parts: [name] }); }

// First part of a column ref: regular identifier, QueryParam-as-identifier, digit-prefixed identifier,
// or any AliasName (allows reserved keywords as table-alias qualifiers like "join.n")
ColumnRefFirst
  = Identifier
  / QueryParamIdentifier
  / $([0-9][a-zA-Z0-9_$]+)
  / AliasName

// Continuation part of a column ref path (after a ".")
// Guards: not digit (tuple element access .1 handled by PrimaryExprSuffix), not ":" (json subcolumn .: handled separately), not "*" (qualified asterisk)
// Supports: ^name (JSON object subcolumn), name[] (JSON array subcolumn), regular identifiers
ColumnRefCont
  = !([0-9:*]) "^" name:AliasName brackets:("[]")? { return "^" + name + (brackets !== null ? "[]" : ""); }
  / !([0-9:*]) name:AliasName brackets:("[]")? { return name + (brackets !== null ? "[]" : ""); }

// QualifiedAsterisk: one or more qualifiers followed by .* (e.g. t.*, system.one.*, {DB:Identifier}.tbl.*)
// Optionally followed by column transformers (EXCEPT, APPLY, REPLACE).
// The ![0-9*] guard on rest parts prevents consuming .* or numeric suffixes as qualifier parts.
// Supports QueryParamIdentifier and digit-prefixed identifiers (e.g. 02339_db.test_table.*) as the first qualifier.
QualifiedAsterisk
  = first:ColumnRefFirst rest:( _ "." _ ![*] part:Identifier { return part; } )* _ "." _ "*"
    transformers:( _ ColumnTransformer )* {
      const result = loc({ kind: 'qualifiedAsterisk', parts: [first, ...rest] });
      if (transformers.length > 0) result.transformers = transformers.map((t) => t[1]);
      return result;
    }

// Asterisk optionally followed by column transformers (EXCEPT, APPLY, REPLACE).
Asterisk
  = "*" transformers:( _ ColumnTransformer )* {
      const result = loc({ kind: 'asterisk' });
      if (transformers.length > 0) result.transformers = transformers.map((t) => t[1]);
      return result;
    }

// ColumnTransformer: modifier applied to * or qualifier.* — EXCEPT, APPLY, or REPLACE.
ColumnTransformer
  = ColumnTransformerExcept
  / ColumnTransformerApply
  / ColumnTransformerReplace

// EXCEPT column transformer: removes named columns from the asterisk expansion.
// Supports: EXCEPT (col, ...), EXCEPT col, EXCEPT 'pattern', EXCEPT ('pattern'), EXCEPT STRICT (col, ...), EXCEPT STRICT col
ColumnTransformerExcept
  = "EXCEPT"i ![a-zA-Z0-9_] _ "STRICT"i ![a-zA-Z0-9_] _ "(" _ cols:ColumnTransformerExceptList _ ")" {
      return { kind: 'except', columns: cols, strict: true };
    }
  / "EXCEPT"i ![a-zA-Z0-9_] _ "STRICT"i ![a-zA-Z0-9_] _ col:Identifier {
      return { kind: 'except', columns: [col], strict: true };
    }
  / "EXCEPT"i ![a-zA-Z0-9_] _ "(" _ cols:ColumnTransformerExceptList _ ")" {
      return { kind: 'except', columns: cols };
    }
  // EXCEPT with string pattern in parens: EXCEPT('regex') — regex-based column exclusion
  / "EXCEPT"i ![a-zA-Z0-9_] _ "(" _ str:StringLiteral _ ")" {
      return { kind: 'except', columns: [str.value], pattern: true };
    }
  / "EXCEPT"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return { kind: 'except', columns: [str.value], pattern: true };
    }
  // EXCEPT bare column name without parens: EXCEPT col
  / "EXCEPT"i ![a-zA-Z0-9_] _ col:Identifier {
      return { kind: 'except', columns: [col] };
    }

// List of column names (identifiers or backtick-quoted) for EXCEPT transformer
ColumnTransformerExceptList
  = head:Identifier tail:( _ "," _ Identifier )* {
      return [head, ...tail.map((t) => t[3])];
    }

// APPLY column transformer: applies a function to each matched column.
// Supports: APPLY(func), APPLY(lambda), APPLY name, APPLY lambda
ColumnTransformerApply
  = "APPLY"i ![a-zA-Z0-9_] _ "(" _ func:FunctionCallArg _ ")" {
      return { kind: 'apply', func: func };
    }
  / "APPLY"i ![a-zA-Z0-9_] _ func:LambdaExprNoParens {
      return { kind: 'apply', func: func };
    }
  // APPLY with a function call (e.g. APPLY lambda(tuple(x), x+1) — using lambda() builtin)
  / "APPLY"i ![a-zA-Z0-9_] _ func:FunctionCall {
      return { kind: 'apply', func: func };
    }
  / "APPLY"i ![a-zA-Z0-9_] _ name:Identifier {
      return { kind: 'apply', func: loc({ kind: 'columnRef', parts: [name] }) };
    }

// REPLACE column transformer: replaces column values with expressions.
// Supports: REPLACE(expr AS col, ...), REPLACE STRICT(expr AS col, ...), REPLACE expr AS col
ColumnTransformerReplace
  = "REPLACE"i ![a-zA-Z0-9_] _ "STRICT"i ![a-zA-Z0-9_] _ "(" _ items:ReplaceItemList _ ")" {
      return { kind: 'replace', items: items, strict: true };
    }
  / "REPLACE"i ![a-zA-Z0-9_] _ "STRICT"i ![a-zA-Z0-9_] _ item:ReplaceItem {
      return { kind: 'replace', items: [item], strict: true };
    }
  / "REPLACE"i ![a-zA-Z0-9_] _ "(" _ items:ReplaceItemList _ ")" {
      return { kind: 'replace', items: items };
    }
  / "REPLACE"i ![a-zA-Z0-9_] _ item:ReplaceItem {
      return { kind: 'replace', items: [item] };
    }

ReplaceItemList
  = head:ReplaceItem tail:( _ "," _ ReplaceItem )* {
      return [head, ...tail.map((t) => t[3])];
    }

// Single REPLACE item: expr AS colName
ReplaceItem
  = expr:TernaryExpr _ KW_AS _ alias:Identifier {
      return { expr, alias };
    }

// COLUMNS expression: COLUMNS(args) optionally preceded by a table qualifier and optionally followed by transformers.
// Without transformers or qualifier, COLUMNS(...) falls through to FunctionCall (preserving original casing).
// With transformers or qualifier (APPLY, EXCEPT, REPLACE, or table.COLUMNS(...)), it becomes a ColumnsExpr node.
// Qualifier can be a multi-part path (e.g. db.table.COLUMNS('^c'), 02339_db.test_table.COLUMNS(id)).
ColumnsExpr
  // [db.]table.COLUMNS(args) — table-qualified columns expression, e.g. t.COLUMNS('^c'), db.tbl.COLUMNS('^c')
  // Uses ColumnRefFirst for the first part to support digit-prefixed identifiers and QueryParamIdentifiers.
  = first:ColumnRefFirst rest:( _ "." _ !( "COLUMNS"i _ "(" ) part:ColumnRefCont { return part; } )* _ "." _ "COLUMNS"i _ "(" _ args:FunctionCallArgList _ ")" transformers:( _ ColumnTransformer )* {
      const qualPath = [first, ...rest];
      const result = loc({ kind: 'columnsExpr', args, qualifier: qualPath.join('.') });
      if (transformers.length > 0) result.transformers = transformers.map((t) => t[1]);
      return result;
    }
  / "COLUMNS"i _ "(" _ args:FunctionCallArgList _ ")" _ head:ColumnTransformer rest:( _ ColumnTransformer )* {
      const transformers = [head, ...rest.map((t) => t[1])];
      return loc({ kind: 'columnsExpr', args, transformers });
    }

// ── Literals & identifiers ────────────────────────────────────────────────────

// IntegerLiteral supports underscore digit separators (e.g., 1_000_000).
// Uses proper separator pattern: no leading/trailing _ and no double __.
// Removes underscores and leading zeros for normalization.
// Values exceeding UInt64 max (18446744073709551615) become Float64.
// The ![a-zA-Z_] guard prevents consuming the digit prefix of digit-prefixed identifiers like 02337_db.
IntegerLiteral
  = digits:$([0-9]+("_"[0-9]+)*) ![a-zA-Z_] {
      const normalized = digits.replace(/_/g, '').replace(/^0+/, '') || '0';
      const UINT64_MAX = BigInt('18446744073709551615');
      if (normalized.length > 20 || (normalized.length >= 20 && BigInt(normalized) > UINT64_MAX)) {
        // Keep original string to preserve precision for CAST contexts
        return loc({ kind: 'literal', type: 'Float64', value: normalized });
      }
      return loc({ kind: 'literal', type: 'UInt64', value: normalized });
    }

// StringLiteral: decodes hex escape sequences as UTF-8 bytes (collecting consecutive \xNN
// sequences and decoding them together to handle multi-byte UTF-8 characters like \xD0\xA0 → 'Р').
StringLiteral
  // Unicode left/right single quotes (no escape processing - backslashes stored doubled)
  = "\u2018" chars:UnicodeQuoteChar* "\u2019" {
      return loc({ kind: 'literal', type: 'String', value: chars.join('') });
    }
  / "'" chars:StringChar* "'" {
      // Collect consecutive hex byte objects and decode as UTF-8
      const parts = [];
      let hexBuf = [];
      for (const c of chars) {
        if (c !== null && typeof c === 'object' && c.hexByte !== undefined) {
          hexBuf.push(c.hexByte);
        } else {
          if (hexBuf.length > 0) {
            parts.push(new TextDecoder('utf-8', { fatal: false }).decode(new Uint8Array(hexBuf)));
            hexBuf = [];
          }
          parts.push(c);
        }
      }
      if (hexBuf.length > 0) {
        parts.push(new TextDecoder('utf-8', { fatal: false }).decode(new Uint8Array(hexBuf)));
      }
      return loc({ kind: 'literal', type: 'String', value: parts.join('') });
    }

// StringChar: processes escape sequences inside single-quoted strings.
// \a and \v are decoded to control characters; \x hex escapes return a raw byte object
// (collected and UTF-8 decoded by StringLiteral).
// Other recognized escapes (\b \f \n \r \t \0 \\ \' \") are stored as two-char sequences
// (preserving the backslash) so that explain output can re-escape them correctly.
// Unrecognized escapes before a word character [a-zA-Z_] keep the backslash (stored as
// two backslashes + char, matching ClickHouse behavior). Other unrecognized escapes drop it.
StringChar
  = "''" { return "'"; }
  / "\\a" { return '\x07'; }
  / "\\e" { return '\x1b'; }
  / "\\v" { return '\x0b'; }
  / "\\\\" { return '\\\\'; }
  / "\\b" { return '\\b'; }
  / "\\f" { return '\\f'; }
  / "\\n" { return '\\n'; }
  / "\\r" { return '\\r'; }
  / "\\t" { return '\\t'; }
  / "\\0" { return '\\0'; }
  / "\\'" { return "'"; }
  / '\\"' { return '"'; }
  / "\\x" hi:[0-9a-fA-F] lo:[0-9a-fA-F] {
      return { hexByte: parseInt(hi + lo, 16) };
    }
  / "\\" c:[a-zA-Z_] { return '\\\\' + c; }
  / "\\" c:. { return '\\\\' + c; }
  / [^'\\] { return text(); }

// UnicodeQuoteChar: characters inside Unicode-quoted strings (no escape processing).
// Backslashes are doubled so that escapeStringValue in explain.ts produces correct output.
// Exception: backslash immediately before the closing \u2019 is discarded (ClickHouse behavior).
UnicodeQuoteChar
  = "\\" &"\u2019" { return '\\\\'; }  // backslash before closing quote is doubled
  / "\\" { return '\\\\'; }
  / !"\u2019" c:. { return c; }

// QueryParamIdentifier: a query parameter substituted as an identifier at runtime
// e.g. {CLICKHOUSE_DATABASE:Identifier} used in FROM {DB:Identifier}.tablename
QueryParamIdentifier
  = "{" _ name:$[a-zA-Z0-9_]+ _ ":" _ "Identifier"i ![a-zA-Z0-9_] _ "}" {
      return '{' + name + ':Identifier}';
    }

TableRef
  = db:( QueryParamIdentifier / AliasName ) _ "." _ table:( QueryParamIdentifier / AliasName ) {
      return loc({ kind: 'tableRef', database: db, table: table });
    }
  / table:( QueryParamIdentifier / AliasName ) {
      return loc({ kind: 'tableRef', table: table });
    }

// Identifier: bare word (not a keyword) or quoted identifier
Identifier
  = word:$([a-zA-Z_] [a-zA-Z0-9_]*) &{ return !KEYWORDS.has(word.toUpperCase()); } { return word; }
  / '"' chars:DoubleQuotedChar* '"' { return chars.join(""); }
  / '`' chars:BacktickChar* '`' { return chars.join(""); }
  // Unicode "smart quotes": \u201c...\u201d (left/right double quotation marks)
  / "\u201c" chars:$(!"\u201d" .)* "\u201d" { return chars; }

// AliasName: like Identifier but allows reserved keywords (e.g. AS AND, AS OR),
// also allows dollar signs and digit-starting identifiers (ClickHouse extension)
AliasName
  = head:[a-zA-Z_$] tail:[a-zA-Z0-9_$]* { return head + tail.join(""); }
  / head:[0-9] tail:[a-zA-Z0-9_$]* { return head + tail.join(""); }
  / '"' chars:DoubleQuotedChar* '"' { return chars.join(""); }
  / '`' chars:BacktickChar* '`' { return chars.join(""); }
  / "\u201c" chars:$(!"\u201d" .)* "\u201d" { return chars; }

DoubleQuotedChar
  = '""' { return '"'; }
  / '\\"' { return '"'; }
  / '\\\\' { return '\\'; }
  / '\\' c:. { return '\\' + c; }
  / [^"\\] { return text(); }

BacktickChar
  = '``' { return '`'; }
  // Hex escape: \xNN → byte decoded as UTF-8 (invalid bytes become U+FFFD)
  / '\\x' hex:$([0-9a-fA-F][0-9a-fA-F]) { return Buffer.from([parseInt(hex, 16)]).toString('utf8'); }
  // Null escape: \0 → null byte
  / '\\0' { return '\0'; }
  / '\\' char:. { return char; }
  / [^`\\] { return text(); }

// ── Keywords (must not be followed by an alphanumeric/underscore) ─────────────

// Keyword: matches any reserved keyword (word boundary enforced)
Keyword
  = word:$([a-zA-Z_] [a-zA-Z0-9_]*) &{ return KEYWORDS.has(word.toUpperCase()); }

KW_WITH      = "WITH"i      ![a-zA-Z0-9_]
KW_AS        = "AS"i        ![a-zA-Z0-9_]
KW_SELECT    = "SELECT"i    ![a-zA-Z0-9_]
KW_FROM      = "FROM"i      ![a-zA-Z0-9_]
KW_PREWHERE  = "PREWHERE"i  ![a-zA-Z0-9_]
KW_WHERE     = "WHERE"i     ![a-zA-Z0-9_]
KW_GROUP     = "GROUP"i     ![a-zA-Z0-9_]
KW_ORDER     = "ORDER"i     ![a-zA-Z0-9_]
KW_BY        = "BY"i        ![a-zA-Z0-9_]
KW_HAVING    = "HAVING"i    ![a-zA-Z0-9_]
KW_LIMIT     = "LIMIT"i     ![a-zA-Z0-9_]
KW_OFFSET    = "OFFSET"i    ![a-zA-Z0-9_]
KW_AND       = "AND"i       ![a-zA-Z0-9_]
KW_OR        = "OR"i        ![a-zA-Z0-9_]
KW_ASC       = s:"ASC"i     ![a-zA-Z0-9_] { return s; }
KW_DESC      = s:"DESC"i    ![a-zA-Z0-9_] { return s; }
KW_IN        = "IN"i        ![a-zA-Z0-9_]
KW_NOT       = "NOT"i       ![a-zA-Z0-9_]
KW_DISTINCT  = "DISTINCT"i  ![a-zA-Z0-9_]
KW_FINAL     = "FINAL"i     ![a-zA-Z0-9_]
KW_JOIN      = "JOIN"i      ![a-zA-Z0-9_]
KW_INNER     = "INNER"i     ![a-zA-Z0-9_]
KW_LEFT      = "LEFT"i      ![a-zA-Z0-9_]
KW_RIGHT     = "RIGHT"i     ![a-zA-Z0-9_]
KW_FULL      = "FULL"i      ![a-zA-Z0-9_]
KW_CROSS     = "CROSS"i     ![a-zA-Z0-9_]
KW_OUTER     = "OUTER"i     ![a-zA-Z0-9_]
KW_ARRAY     = "ARRAY"i     ![a-zA-Z0-9_]
KW_ON        = "ON"i        ![a-zA-Z0-9_]
KW_USING     = "USING"i     ![a-zA-Z0-9_]
KW_SETTINGS  = "SETTINGS"i  ![a-zA-Z0-9_]
KW_TOTALS    = "TOTALS"i    ![a-zA-Z0-9_]
KW_ALL       = "ALL"i       ![a-zA-Z0-9_]
KW_ANY       = "ANY"i       ![a-zA-Z0-9_]
KW_SEMI      = "SEMI"i      ![a-zA-Z0-9_]
KW_ANTI      = "ANTI"i      ![a-zA-Z0-9_]
KW_ASOF      = "ASOF"i      ![a-zA-Z0-9_]
KW_GLOBAL    = "GLOBAL"i    ![a-zA-Z0-9_]
KW_UNION     = "UNION"i     ![a-zA-Z0-9_]
KW_LIKE      = "LIKE"i      ![a-zA-Z0-9_]
KW_ILIKE     = "ILIKE"i     ![a-zA-Z0-9_]
KW_BETWEEN   = "BETWEEN"i   ![a-zA-Z0-9_]
KW_FORMAT    = "FORMAT"i    ![a-zA-Z0-9_]
KW_WINDOW    = "WINDOW"i    ![a-zA-Z0-9_]

// Whitespace rule: matches zero or more whitespace characters and comments.
// Returns { trailing: string[], leading: string[] } where:
//   trailing = comments on the same line as the preceding token (before any newline)
//   leading  = comments after a newline (on their own line or leading the next token)
// Use flattenWs(ws) to get all comments as a flat array.
_ "whitespace"
  = trailing:_HWS newlineContent:_NLC* {
      const leading = [];
      for (const nc of newlineContent) {
        for (const item of nc) {
          if (item !== null) leading.push(item);
        }
      }
      return { trailing, leading };
    }

// Horizontal whitespace + comments (no newlines consumed)
_HWS
  = items:([ \t\u00A0\u2003\u3000\uFEFF]+ { return null; } / SingleLineComment / MultiLineComment)* {
      return items.filter((item) => item !== null);
    }

// Newline(s) followed by optional horizontal whitespace + comments
_NLC
  = [\n\r]+ items:([ \t\u00A0\u2003\u3000\uFEFF]+ { return null; } / SingleLineComment / MultiLineComment)* {
      return items;
    }

SingleLineComment
  // Supports --, #!, #<space>, and // comment styles (all used in ClickHouse SQL files)
  = ("--" / "#!" / "# " / "//") (![\n] .)* { return text(); }

// MultiLineComment supports nested block comments: /* ... /* ... */ ... */
MultiLineComment
  = "/*" MultiLineCommentContent* "*/" { return text(); }

MultiLineCommentContent
  = MultiLineComment
  / !"*/" . { return text(); }
