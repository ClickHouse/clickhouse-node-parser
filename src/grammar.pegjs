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

// Statements is the top-level rule, supporting UNION ALL and FORMAT clauses
// Allows empty input (e.g., SQL files containing only comments)
Statements
  = pre:_ head:TopLevelStatement headWs:_
    rest:(";"+ ws2:_ TopLevelStatement ws3:_)*
    ";"* finalWs:_ {
      var preComments = flattenWs(pre);
      if (preComments.length > 0) head.leadingComments = preComments.concat(head.leadingComments || []);
      // headWs: .trailing = same-line after head → trailing on head
      // headWs: .leading = after-newline before ";" → deferred to next stmt (or trailing on last if single stmt)
      if (headWs.trailing.length > 0) head.trailingComments = (head.trailingComments || []).concat(headWs.trailing);
      var pendingLeading = headWs.leading;
      var stmts = [head];
      for (var i = 0; i < rest.length; i++) {
        var ws2val = rest[i][1]; // after ";"
        var stmt = rest[i][2];
        var ws3val = rest[i][3]; // after stmt
        // Same-line after ";" → trailing on prev stmt
        if (ws2val.trailing.length > 0) {
          var prev = stmts[stmts.length - 1];
          prev.trailingComments = (prev.trailingComments || []).concat(ws2val.trailing);
        }
        // Pending from prev iteration + after-newline after ";" → leading on this stmt
        var leading = pendingLeading.concat(ws2val.leading);
        if (leading.length > 0) {
          stmt.leadingComments = leading.concat(stmt.leadingComments || []);
        }
        // Same-line after stmt → trailing on this stmt
        if (ws3val.trailing.length > 0) {
          stmt.trailingComments = (stmt.trailingComments || []).concat(ws3val.trailing);
        }
        // After-newline after stmt → deferred to next iteration
        pendingLeading = ws3val.leading;
        stmts.push(stmt);
      }
      var last = stmts[stmts.length - 1];
      var endComments = pendingLeading.concat(flattenWs(finalWs));
      if (endComments.length > 0) {
        last.trailingComments = (last.trailingComments || []).concat(endComments);
      }
      return stmts;
    }
  / _ { return []; }

// A top-level statement is either an EXPLAIN or a union query with optional INTO OUTFILE, FORMAT, and SETTINGS clauses
// SETTINGS can appear before FORMAT (inside SELECT) or after FORMAT
TopLevelStatement
  = ExplainStatement
  / SetStatement
  / UseStatement
  / SystemStatement
  / query:UnionQuery intoOutfile:( _ IntoOutfileClause )? preSettings:( _ SettingsClause )? format:( _ FormatClause )? postSettings:( _ SettingsClause )* {
      var result = query;
      if (intoOutfile !== null) {
        result = Object.assign({}, result, { intoOutfile: intoOutfile[1] });
      }
      if (format !== null) {
        result = Object.assign({}, result, { format: format[1] });
      }
      // Pre-format settings (SETTINGS clause before FORMAT)
      if (preSettings !== null) {
        result = Object.assign({}, result, { preFormatSettings: preSettings[1] });
      }
      // Post-format settings (SETTINGS after FORMAT)
      if (postSettings.length > 0) {
        var merged = postSettings.reduce(function(acc, s) { return acc.concat(s[1]); }, []);
        result = Object.assign({}, result, { postFormatSettings: merged });
      }
      return result;
    }

// IntoOutfileClause: INTO OUTFILE 'path' [TRUNCATE] — output redirection
IntoOutfileClause
  = "INTO"i ![a-zA-Z0-9_] _ "OUTFILE"i ![a-zA-Z0-9_] _ path:StringLiteral ( _ "TRUNCATE"i ![a-zA-Z0-9_] )? { return path; }

// SetStatement: SET key = value [, key = value ...] — changes session-level settings
SetStatement
  = "SET"i ![a-zA-Z0-9_] _ items:SettingsList { return { kind: 'set', settings: items }; }

// UseStatement: USE database — selects the current database
UseStatement
  = "USE"i ![a-zA-Z0-9_] _ db:AliasName { return { kind: 'use', database: db }; }

// SystemStatement: SYSTEM FLUSH LOGS, SYSTEM RELOAD CONFIG, etc. — admin commands (body discarded)
SystemStatement
  = "SYSTEM"i ![a-zA-Z0-9_] body:$( ![\n;] . )+ { return { kind: 'system', body: body.trim() }; }

// ExplainStatement: EXPLAIN [AST|SYNTAX|QUERY TREE|PLAN|PIPELINE|ESTIMATE|TABLE OVERRIDE] [settings] [query] [FORMAT ...]
// Settings are key=value pairs without the SETTINGS keyword (e.g. EXPLAIN actions=1 SELECT ...).
ExplainStatement
  = "EXPLAIN"i ![a-zA-Z0-9_] _
    type:ExplainType? _
    settings:ExplainSettingsList? _
    query:UnionQuery?
    format:( _ FormatClause )?
    postSettings:( _ SettingsClause )? {
      var result = { kind: 'explain' };
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
      return [head, ...tail.map(function(t) { return t[3]; })];
    }

// ExplainSettingItem: key = value pair (must be followed by '=' to avoid consuming SELECT as a setting name)
ExplainSettingItem
  = name:SettingName _ "=" _ value:UnaryExpr {
      return { name: name, value: value };
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
      var result = head;
      for (var i = 0; i < tail.length; i++) {
        var op = tail[i][1];
        var right = tail[i][3];
        var comments = flattenWs(tail[i][0]).concat(flattenWs(tail[i][2]));
        if (comments.length > 0) {
          right = Object.assign({}, right, {
            leadingComments: comments.concat(right.leadingComments || [])
          });
        }
        if (op === 'UNION') {
          // UNION ALL: flatten into existing union (if it's also ALL)
          if (result.kind === 'union' && !result.unionMode) {
            result = { kind: 'union', queries: result.queries.concat([right]) };
          } else {
            result = { kind: 'union', queries: [result, right] };
          }
        } else if (op === 'UNION DISTINCT') {
          // UNION DISTINCT: always create a new union node with mode
          result = { kind: 'union', queries: [result, right], unionMode: 'DISTINCT' };
        } else {
          result = { kind: 'intersect', op: op, left: result, right: right };
        }
      }
      return result;
    }

// IntersectQuery: INTERSECT at higher precedence than EXCEPT/UNION (left-assoc).
IntersectQuery
  = head:UnionQueryAtom tail:( _ IntersectOp _ UnionQueryAtom )* {
      if (tail.length === 0) return head;
      var result = head;
      for (var i = 0; i < tail.length; i++) {
        var right = tail[i][3];
        var comments = flattenWs(tail[i][0]).concat(flattenWs(tail[i][2]));
        if (comments.length > 0) {
          right = Object.assign({}, right, {
            leadingComments: comments.concat(right.leadingComments || [])
          });
        }
        result = { kind: 'intersect', op: 'INTERSECT', left: result, right: right };
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
      var bq = flattenWs(beforeQuery);
      if (bq.length > 0) {
        query = Object.assign({}, query, {
          leadingComments: bq.concat(query.leadingComments || [])
        });
      }
      var aq = flattenWs(afterQuery);
      if (aq.length > 0) {
        query = Object.assign({}, query, {
          trailingComments: (query.trailingComments || []).concat(aq)
        });
      }
      // Mark bare parenthesized selects so they can be wrapped in SelectWithUnionQuery
      // when they appear inside INTERSECT/EXCEPT or UNION DISTINCT
      if (query.kind === 'select') return Object.assign({}, query, { parenthesized: true });
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
      var result = {};
      result.kind = 'select';
      var withTrailingComments = [];
      if (withClause !== null) {
        var wcd = withClause[0];
        result.with = wcd.items;
        var kwComments = flattenWs(wcd.keywordComments);
        if (kwComments.length > 0) result.leadingComments = kwComments;
        withTrailingComments = flattenWs(withClause[1]);
      }
      // Distinct clause
      var distVal = distinct !== null ? distinct[0] : null;
      if (distVal !== null && typeof distVal === 'object' && distVal.kind === 'distinctOn') {
        result.distinct = { kind: 'distinctOn', on: distVal.on };
      } else {
        var distStr = Array.isArray(distVal) ? distVal[0] : distVal;
        if (distStr !== null && distStr !== undefined && distStr.toString().toUpperCase() === 'DISTINCT') result.distinct = { kind: 'distinct' };
      }
      result.select = select;
      // selectTrailing: same-line comments after the last select item (from _HWS)
      var _selectTrailing = selectTrailing;
      if (from !== null) {
        result.from = from[1];
        var fromLeading = flattenWs(from[0]);
        if (fromLeading.length > 0) result.fromLeadingComments = fromLeading;
      }
      // Keep prewhere and where as separate fields for correct explain output
      if (prewhere !== null) {
        var pw = prewhere[1];
        var pwc = flattenWs(prewhere[0]);
        if (pwc.length > 0) pw = Object.assign({}, pw, { leadingComments: pwc.concat(pw.leadingComments || []) });
        result.prewhere = pw;
      }
      if (where !== null) {
        var w = where[1];
        var wc = flattenWs(where[0]);
        if (wc.length > 0) w = Object.assign({}, w, { leadingComments: wc.concat(w.leadingComments || []) });
        result.where = w;
      }
      // WITH TOTALS/CUBE/ROLLUP modifiers (can appear without GROUP BY)
      var wm = withModifier1 !== null ? withModifier1[1] : (withModifier2 !== null ? withModifier2[1] : null);
      if (wm !== null) {
        if (wm === 'TOTALS') result.withTotals = true;
        if (wm === 'ROLLUP') result.withRollup = true;
        if (wm === 'CUBE') result.withCube = true;
      }
      // GROUP BY clause (discriminated union)
      if (groupBy !== null) {
        var gb = groupBy[1];
        var gbc = flattenWs(groupBy[0]);
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
          var gbItems = gb.items;
          if (gbc.length > 0 && gbItems.length > 0) {
            var gbFirst = gbItems[0];
            gbItems = gbItems.slice();
            gbItems[0] = Object.assign({}, gbFirst, {
              leadingComments: gbc.concat(gbFirst.leadingComments || [])
            });
          }
          result.groupBy = { kind: 'expressions', items: gbItems };
          if (gb.withTotals) result.withTotals = true;
          if (gb.withCube) result.withCube = true;
          if (gb.withRollup) result.withRollup = true;
        }
      }
      if (having !== null) {
        var hv = having[1];
        var hvc = flattenWs(having[0]);
        if (hvc.length > 0) hv = Object.assign({}, hv, { leadingComments: hvc.concat(hv.leadingComments || []) });
        result.having = hv;
      }
      if (orderBy !== null) {
        result.orderBy = orderBy[1];
      }
      // LIMIT BY clause
      if (limitBy !== null) {
        var lb = limitBy[1];
        result.limitBy = { count: lb.count, by: lb.by };
        if (lb.limitByOffset !== undefined) result.limitBy.offset = lb.limitByOffset;
      }
      // LIMIT clause
      if (limit !== null) {
        var lc = limit[1];
        var limitObj = { count: lc.count };
        if (lc.comma) { result.offset = lc.offset; limitObj.commaSyntax = true; }
        if (lc.withTies) limitObj.withTies = true;
        result.limit = limitObj;
      }
      // Standalone OFFSET clause
      if (offset !== null) result.offset = offset[1];
      // SQL standard FETCH NEXT n ROWS ONLY/WITH TIES — overrides limit count
      if (fetch !== null) {
        var fc = fetch[1];
        if (!result.limit) result.limit = {};
        result.limit.count = fc.count;
        if (fc.withTies) result.limit.withTies = true;
      }
      var windows = window1 !== null ? window1[1] : (window2 !== null ? window2[1] : null);
      if (windows !== null) result.windows = windows;
      var qualify = qualify1 !== null ? qualify1 : qualify2;
      if (qualify !== null) {
        var qe = qualify[1];
        var qec = flattenWs(qualify[0]);
        if (qec.length > 0) qe = Object.assign({}, qe, { leadingComments: qec.concat(qe.leadingComments || []) });
        result.qualify = qe;
      }
      if (settings !== null) result.settings = settings[1];
      // SELECT TOP n — sets the limit (SQL Server compat syntax)
      if (top !== null && result.limit === undefined) result.limit = { count: top[3] };
      // Comments between WITH block/SELECT keyword and first item → leadingComments on first select item
      var selectCommentsFlat = withTrailingComments.concat(flattenWs(selectComments));
      if (selectCommentsFlat.length > 0 && result.select.length > 0) {
        var firstItem = result.select[0];
        result.select[0] = Object.assign({}, firstItem, {
          leadingComments: selectCommentsFlat.concat(firstItem.leadingComments || [])
        });
      }
      // Trailing same-line comment after the last select item:
      // If clauses follow, attach to the last select item (it will appear inline before the next clause).
      // If no clauses follow, store as statement-level trailingComments (Statements rule will merge).
      if (_selectTrailing.length > 0) {
        var hasFollowingClause = result.from || result.prewhere || result.where || result.groupBy
          || result.having || result.orderBy || result.limitBy || result.limit || result.offset
          || result.windows || result.qualify || result.settings;
        if (hasFollowingClause) {
          var lastItem = result.select[result.select.length - 1];
          result.select[result.select.length - 1] = Object.assign({}, lastItem, {
            trailingComments: (lastItem.trailingComments || []).concat(_selectTrailing)
          });
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
      var items = [head];
      for (var i = 0; i < tail.length; i++) {
        // ws1 (before comma): all comments → leading on next item (preserves old behavior)
        // ws2 (after comma): .trailing → trailing on prev item, .leading → leading on next
        var ws1 = tail[i][0];
        var ws2 = tail[i][2];
        var trailing = ws2.trailing;
        var leading = flattenWs(ws1).concat(ws2.leading);
        if (trailing.length > 0) {
          var prev = items[items.length - 1];
          items[items.length - 1] = Object.assign({}, prev, {
            trailingComments: (prev.trailingComments || []).concat(trailing)
          });
        }
        var next = tail[i][3];
        if (leading.length > 0) {
          next = Object.assign({}, next, {
            leadingComments: leading.concat(next.leadingComments || [])
          });
        }
        items.push(next);
      }
      if (lastWs.length > 0) {
        var lastItem = items[items.length - 1];
        items[items.length - 1] = Object.assign({}, lastItem, {
          trailingComments: (lastItem.trailingComments || []).concat(lastWs)
        });
      }
      return items;
    }

CTEItem
// Subquery CTE: name AS (SELECT ...)
  = name:Identifier _ KW_AS _ "(" beforeQuery:_ query:UnionQuery afterQuery:_ ")" {
      var bq = flattenWs(beforeQuery);
      if (bq.length > 0) {
        query = Object.assign({}, query, {
          leadingComments: bq.concat(query.leadingComments || [])
        });
      }
      var aq = flattenWs(afterQuery);
      if (aq.length > 0) {
        query = Object.assign({}, query, {
          trailingComments: (query.trailingComments || []).concat(aq)
        });
      }
      return { kind: 'subquery', name: name, query: query };
    }
  // Expression CTE: expr AS name (ClickHouse extension)
  / expr:TernaryExpr afterExpr:_ KW_AS _ name:Identifier {
      var ae = flattenWs(afterExpr);
      if (ae.length > 0) {
        expr = Object.assign({}, expr, {
          trailingComments: (expr.trailingComments || []).concat(ae)
        });
      }
      return { kind: 'expr', name: name, expr: expr };
    }

// SelectItemList: supports optional trailing comma (ClickHouse extension).
// The !SelectClauseKeyword guard prevents clause-starting keywords (FROM, WHERE, etc.)
// from being consumed as select items via the last-resort AliasName rule.
SelectItemList
  = head:SelectItem tail:(_ "," _ !SelectClauseKeyword SelectItem)* (_ "," _)? {
      var items = [head];
      for (var i = 0; i < tail.length; i++) {
        var ws1 = tail[i][0]; // before comma
        var ws2 = tail[i][2]; // after comma
        var trailing = ws2.trailing;
        var leading = flattenWs(ws1).concat(ws2.leading);
        if (trailing.length > 0) {
          var prev = items[items.length - 1];
          items[items.length - 1] = Object.assign({}, prev, {
            trailingComments: (prev.trailingComments || []).concat(trailing)
          });
        }
        var next = tail[i][4];
        if (leading.length > 0) {
          next = Object.assign({}, next, { leadingComments: leading });
        }
        items.push(next);
      }
      return items;
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
        var inner = (expr.kind === 'alias' && typeof expr.alias === 'string' && expr.alias.charAt(0) === '@') ? expr.expr : expr;
        return { kind: 'alias', expr: inner, alias: alias };
      }
      return expr;
    }

SelectItemAlias
  = _ KW_AS _ alias:AliasName { return alias; }
  / _ !KW_FORMAT alias:Identifier { return alias; }

FromClause
  = KW_FROM comments:_ expr:JoinExpr {
      var c = flattenWs(comments);
      if (c.length > 0 && expr && typeof expr === 'object') {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return expr;
    }

JoinExpr
  = head:FromAtom tail:( _ JoinPart )* {
      return tail.reduce(function(acc, t) {
        return Object.assign({ left: acc }, t[1]);
      }, head);
    }

// FromAtom: a single table source — subquery, table function, or table reference.
// Each can have an optional alias, FINAL modifier (for ReplacingMergeTree dedup), and SAMPLE clause.
// e.g. (SELECT 1) AS t, numbers(10), system.one FINAL, my_table SAMPLE 0.1
FromAtom
  = "(" beforeQuery:_ query:UnionQuery afterQuery:_ ")" alias:FromAtomAlias? final:( _ KW_FINAL )? sample:( _ SampleClause )? {
      var bq = flattenWs(beforeQuery);
      if (bq.length > 0) {
        query = Object.assign({}, query, {
          leadingComments: bq.concat(query.leadingComments || [])
        });
      }
      var aq = flattenWs(afterQuery);
      if (aq.length > 0) {
        query = Object.assign({}, query, {
          trailingComments: (query.trailingComments || []).concat(aq)
        });
      }
      var result = { kind: 'subqueryFrom', query: query };
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
      var result = final !== null ? Object.assign({}, table, { final: true }) : table;
      if (sample !== null) result = Object.assign({}, result, { sample: sample[1] });
      if (alias !== null) result = Object.assign({}, result, { alias: typeof alias === 'object' ? alias.alias : alias });
      return result;
    }
  / table:TableRef alias:FromAtomAlias? final:( _ KW_FINAL )? sample:( _ SampleClause )? {
      var result = final !== null ? Object.assign({}, table, { final: true }) : table;
      if (sample !== null) result = Object.assign({}, result, { sample: sample[1] });
      if (alias !== null) result = Object.assign({}, result, { alias: typeof alias === 'object' ? alias.alias : alias });
      return result;
    }

// SampleClause: SAMPLE ratio [OFFSET ratio]
// Supports integer (e.g., SAMPLE 100), float (e.g., SAMPLE 0.1), and fraction (e.g., SAMPLE 1/10) forms,
// with an optional OFFSET ratio for sharding.
SampleClause
  = "SAMPLE"i ![a-zA-Z0-9_] _ ratio:SampleRatioExpr offset:( _ "OFFSET"i ![a-zA-Z0-9_] _ SampleRatioExpr )? {
      var result = { ratio: ratio };
      if (offset !== null) result.offset = offset[4];
      return result;
    }

// SampleRatioExpr: a ratio value, either a fraction (num/den) or a simple number
SampleRatioExpr
  = num:SampleNumber _ "/" _ den:SampleNumber { return { num: num, den: den }; }
  / num:SampleNumber { return { num: num }; }

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
  = _ KW_AS _ alias:AliasName cols:( _ "(" _ head:AliasName tail:( _ "," _ AliasName )* _ ")" { return [head].concat(tail.map(function(t) { return t[3]; })); } )? {
      return cols !== null ? { alias: alias, columnAliases: cols } : alias;
    }
  // Column aliases without table alias: (n1, n2) — standard SQL subquery column aliases
  / _ "(" _ head:AliasName tail:( _ "," _ AliasName )+ _ ")" {
      return { columnAliases: [head].concat(tail.map(function(t) { return t[3]; })) };
    }
  / _ !JoinKeyword !ArrayJoinKeyword !KW_FORMAT alias:Identifier { return alias; }

TableFunctionRef
  = name:FunctionName _ "(" _ args:TableFunctionArgList? settings:( ( _ "," )? _ KW_SETTINGS _ SettingsList )? _ ")" {
      var result = { kind: 'tableFunction', name: name, args: args !== null ? args : [] };
      if (settings !== null) result.settings = settings[4];
      return result;
    }

// TableFunctionArgList: like FunctionCallArgList but stops before a trailing ", SETTINGS ..."
TableFunctionArgList
  = head:FunctionCallArgGuarded tail:(_ "," _ FunctionCallArgGuarded)* {
      var items = [head];
      for (var i = 0; i < tail.length; i++) {
        var ws1 = tail[i][0];
        var ws2 = tail[i][2];
        var trailing = ws2.trailing;
        var leading = flattenWs(ws1).concat(ws2.leading);
        if (trailing.length > 0) {
          var prev = items[items.length - 1];
          items[items.length - 1] = Object.assign({}, prev, {
            trailingComments: (prev.trailingComments || []).concat(trailing)
          });
        }
        var next = tail[i][3];
        if (leading.length > 0) {
          next = Object.assign({}, next, {
            leadingComments: leading.concat(next.leadingComments || [])
          });
        }
        items.push(next);
      }
      return items;
    }

JoinPart
  = join_type:ArrayJoinKeyword _ exprs:ExpressionList {
      return { kind: 'arrayJoin', joinType: join_type, expressions: exprs };
    }
  / join_type:JoinKeyword _ right:FromAtom _ constraint:JoinConstraint {
      return { kind: 'join', joinType: join_type, right: right, constraint: constraint };
    }
  / join_type:JoinKeyword _ right:FromAtom {
      return { kind: 'join', joinType: join_type, right: right };
    }
  // Comma-separated tables: implicit CROSS JOIN without constraint
  / "," _ right:FromAtom {
      return { kind: 'join', joinType: 'CROSS', right: right };
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
  = KW_ON comments:_ expr:Expression {
      var c = flattenWs(comments);
      if (c.length > 0) {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return { kind: 'on', expr: expr };
    }
  / KW_USING _ "(" _ cols:UsingColumnList? _ ")" { return { kind: 'using', columns: cols !== null ? cols : [] }; }
  // USING * — wildcard join key (ClickHouse extension)
  / KW_USING _ "*" { return { kind: 'using', columns: ['*'] }; }
  / KW_USING _ cols:IdentifierList { return { kind: 'using', columns: cols }; }

// UsingColumnList: comma-separated identifiers with optional AS alias (alias is discarded)
UsingColumnList
  = head:UsingColumn tail:( _ "," _ UsingColumn )* {
      return [head, ...tail.map(function(t) { return t[3]; })];
    }

UsingColumn
  = name:Identifier _ KW_AS _ alias:AliasName { return { name: name, alias: alias }; }
  / name:Identifier { return name; }

IdentifierList
  = head:Identifier tail:( _ "," _ Identifier )* {
      return [head, ...tail.map(function(t) { return t[3]; })];
    }

// PrewhereClause: PREWHERE expr (treated same as WHERE for AST purposes)
PrewhereClause
  = KW_PREWHERE comments:_ expr:Expression {
      var c = flattenWs(comments);
      if (c.length > 0) {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return expr;
    }

WhereClause
  = KW_WHERE comments:_ expr:Expression {
      var c = flattenWs(comments);
      if (c.length > 0) {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return expr;
    }

GroupByClause
  = KW_GROUP _ KW_BY _ KW_ALL modifiers:GroupByModifier* {
      var withTotals = modifiers.some(function(m) { return m === 'TOTALS'; });
      var withCube = modifiers.some(function(m) { return m === 'CUBE'; });
      var withRollup = modifiers.some(function(m) { return m === 'ROLLUP'; });
      return { all: true, withTotals: withTotals, withCube: withCube, withRollup: withRollup };
    }
  / KW_GROUP _ KW_BY _ "GROUPING"i ![a-zA-Z0-9_] _ "SETS"i ![a-zA-Z0-9_] _ "(" _ sets:GroupingSets _ ")" modifiers:GroupByModifier* {
      var withTotals = modifiers.some(function(m) { return m === 'TOTALS'; });
      return { groupingSets: sets, withTotals: withTotals };
    }
  / KW_GROUP _ KW_BY keywordComments:_ exprList:ExpressionList modifiers:GroupByModifier* {
      var withTotals = modifiers.some(function(m) { return m === 'TOTALS'; });
      var withCube = modifiers.some(function(m) { return m === 'CUBE'; });
      var withRollup = modifiers.some(function(m) { return m === 'ROLLUP'; });
      // Attach keyword comments as leadingComments on the first item
      var items = exprList;
      var kc = flattenWs(keywordComments);
      if (kc.length > 0 && items.length > 0) {
        var first = items[0];
        items[0] = Object.assign({}, first, {
          leadingComments: kc.concat(first.leadingComments || [])
        });
      }
      return { items: items, withTotals: withTotals, withCube: withCube, withRollup: withRollup };
    }

// GroupingSets: comma-separated list of grouping sets (each set is a parenthesized list or bare expr)
GroupingSets
  = head:GroupingSet tail:(_ "," _ GroupingSet)* {
      return [head, ...tail.map(function(t) { return t[3]; })];
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
  = KW_HAVING comments:_ expr:Expression {
      var c = flattenWs(comments);
      if (c.length > 0) {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return expr;
    }

// QualifyClause: QUALIFY expr — filters rows after window functions, analogous to HAVING for aggregations
QualifyClause
  = "QUALIFY"i ![a-zA-Z0-9_] comments:_ expr:Expression {
      var c = flattenWs(comments);
      if (c.length > 0) {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return expr;
    }

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
      return [head, ...tail.map(function(t) { return t[3]; })];
    }

// WindowItem: name AS (window_spec) - single named window definition
// The window spec body is captured as raw text for re-emission in formatting
WindowItem
  = name:Identifier _ KW_AS _ "(" body:$OverBody* ")" {
      return { name: name, body: body };
    }

SettingsList
  = head:SettingItem tail:(_ "," _ SettingItem)* {
      return [head, ...tail.map(function(t) { return t[3]; })];
    }

// SettingName allows any identifier including reserved keywords (e.g. SETTINGS limit=5)
SettingName
  = head:[a-zA-Z_] tail:[a-zA-Z0-9_]* { return head + tail.join(''); }
  / '"' chars:DoubleQuotedChar* '"' { return chars.join(''); }
  / '`' chars:BacktickChar* '`' { return chars.join(''); }

SettingItem
  = name:SettingName _ "=" _ value:UnaryExpr {
      return { name: name, value: value };
    }
  // Bare setting name without value (e.g. SETTINGS force_index_by_date) — treated as = 1
  / name:SettingName {
      return { name: name, value: { kind: 'literal', type: 'UInt64', value: '1' } };
    }

// ── ORDER BY items ────────────────────────────────────────────────────────────

OrderByItemList
  = head:OrderByItem tail:(_ "," _ OrderByItem)* {
      return [head, ...tail.map(function(t) { return t[3]; })];
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
      var resolvedExpr = alias !== null ? { kind: 'alias', expr: expr, alias: alias[3] } : expr;
      var result = { kind: 'orderByItem', expr: resolvedExpr, direction: dir !== null ? dir[1].toUpperCase() : 'ASC' };
      if (collate !== null) result.collate = collate[4].value;
      if (fill !== null) {
        var fillArgs = fill[6];
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
      var result = {};
      if (from !== null && from[4] !== null) result.fillFrom = from[4];
      if (to !== null && to[4] !== null) result.fillTo = to[4];
      if (step !== null && step[4] !== null) result.fillStep = step[4];
      if (staleness !== null && staleness[4] !== null) result.fillStaleness = staleness[4];
      if (interp !== null) result.interpolate = interp[6];
      return result;
    }

// InterpolateList: list of column [AS expr] items inside INTERPOLATE (...)
InterpolateList
  = head:InterpolateItem tail:( _ "," _ InterpolateItem )* { return [head, ...tail.map(function(t) { return t[3]; })]; }
  / _ { return []; }

InterpolateItem
  = col:Identifier _ KW_AS _ expr:Expression { return { col: col, expr: expr }; }
  / col:Identifier { return { col: col }; }

// ── Expressions (precedence: ternary < OR < AND < comparison < add < mul < unary < primary) ────

ExpressionList
  = head:Expression tail:(_ "," _ Expression)* {
      var items = [head];
      for (var i = 0; i < tail.length; i++) {
        var ws1 = tail[i][0]; // before comma
        var ws2 = tail[i][2]; // after comma
        var trailing = ws2.trailing;
        var leading = flattenWs(ws1).concat(ws2.leading);
        if (trailing.length > 0) {
          var prev = items[items.length - 1];
          items[items.length - 1] = Object.assign({}, prev, {
            trailingComments: (prev.trailingComments || []).concat(trailing)
          });
        }
        var next = tail[i][3];
        if (leading.length > 0) {
          next = Object.assign({}, next, { leadingComments: leading });
        }
        items.push(next);
      }
      return items;
    }

// Expression: alias form or ternary expression
Expression
  = expr:TernaryExpr asWs:_ KW_AS _ alias:AliasName {
      // Unwrap auto-alias (e.g. @@varname) if an explicit AS alias is provided
      var inner = (expr.kind === 'alias' && typeof expr.alias === 'string' && expr.alias.charAt(0) === '@') ? expr.expr : expr;
      var ac = flattenWs(asWs);
      if (ac.length > 0) {
        inner = Object.assign({}, inner, {
          trailingComments: (inner.trailingComments || []).concat(ac)
        });
      }
      return { kind: 'alias', expr: inner, alias: alias };
    }
  / TernaryExpr

// ExpressionWithImplicitAlias: like Expression but also supports bare alias without AS keyword
// (ClickHouse extension). Used in function call args and special function syntax (SUBSTRING, TRIM, etc.)
// The implicit alias must be followed by a delimiter (, ) FROM FOR) to avoid ambiguity.
ExpressionWithImplicitAlias
  = expr:TernaryExpr asWs:_ KW_AS _ alias:AliasName {
      var inner = (expr.kind === 'alias' && typeof expr.alias === 'string' && expr.alias.charAt(0) === '@') ? expr.expr : expr;
      var ac = flattenWs(asWs);
      if (ac.length > 0) {
        inner = Object.assign({}, inner, {
          trailingComments: (inner.trailingComments || []).concat(ac)
        });
      }
      return { kind: 'alias', expr: inner, alias: alias };
    }
  // Bare alias without AS: must be followed by , ) FROM FOR (as delimiter of the argument context)
  / expr:TernaryExpr aliasWs:_ alias:Identifier &( _ ( "," / ")" / "FROM"i ![a-zA-Z0-9_] / "FOR"i ![a-zA-Z0-9_] ) ) {
      var ac2 = flattenWs(aliasWs);
      if (ac2.length > 0) {
        expr = Object.assign({}, expr, {
          trailingComments: (expr.trailingComments || []).concat(ac2)
        });
      }
      return { kind: 'alias', expr: expr, alias: alias };
    }
  / TernaryExpr

// TernaryExpr: ternary ? : operator, maps to Function if(cond, then, else)
TernaryExpr
  = cond:OrExpr ws1:_ "?" ws2:_ then:TernaryExpr ws3:_ ":" ws4:_ else_:TernaryExpr {
      var thenComments = flattenWs(ws1).concat(flattenWs(ws2));
      if (thenComments.length > 0) {
        then = Object.assign({}, then, {
          leadingComments: thenComments.concat(then.leadingComments || [])
        });
      }
      var elseComments = flattenWs(ws3).concat(flattenWs(ws4));
      if (elseComments.length > 0) {
        else_ = Object.assign({}, else_, {
          leadingComments: elseComments.concat(else_.leadingComments || [])
        });
      }
      return { kind: 'functionCall', name: 'if', args: [cond, then, else_] };
    }
  / OrExpr

// OrExpr: n-ary OR expression. Multiple OR operands at the same level are collected
// into a flat list, matching ClickHouse's EXPLAIN AST behavior. Parenthesized sub-expressions
// remain as separate nodes.
OrExpr
  = head:AndExpr tail:(_ KW_OR _ AndExpr)+ {
      var operands = [head];
      for (var i = 0; i < tail.length; i++) {
        var next = tail[i][3];
        var comments = flattenWs(tail[i][0]).concat(flattenWs(tail[i][2]));
        if (comments.length > 0) {
          next = Object.assign({}, next, {
            leadingComments: comments.concat(next.leadingComments || [])
          });
        }
        operands.push(next);
      }
      return { kind: 'naryExpr', op: 'OR', operands: operands };
    }
  / AndExpr

// AndExpr: n-ary AND expression. Multiple AND operands at the same level are collected
// into a flat list, matching ClickHouse's EXPLAIN AST behavior.
AndExpr
  = head:NotExpr tail:(_ KW_AND _ NotExpr)+ {
      var operands = [head];
      for (var i = 0; i < tail.length; i++) {
        var next = tail[i][3];
        var comments = flattenWs(tail[i][0]).concat(flattenWs(tail[i][2]));
        if (comments.length > 0) {
          next = Object.assign({}, next, {
            leadingComments: comments.concat(next.leadingComments || [])
          });
        }
        operands.push(next);
      }
      return { kind: 'naryExpr', op: 'AND', operands: operands };
    }
  / NotExpr

NotExpr
  // NOT followed by "(" is handled as a high-precedence function-call-like NOT in PrimaryBase;
  // exclude that case here so NOT (0) + NOT (0) parses as plus(not(0), not(0)) like ClickHouse does.
  = KW_NOT !( _ "(" ) comments:_ expr:NotExpr {
      var c = flattenWs(comments);
      if (c.length > 0) {
        expr = Object.assign({}, expr, {
          leadingComments: c.concat(expr.leadingComments || [])
        });
      }
      return { kind: 'unaryExpr', op: 'NOT', expr: expr };
    }
  / CompareExpr

// CompareExpr: handles IN, LIKE, IS, BETWEEN, and comparison operators.
// IN/LIKE/IS/BETWEEN results can optionally be followed by a comparison operator (e.g. k IN (100) = 1).
// CompareExpr: left-associative chain of comparison operators.
// Uses CompareRightExpr (not NotExpr) to avoid right-associativity — the right operand must not
// start a new comparison chain. E.g. k = (100) = 1 → equals(equals(k,100), 1).
CompareExpr
  = base:CompareBase rest:(_ op:CompareOp _ CompareRightExpr)* {
      return rest.reduce(function(acc, t) {
        var right = t[3];
        var comments = flattenWs(t[0]).concat(flattenWs(t[2]));
        if (comments.length > 0) {
          right = Object.assign({}, right, {
            leadingComments: comments.concat(right.leadingComments || [])
          });
        }
        return { kind: 'binaryExpr', op: t[1], left: acc, right: right };
      }, base);
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
      return function(left) {
        var result = Object.assign({ kind: 'inExpr', negated: negated !== null, expr: left }, target);
        if (global !== null) result.global = true;
        return result;
      };
    }
  // LIKE / ILIKE
  / _ negated:(KW_NOT _)? KW_ILIKE _ right:AddExpr {
      var name = negated !== null ? 'notILike' : 'ilike';
      return function(left) { return { kind: 'functionCall', name: name, args: [left, right] }; };
    }
  / _ negated:(KW_NOT _)? KW_LIKE _ right:AddExpr {
      var name = negated !== null ? 'notLike' : 'like';
      return function(left) { return { kind: 'functionCall', name: name, args: [left, right] }; };
    }
  // REGEXP
  / _ "REGEXP"i ![a-zA-Z0-9_] _ right:AddExpr {
      return function(left) { return { kind: 'functionCall', name: 'match', args: [left, right] }; };
    }
  // BETWEEN
  / _ KW_NOT _ KW_BETWEEN _ low:AddExpr _ KW_AND _ high:AddExpr {
      return function(left) {
        return {
          kind: 'functionCall', name: 'or', args: [
            { kind: 'functionCall', name: 'less', args: [left, low] },
            { kind: 'functionCall', name: 'greater', args: [left, high] }
          ]
        };
      };
    }
  / _ KW_BETWEEN _ low:AddExpr _ KW_AND _ high:AddExpr {
      return function(left) {
        return {
          kind: 'functionCall', name: 'and', args: [
            { kind: 'functionCall', name: 'greaterOrEquals', args: [left, low] },
            { kind: 'functionCall', name: 'lessOrEquals', args: [left, high] }
          ]
        };
      };
    }
  // IS [NOT] DISTINCT FROM / IS [NOT] NULL
  / _ "IS"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "DISTINCT"i ![a-zA-Z0-9_] _ "FROM"i ![a-zA-Z0-9_] _ right:AddExpr {
      return function(left) { return { kind: 'binaryExpr', op: '<=>', left: left, right: right }; };
    }
  / _ "IS"i ![a-zA-Z0-9_] _ "DISTINCT"i ![a-zA-Z0-9_] _ "FROM"i ![a-zA-Z0-9_] _ right:AddExpr {
      return function(left) { return { kind: 'binaryExpr', op: 'IS DISTINCT FROM', left: left, right: right }; };
    }
  // IS [NOT] NULL with optional arithmetic continuation: "x IS NOT NULL + 1" parses as plus(isNotNull(x), 1).
  // The arith tail allows arithmetic ops to bind tighter than comparison, matching ClickHouse precedence.
  / _ "IS"i ![a-zA-Z0-9_] _ "NOT"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] arith:( _ op:AddOp _ right:NotPrefixExpr )* {
      return function(left) {
        var base = { kind: 'functionCall', name: 'isNotNull', args: [left] };
        return arith.reduce(function(acc, t) {
          return { kind: 'binaryExpr', op: t[1], left: acc, right: t[3] };
        }, base);
      };
    }
  / _ "IS"i ![a-zA-Z0-9_] _ "NULL"i ![a-zA-Z0-9_] arith:( _ op:AddOp _ right:NotPrefixExpr )* {
      return function(left) {
        var base = { kind: 'functionCall', name: 'isNull', args: [left] };
        return arith.reduce(function(acc, t) {
          return { kind: 'binaryExpr', op: t[1], left: acc, right: t[3] };
        }, base);
      };
    }
  // Plain comparison operator
  / _ op:CompareOp _ right:CompareRightExpr {
      return function(left) { return { kind: 'binaryExpr', op: op, left: left, right: right }; };
    }

// InTarget: the target expression for IN — array literal, parenthesized list, or bare expression
InTarget
  = arr:ArrayLiteral { return { values: [arr] }; }
  / "(" beforeValues:_ values:InValues afterValues:_ ")" {
      // Attach comments to first/last value if they are expression nodes
      if (Array.isArray(values)) {
        var bv = flattenWs(beforeValues);
        if (bv.length > 0 && values.length > 0) {
          var first = values[0];
          values = values.slice();
          values[0] = Object.assign({}, first, {
            leadingComments: bv.concat(first.leadingComments || [])
          });
        }
        var av = flattenWs(afterValues);
        if (av.length > 0 && values.length > 0) {
          var last = values[values.length - 1];
          values = values.slice();
          values[values.length - 1] = Object.assign({}, last, {
            trailingComments: (last.trailingComments || []).concat(av)
          });
        }
      } else if (values && values.kind === 'subqueryExpr') {
        var bv2 = flattenWs(beforeValues);
        if (bv2.length > 0) {
          values = Object.assign({}, values, {
            leadingComments: bv2.concat(values.leadingComments || [])
          });
        }
        var av2 = flattenWs(afterValues);
        if (av2.length > 0) {
          values = Object.assign({}, values, {
            trailingComments: (values.trailingComments || []).concat(av2)
          });
        }
      }
      return { values: values };
    }
  / single:PrimaryExpr { return { values: [single] }; }

CompareOp = "<=>" / ">=" / "<=" / "<>" / "!=" / "==" / ">" / "<" / "="

// CompareRightExpr: right-hand side of a comparison operator.
// Includes AddExpr (arithmetic) and boolean NOT prefix, but NOT comparison operators.
// This ensures comparisons are left-associative: k = (100) = 1 → equals(equals(k,100), 1).
// Allows: 1 != NOT 1, k = x + y, k > -5. Does not allow: k = (a = b) unless in parens.
CompareRightExpr
  = KW_NOT _ expr:CompareRightExpr { return { kind: 'unaryExpr', op: 'NOT', expr: expr }; }
  / AddExpr

InValues
  = query:UnionQuery { return { kind: 'subqueryExpr', query: query }; }
  / ExpressionList

// ── Arithmetic expressions ────────────────────────────────────────────────────

// AddExpr: +/- operators; right side allows NotPrefixExpr so NOT can appear as a right operand
// (e.g. NOT 0 + NOT 0 = NOT(0 + NOT(0)), consistent with ClickHouse precedence rules)
AddExpr
  = head:ConcatExpr tail:(_ op:AddOp _ right:NotPrefixExpr)* {
      return tail.reduce(function(acc, t) {
        var right = t[3];
        var comments = flattenWs(t[0]).concat(flattenWs(t[2]));
        if (comments.length > 0) {
          right = Object.assign({}, right, {
            leadingComments: comments.concat(right.leadingComments || [])
          });
        }
        return { kind: 'binaryExpr', op: t[1], left: acc, right: right };
      }, head);
    }

// NotPrefixExpr: allows NOT as a prefix, but only wrapping arithmetic-level expressions (no comparison).
// Used as right-hand side of + and - so that NOT has lower precedence than arithmetic operators.
NotPrefixExpr
  = KW_NOT _ expr:NotPrefixExpr { return { kind: 'unaryExpr', op: 'NOT', expr: expr }; }
  / ConcatExpr

AddOp
  = "+"
  / "-" !">" { return "-"; }
  / "\u2212" { return "-"; }  // Unicode MINUS SIGN (U+2212), used in some ClickHouse SQL files

// ConcatExpr handles the || string concatenation operator, producing a flat concat() call
ConcatExpr
  = head:MulExpr tail:(_ "||" _ MulExpr)* {
      if (tail.length === 0) return head;
      var parts = [head];
      for (var i = 0; i < tail.length; i++) {
        var next = tail[i][3];
        var comments = flattenWs(tail[i][0]).concat(flattenWs(tail[i][2]));
        if (comments.length > 0) {
          next = Object.assign({}, next, {
            leadingComments: comments.concat(next.leadingComments || [])
          });
        }
        parts.push(next);
      }
      return { kind: 'functionCall', name: 'concat', args: parts };
    }

MulExpr
  = head:UnaryExpr tail:(_ op:MulOp _ right:UnaryExpr)* {
      return tail.reduce(function(acc, t) {
        var right = t[3];
        var comments = flattenWs(t[0]).concat(flattenWs(t[2]));
        if (comments.length > 0) {
          right = Object.assign({}, right, {
            leadingComments: comments.concat(right.leadingComments || [])
          });
        }
        return { kind: 'binaryExpr', op: t[1], left: acc, right: right };
      }, head);
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
        var val = expr.value;
        var bigNeg;
        if (val.startsWith('0x') || val.startsWith('0X') || val.startsWith('0b') || val.startsWith('0B')) {
          bigNeg = -BigInt(val);
        } else {
          bigNeg = -BigInt(val);
        }
        // Check if fits in Int64 range [-2^63, 0]
        var INT64_MIN = BigInt('-9223372036854775808');
        if (bigNeg >= INT64_MIN) {
          var intResult = { kind: 'literal', type: 'Int64', value: String(bigNeg) };
          // Preserve source for -0 → "0" since it can't round-trip without original text
          if (bigNeg === BigInt(0)) intResult.source = text();
          return intResult;
        }
        // Overflows Int64: use Float64 (loses precision like ClickHouse does)
        return { kind: 'literal', type: 'Float64', value: String(Number(bigNeg)), source: text() };
      }
      if (expr.kind === 'literal' && expr.type === 'Float64' && expr.value.charAt(0) !== '-') {
        // Negate a positive float literal; update source if present to include the minus sign
        var negResult = { kind: 'literal', type: 'Float64', value: '-' + expr.value };
        if (expr.source) negResult.source = text();
        return negResult;
      }
      if (expr.kind === 'castExpr' && expr.operator) {
        // -value::Type: fold the minus sign into the cast's innermost literal (for :: operator casts)
        // Recurse through nested casts to find the innermost literal
        var innermost = expr;
        while (innermost.kind === 'castExpr' && innermost.operator && innermost.expr.kind === 'castExpr' && innermost.expr.operator) {
          innermost = innermost.expr;
        }
        var inner = innermost.expr;
        if (inner.kind === 'literal' && inner.type !== 'String' && inner.type !== 'NULL' &&
            inner.type !== 'Bool' && inner.value.charAt(0) !== '-') {
          var negInner = Object.assign({}, inner, { value: '-' + inner.value });
          // Update the innermost cast with the negated literal
          // Need to rebuild the chain since we can't mutate
          var result = Object.assign({}, innermost, { expr: negInner });
          // Walk back up rebuilding if there are nested casts
          var stack = [];
          var cur = expr;
          while (cur !== innermost) {
            stack.push(cur);
            cur = cur.expr;
          }
          for (var si = stack.length - 1; si >= 0; si--) {
            result = Object.assign({}, stack[si], { expr: result });
          }
          return result;
        }
      }
      // For all other cases (non-literal, already-negative literal, etc.), wrap in negate()
      return { kind: 'functionCall', name: 'negate', args: [expr] };
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
      var result = suffixes.reduce(function(acc, s) {
        if (s.kind === 'subscript') {
          return { kind: 'functionCall', name: 'arrayElement', args: [acc, s.index] };
        } else if (s.kind === 'tuple_element') {
          var idxArg;
          var absIndex = s.index.charAt(0) === '-' ? s.index.substring(1) : s.index;
          // Large numbers that exceed UInt64 range are treated as Float64
          var idxLiteral;
          if (absIndex.length > 18) {
            var fval = Number(absIndex);
            idxLiteral = { kind: 'literal', type: 'Float64', value: fval.toExponential().replace('+', '') };
          } else {
            idxLiteral = { kind: 'literal', type: 'UInt64', value: absIndex };
          }
          if (s.index.charAt(0) === '-') {
            // Negative index: wrap as negate(literal)
            idxArg = { kind: 'functionCall', name: 'negate', args: [idxLiteral] };
          } else {
            idxArg = idxLiteral;
          }
          return { kind: 'functionCall', name: 'tupleElement', args: [acc, idxArg] };
        } else if (s.kind === 'field_access') {
          // Named field access: expr.name — tuple element by name
          return { kind: 'functionCall', name: 'tupleElement', args: [acc, { kind: 'literal', type: 'String', value: s.name }] };
        } else if (s.kind === 'json_subcolumn') {
          // .:Type or .:`QuotedType` — JSON subcolumn type annotation
          var node = { kind: 'jsonSubcolumn', expr: acc, type: s.type };
          if (s.path && s.path.length > 0) node.path = s.path;
          return node;
        } else if (s.kind === 'asterisk_access') {
          // expr.* — tuple/expression wildcard expansion
          var node = { kind: 'tupleExpansion', expr: acc };
          if (s.transformers && s.transformers.length > 0) node.transformers = s.transformers;
          return node;
        } else {
          // :: cast operator; mark with operator:true to distinguish from CAST(x AS T)
          return { kind: 'castExpr', expr: acc, type: s.type, operator: true };
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
      var spec = {};
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
      return { kind: 'asterisk_access', transformers: transformers.map(function(t) { return t[1]; }) };
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
  / "NATIONAL"i _ ( "CHARACTER"i / "CHAR"i ) _ "VARYING"i ![a-zA-Z0-9_]
  / "NATIONAL"i _ ( "CHARACTER"i / "CHAR"i ) ![a-zA-Z0-9_]
  / "NCHAR"i _ "VARYING"i ![a-zA-Z0-9_]
  / ( "CHARACTER"i / "CHAR"i / "BINARY"i ) _ "LARGE"i _ "OBJECT"i ![a-zA-Z0-9_]
  / ( "CHARACTER"i / "CHAR"i / "BINARY"i ) _ "VARYING"i ![a-zA-Z0-9_]
  / ( "TINYINT"i / "SMALLINT"i / "BIGINT"i ) _ ( "SIGNED"i / "UNSIGNED"i ) ![a-zA-Z0-9_]
  / ( "MEDIUMINT"i / "INT"i / "INTEGER"i ) _ ( "SIGNED"i / "UNSIGNED"i ) ![a-zA-Z0-9_]

// ClickHouseType: a type identifier with optional parenthesized arguments (balanced).
// e.g. Int32, Nullable(String), Enum8('Hello' = 0, 'World' = 1), Tuple(Int32, String),
//      Map(String, UInt64), Array(Nullable(Float64)), DOUBLE PRECISION
// Type arguments are captured as raw text (not parsed as expressions) because they can
// contain non-expression syntax like enum value assignments ('Hello' = 0).
ClickHouseType
  = mw:MultiWordType { return mw; }
  / "`" name:$[^`]+ "`" { return name; }
  / "\"" name:$[^"]+ "\"" { return name; }
  / name:$([a-zA-Z_][a-zA-Z0-9_]*) args:ClickHouseTypeArgs? {
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
  / KW_NOT _ tuple:TupleLiteral { return { kind: 'functionCall', name: 'not', args: [tuple] }; }
  / KW_NOT _ "(" _ expr:ExpressionWithImplicitAlias _ ")" { return { kind: 'unaryExpr', op: 'NOT', expr: expr }; }
  / ParenGroup
  / ArrayLiteral
  / LambdaExprNoParens
  // {QP:Identifier}.field.col — QueryParam used as a table/db qualifier in a dotted column ref.
  // Must come before QueryParam to prevent {QP:Identifier} being consumed as a bare query param.
  / first:QueryParamIdentifier rest:( _ "." _ part:ColumnRefCont { return part; } )+ {
      return { kind: 'columnRef', parts: [first].concat(rest) };
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
  / name:AliasName &(_ "[") { return { kind: 'columnRef', parts: [name] }; }
  / ColumnRef
  // Last resort: allow reserved keywords as bare column references (e.g., GROUP BY in, SELECT count).
  // Only reached when all other PrimaryBase alternatives fail.
  / name:AliasName { return { kind: 'columnRef', parts: [name] }; }
  / Asterisk

// MapLiteral: {'key': value, ...} syntax — parsed as map() function call
// A map literal starts with '{' followed by an expression then ':' (not just an identifier or identifier:type which is QueryParam/Heredoc)
MapLiteral
  = "{" _ "}" { return { kind: 'functionCall', name: 'map', args: [] }; }
  / "{" _ first:MapEntry rest:( _ "," _ MapEntry )* _ "}" {
      var args = [first[0], first[1]];
      for (var i = 0; i < rest.length; i++) {
        args.push(rest[i][3][0]);
        args.push(rest[i][3][1]);
      }
      return { kind: 'functionCall', name: 'map', args: args };
    }

MapEntry
  = key:TernaryExpr _ ":" _ value:TernaryExpr { return [key, value]; }

// MySQLGlobalVariable: @@varname or @@session.varname / @@global.varname syntax.
// Maps to globalVariable('varname') with alias @@varname (session./global. prefix is stripped).
MySQLGlobalVariable
  = "@@" ("session." / "global." / "local.")? name:$[a-zA-Z0-9_]+ {
      return { kind: 'alias', alias: '@@' + name, expr: { kind: 'functionCall', name: 'globalVariable', args: [{ kind: 'literal', type: 'String', value: name }] } };
    }

// ParenGroup: left-factored rule for all "("-prefixed expressions in PrimaryBase.
// After consuming "(", branches on what follows to avoid re-entering "(" for each alternative.
ParenGroup
  // Empty tuple: ()
  = "(" _ ")" { return { kind: 'functionCall', name: 'tuple', args: [] }; }
  // Subquery: (SELECT ...) / (WITH ... SELECT ...) / (EXPLAIN ...)
  / "(" beforeQuery:_ &(KW_SELECT / KW_WITH / "EXPLAIN"i ![a-zA-Z0-9_]) query:UnionQuery afterQuery:_ ")" {
      var bq = flattenWs(beforeQuery);
      if (bq.length > 0) {
        query = Object.assign({}, query, {
          leadingComments: bq.concat(query.leadingComments || [])
        });
      }
      var aq = flattenWs(afterQuery);
      if (aq.length > 0) {
        query = Object.assign({}, query, {
          trailingComments: (query.trailingComments || []).concat(aq)
        });
      }
      return { kind: 'subqueryExpr', query: query };
    }
  // Lambda with parens: (x, y, ...) -> expr
  / "(" _ head:Identifier tail:(_ "," _ Identifier)* _ ")" _ "->" _ body:Expression {
      return { kind: 'lambdaExpr', params: [head].concat(tail.map(function(t) { return t[3]; })), body: body };
    }
  // Tuple or parenthesized expression: parse first expression, then branch on comma vs close paren
  / "(" beforeFirst:_ first:Expression rest:(_ "," _ Expression)* trailing:(_ ",")? afterLast:_ ")" {
      var bf = flattenWs(beforeFirst);
      if (bf.length > 0) {
        first = Object.assign({}, first, {
          leadingComments: bf.concat(first.leadingComments || [])
        });
      }
      if (rest.length === 0 && trailing === null) {
        // (expr) — parenthesized expression
        var al = flattenWs(afterLast);
        if (al.length > 0) {
          first = Object.assign({}, first, {
            trailingComments: (first.trailingComments || []).concat(al)
          });
        }
        return Object.assign({}, first, { parenthesized: true });
      } else if (rest.length === 0) {
        // (expr,) — single-element tuple
        return { kind: 'functionCall', name: 'tuple', args: [first] };
      } else {
        // (expr, expr, ...) — multi-element tuple
        var elems = [first].concat(rest.map(function(r) { return r[3]; }));
        return { kind: 'tuple', elements: elems, source: text() };
      }
    }

// TupleLiteral: multi-element tuple (used by NOT-tuple rule in PrimaryBase)
TupleLiteral
  // Single-element tuple with trailing comma: (expr,)
  = "(" _ elem:Expression _ "," _ ")" {
      return { kind: 'functionCall', name: 'tuple', args: [elem] };
    }
  // Multi-element tuple (optionally with trailing comma)
  / "(" _ first:Expression _ "," _ rest:ExpressionList _ ","? _ ")" {
      return { kind: 'tuple', elements: [first, ...rest], source: text() };
    }

ArrayLiteral
  = "[" _ "]" {
      return { kind: 'array', elements: [], source: text() };
    }
  / "[" beforeItems:_ items:ExpressionList afterItems:_ "]" {
      var bi = flattenWs(beforeItems);
      if (bi.length > 0 && items.length > 0) {
        var first = items[0];
        items = items.slice();
        items[0] = Object.assign({}, first, {
          leadingComments: bi.concat(first.leadingComments || [])
        });
      }
      var ai = flattenWs(afterItems);
      if (ai.length > 0 && items.length > 0) {
        var last = items[items.length - 1];
        items = items.slice();
        items[items.length - 1] = Object.assign({}, last, {
          trailingComments: (last.trailingComments || []).concat(ai)
        });
      }
      return { kind: 'array', elements: items, source: text() };
    }

QueryParam
  = "{" _ name:$( "$" [0-9]+ / [a-zA-Z_][a-zA-Z0-9_]* ) _ ":" _ type:$([^}]+) "}" {
      return { kind: 'queryParam', name: name, type: type.trim() };
    }

// HeredocLiteral: PostgreSQL-style dollar-quoted string: $tag$content$tag$ or $$content$$
// The end marker is found by scanning forward in the input (not via PEG backtracking).
// e.g. $$hello world$$, $heredoc$multi-line content$heredoc$
HeredocLiteral
  = "$" tag:$([^$]*) "$" {
      var endMarker = "$" + tag + "$";
      var pos = input.indexOf(endMarker, peg$currPos);
      if (pos < 0) { error("Unterminated heredoc $" + tag + "$"); }
      var content = input.substring(peg$currPos, pos);
      peg$currPos = pos + endMarker.length;
      // Double backslashes so escapeStringValue in explain.ts outputs them correctly (consistent with StringChar handling of \\)
      return { kind: 'literal', type: 'String', value: content.replace(/\\/g, '\\\\') };
    }

// BoolLiteral: true and false keywords produce Bool literals
BoolLiteral
  = "true"i  ![a-zA-Z0-9_] { return { kind: 'literal', type: 'Bool', value: '1' }; }
  / "false"i ![a-zA-Z0-9_] { return { kind: 'literal', type: 'Bool', value: '0' }; }

NullLiteral
  = "NULL"i ![a-zA-Z0-9_] {
      return { kind: 'literal', type: 'NULL', value: 'NULL' };
    }

// BinaryStringLiteral: b'01010...' syntax - binary digits converted to a UTF-8 string value
BinaryStringLiteral
  = [bB] "'" digits:$[01]* "'" {
      if (digits.length === 0) return { kind: 'literal', type: 'String', value: '' };
      // Pad to multiple of 8 bits, MSB-first, then interpret as UTF-8 bytes
      var padded = digits.padStart(Math.ceil(digits.length / 8) * 8, '0');
      var bytes = [];
      for (var i = 0; i < padded.length; i += 8) {
        bytes.push(parseInt(padded.slice(i, i + 8), 2));
      }
      return { kind: 'literal', type: 'String', value: Buffer.from(bytes).toString('utf-8') };
    }

// HexStringLiteral: x'hexdigits...' syntax - hex digit pairs converted to a UTF-8 string value
HexStringLiteral
  = [xX] "'" digits:$[0-9a-fA-F]* "'" {
      if (digits.length === 0) return { kind: 'literal', type: 'String', value: '' };
      var padded = digits.length % 2 === 1 ? '0' + digits : digits;
      return { kind: 'literal', type: 'String', value: Buffer.from(padded, 'hex').toString('utf-8') };
    }

HexLiteral
  // Hex float literal with fractional part: 0x1.234 or 0x1.234p+01
  // Uses proper separator pattern: no trailing underscore before '.' or 'p' exponent.
  // The ![a-zA-Z0-9_] guard prevents consuming partial tokens (e.g. 0x2_p2 → identifier).
  = "0x"i int:$([0-9a-fA-F]+("_"[0-9a-fA-F]+)*) "." frac:$([0-9a-fA-F]+("_"[0-9a-fA-F]+)*)? exp:HexExponentPart? ![a-zA-Z0-9_] {
      var cleanInt = int.replace(/_/g, '');
      var cleanFrac = (frac || '').replace(/_/g, '');
      var intVal = parseInt(cleanInt, 16);
      var fracVal = cleanFrac.length > 0 ? parseInt(cleanFrac, 16) / Math.pow(16, cleanFrac.length) : 0;
      var value = exp !== null ? (intVal + fracVal) * Math.pow(2, exp) : (intVal + fracVal);
      return { kind: 'literal', type: 'Float64', value: value.toString(), source: text() };
    }
  / "0x"i digits:$([0-9a-fA-F]+("_"[0-9a-fA-F]+)*) exp:HexExponentPart? ![a-zA-Z0-9_] {
      // Remove underscore digit separators
      var clean = digits.replace(/_/g, '');
      // Parse hex with optional exponent (e.g. 0x123p4) as float
      if (exp !== null) {
        return { kind: 'literal', type: 'Float64', value: parseFloat(parseInt(clean, 16) * Math.pow(2, exp)).toString(), source: text() };
      }
      // If significant hex digits exceed 16 (> 64 bits), overflows UInt64 → treat as Float64
      var significant = clean.replace(/^0+/, '') || '0';
      if (significant.length > 16) {
        return { kind: 'literal', type: 'Float64', value: String(Number(BigInt('0x' + clean))), source: text() };
      }
      return { kind: 'literal', type: 'UInt64', value: '0x' + clean };
    }

HexExponentPart
  = [pP] sign:$[+-]? digits:$([0-9]+("_"[0-9]+)*) { return (sign === '-' ? -1 : 1) * parseInt(digits.replace(/_/g, ''), 10); }

BinaryNumLiteral
  = "0b"i digits:$([01]+("_"[01]+)*) ![a-zA-Z0-9_] {
      // Remove underscore digit separators
      var clean = digits.replace(/_/g, '');
      return { kind: 'literal', type: 'UInt64', value: '0b' + clean };
    }

// FloatLiteral: decimal float with optional underscore digit separators.
// Uses proper underscore separator pattern: digits must not start/end with _ and no double __.
// Note: "_ " in Peggy sequences is the whitespace rule; use "_" (quoted) for literal underscore.
// The ![a-zA-Z_] guard prevents partial consumption (e.g. 1e5_ must not match as 1e5).
FloatLiteral
  = "inf"i ![a-zA-Z0-9_] { return { kind: 'literal', type: 'Float64', value: 'inf' }; }
  / "nan"i ![a-zA-Z0-9_] { return { kind: 'literal', type: 'Float64', value: 'nan' }; }
  / digits:$([0-9]+("_"[0-9]+)*) "." frac:$([0-9]+("_"[0-9]+)*)? exp:ExponentPart? ![a-zA-Z_] {
      return { kind: 'literal', type: 'Float64', value: digits.replace(/_/g, '') + '.' + (frac || '').replace(/_/g, '') + (exp || '') };
    }
  / "." digits:$([0-9]+("_"[0-9]+)*) exp:ExponentPart? ![a-zA-Z_] {
      return { kind: 'literal', type: 'Float64', value: '.' + digits.replace(/_/g, '') + (exp || '') };
    }
  / digits:$([0-9]+("_"[0-9]+)*) exp:ExponentPart ![a-zA-Z_] {
      return { kind: 'literal', type: 'Float64', value: digits.replace(/_/g, '') + exp };
    }

// ExponentPart: e/E with optional sign and decimal digits (underscores allowed between digits).
ExponentPart
  = e:$[eE] sign:$[+-]? digits:$([0-9]+("_"[0-9]+)*) { return e + sign + digits.replace(/_/g, ''); }

// ── Lambda expressions ────────────────────────────────────────────────────────

LambdaExprNoParens
  = param:Identifier _ "->" _ body:Expression {
      return { kind: 'lambdaExpr', params: [param], body: body };
    }

// IntervalExpr: INTERVAL expr unit - maps to toIntervalUnit(expr)
// CaseExpr: CASE expressions mapped to multiIf() or caseWithExpression()
// CASE WHEN cond THEN val ... [ELSE default] END → multiIf(cond, val, ..., default_or_null)
// CASE expr WHEN val THEN res ... [ELSE default] END → caseWithExpression(expr, val, res, ..., default_or_null)
// The no-subject form must come first so "CASE WHEN" doesn't try to parse WHEN as the subject expression
CaseExpr
  = "CASE"i ![a-zA-Z0-9_] _ branches:CaseWhenBranch+ elseClause:( _ "ELSE"i ![a-zA-Z0-9_] _ Expression )? _ "END"i ![a-zA-Z0-9_] {
      var args = [];
      for (var i = 0; i < branches.length; i++) {
        args.push(branches[i][0]);
        args.push(branches[i][1]);
      }
      args.push(elseClause !== null ? elseClause[4] : { kind: 'literal', type: 'NULL', value: 'NULL' });
      return { kind: 'functionCall', name: 'multiIf', args: args };
    }
  / "CASE"i ![a-zA-Z0-9_] _ subject:Expression _ branches:CaseWhenBranch+ elseClause:( _ "ELSE"i ![a-zA-Z0-9_] _ Expression )? _ "END"i ![a-zA-Z0-9_] {
      var args = [subject];
      for (var i = 0; i < branches.length; i++) {
        args.push(branches[i][0]);
        args.push(branches[i][1]);
      }
      args.push(elseClause !== null ? elseClause[4] : { kind: 'literal', type: 'NULL', value: 'NULL' });
      return { kind: 'functionCall', name: 'caseWithExpression', args: args };
    }

// CaseWhenBranch: a single WHEN ... THEN ... pair in a CASE expression
CaseWhenBranch
  = _ "WHEN"i ![a-zA-Z0-9_] _ cond:Expression _ "THEN"i ![a-zA-Z0-9_] _ val:Expression {
      return [cond, val];
    }

IntervalExpr
  = "INTERVAL"i ![a-zA-Z0-9_] _ expr:Expression _ unit:IntervalUnit {
      return { kind: 'functionCall', name: 'toInterval' + unit, args: [expr] };
    }
  // INTERVAL 'N unit' MySQL-compatible syntax: single string containing value and unit
  / "INTERVAL"i ![a-zA-Z0-9_] _ str:StringLiteral {
      var parts = str.value.trim().split(/\s+/);
      var val = parts[0];
      var unitStr = (parts[1] || '').toUpperCase().replace(/S$/, '');
      var unitMap = {
        NANOSECOND: 'Nanosecond', MICROSECOND: 'Microsecond', MILLISECOND: 'Millisecond',
        SECOND: 'Second', MINUTE: 'Minute', HOUR: 'Hour', DAY: 'Day',
        WEEK: 'Week', MONTH: 'Month', QUARTER: 'Quarter', YEAR: 'Year'
      };
      var unit = unitMap[unitStr] || 'Second';
      var numVal = parseInt(val, 10);
      return { kind: 'functionCall', name: 'toInterval' + unit, args: [{ kind: 'literal', type: 'UInt64', value: String(numVal) }] };
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
      return [date, { kind: 'functionCall', name: 'toInterval' + unit, args: [amount] }];
    }
  / date:ExpressionWithImplicitAlias _ "," _ interval:IntervalExpr { return [date, interval]; }
  / interval:IntervalExpr _ "," _ date:ExpressionWithImplicitAlias { return [interval, date]; }

// CAST(expr AS TypeName) - special ClickHouse syntax, expr must be TernaryExpr
// to avoid greedily consuming the type name as an alias
FunctionCall
  // DATE_ADD/DATEADD/TIMESTAMP_ADD/TIMESTAMPADD — all forms → plus(date, interval)
  = fn:DateAddName _ "(" _ args:DateAddSubArgs _ ")" {
      return { kind: 'functionCall', name: fn, args: args };
    }
  // DATE_SUB/DATESUB/TIMESTAMP_SUB/TIMESTAMPSUB — all forms → minus(date, interval)
  / fn:DateSubName _ "(" _ args:DateAddSubArgs _ ")" {
      return { kind: 'functionCall', name: fn, args: args };
    }
  // TIMESTAMP_SUB/TIMESTAMPSUB(SQL_TSI_UNIT, amount, date) with TSI prefix unit → minus(date, toIntervalUnit(amount))
  / DateSubName _ "(" _ unit:TimestampTsiUnit _ "," _ amount:Expression _ "," _ date:Expression _ ")" {
      return { kind: 'functionCall', name: 'minus', args: [date, { kind: 'functionCall', name: 'toInterval' + unit, args: [amount] }] };
    }
  // dateDiff/DATEDIFF/DATE_DIFF with unquoted unit identifier as first arg → convert to canonical lowercase string literal
  / ("dateDiff"i / "DATEDIFF"i / "DATE_DIFF"i) _ "(" _ unit:$([a-zA-Z_][a-zA-Z0-9_]*) _ "," _ rest:FunctionCallArgList _ ")" {
      var unitAliases = {
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
      var lower = unit.toLowerCase();
      var canonical = unitAliases[lower] || lower;
      var unitLiteral = { kind: 'literal', type: 'String', value: canonical };
      return { kind: 'functionCall', name: 'dateDiff', args: [unitLiteral].concat(rest) };
    }
  // dateDiff/DATEDIFF/DATE_DIFF with quoted string unit (normalize function name to dateDiff)
  / ("dateDiff"i / "DATEDIFF"i / "DATE_DIFF"i) _ "(" _ args:FunctionCallArgList _ ")" {
      return { kind: 'functionCall', name: 'dateDiff', args: args };
    }
  // SUBSTRING(str FROM pos [FOR len]) — SQL standard substring syntax
  / ( "SUBSTRING"i / "SUBSTR"i / "MID"i ) _ "(" _ str:ExpressionWithImplicitAlias _ "FROM"i ![a-zA-Z0-9_] _ pos:ExpressionWithImplicitAlias len:( _ "FOR"i ![a-zA-Z0-9_] _ ExpressionWithImplicitAlias )? _ ")" {
      var args = [str, pos];
      if (len !== null) args.push(len[4]);
      return { kind: 'functionCall', name: 'substring', args: args };
    }
  // EXTRACT(unit FROM expr) — SQL standard date/time extraction
  // Supports implicit alias on expr (ClickHouse extension)
  / "EXTRACT"i _ "(" _ unit:ExtractUnit _ "FROM"i ![a-zA-Z0-9_] _ expr:ExpressionWithImplicitAlias _ ")" {
      var funcMap = {
        YEAR: 'toYear', MONTH: 'toMonth', DAY: 'toDayOfMonth',
        HOUR: 'toHour', MINUTE: 'toMinute', SECOND: 'toSecond',
        DOW: 'toDayOfWeek', DOY: 'toDayOfYear', EPOCH: 'toUnixTimestamp',
        WEEK: 'toWeek', QUARTER: 'toQuarter', MICROSECOND: 'toMicrosecond',
        MILLISECOND: 'toMillisecond', CENTURY: 'toCentury', ISOYEAR: 'toISOYear',
        ISOWEEK: 'toISOWeek', TIMEZONE_HOUR: 'timezoneHour', TIMEZONE_MINUTE: 'timezoneMinute',
        YYYY: 'toYear', MM: 'toMonth', DD: 'toDayOfMonth', HH: 'toHour',
        MI: 'toMinute', SS: 'toSecond'
      };
      var funcName = funcMap[unit.toUpperCase()] || ('to' + unit.charAt(0).toUpperCase() + unit.slice(1).toLowerCase());
      return { kind: 'functionCall', name: funcName, args: [expr] };
    }
  / "TRIM"i _ "(" _ direction:TrimDirection _ chars:ExpressionWithImplicitAlias _ "FROM"i ![a-zA-Z0-9_] _ str:ExpressionWithImplicitAlias _ ")" {
      // ClickHouse simplifies TRIM with empty string to just the expression
      if (chars.kind === 'literal' && chars.type === 'String' && chars.value === '') {
        return str;
      }
      var fname = direction === 'LEADING' ? 'trimLeft' : (direction === 'TRAILING' ? 'trimRight' : 'trimBoth');
      return { kind: 'functionCall', name: fname, args: [str, chars] };
    }
  // POSITION(needle IN haystack) — SQL standard POSITION syntax; maps to position(haystack, needle)
  // Uses AddExpr for needle to prevent consuming IN as part of the expression
  / "POSITION"i _ "(" _ needle:AddExpr _ "IN"i ![a-zA-Z0-9_] _ haystack:ExpressionWithImplicitAlias _ ")" {
      return { kind: 'functionCall', name: 'position', args: [haystack, needle] };
    }
  // SQL-standard typed date/time literals: DATE 'string' → toDate('string'), etc.
  / "DATE"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return { kind: 'functionCall', name: 'toDate', args: [str] };
    }
  / "TIMESTAMP"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return { kind: 'functionCall', name: 'toDateTime', args: [str] };
    }
  / "TIME"i ![a-zA-Z0-9_] _ str:StringLiteral {
      return { kind: 'functionCall', name: 'toTime', args: [str] };
    }
  // CAST(expr AS Type) — SQL standard type cast. Also supports aliased form: CAST(expr AS alias AS Type)
  // The alias lookahead (&(KW_AS)) ensures we don't consume the final type name as an alias.
  // e.g. CAST(1 AS Int32), CAST(x AS y AS String)
  / "CAST"i _ "(" _ expr:TernaryExpr alias:( _ ( KW_AS _ )? name:AliasName &( _ KW_AS ) { return name; } )? _ KW_AS _ type:ClickHouseType _ ")" {
      var innerExpr = alias !== null ? { kind: 'alias', expr: expr, alias: alias } : expr;
      return { kind: 'castExpr', expr: innerExpr, type: type };
    }
  // Generic function call: name([DISTINCT|ALL] args [SETTINGS ...])[(params)]? [FILTER(WHERE ...)]?
  // DISTINCT modifier appends "Distinct" to function name: countDistinct, sumDistinct, etc.
  // Curried form f(params)(args) is used by parametric aggregates: quantile(0.5)(x)
  // FILTER(WHERE cond) transforms f(args) → fIf(args, cond) (SQL standard aggregate filter)
  // The !(")" / ",") guard after DISTINCT/ALL prevents them from being consumed as modifiers
  // when they're actually arguments: has(Settings, 'x') or func(DISTINCT) where DISTINCT is a value.
  / name:FunctionName _ "(" openComments:_ modifier:( ( KW_DISTINCT / KW_ALL ) !( _ ( ")" / "," ) ) _ )? first:FunctionCallArgList? funcSettings:( _ KW_SETTINGS _ SettingsList )? _ ")" second:( _ "(" _ ( ( KW_DISTINCT / KW_ALL ) !( _ ( ")" / "," ) ) _ )? FunctionCallArgList? _ ")" )? filter:FilterClause? {
      var modVal = modifier !== null ? modifier[0] : null;
      var modStr = Array.isArray(modVal) ? modVal[0] : modVal;
      var isDistinct = modStr !== null && modStr !== undefined && modStr.toString().toUpperCase() === 'DISTINCT';
      var effectiveName = isDistinct ? name + 'Distinct' : name;
      // Attach comments between "(" and first arg as leadingComments on first arg
      var args1 = first || [];
      var oc = flattenWs(openComments);
      if (oc.length > 0 && args1.length > 0) {
        var firstArg = args1[0];
        args1 = args1.slice();
        args1[0] = Object.assign({}, firstArg, {
          leadingComments: oc.concat(firstArg.leadingComments || [])
        });
      }
      var call;
      if (second !== null) {
        // second[3] = modifier2 group, second[4] = FunctionCallArgList?
        var mod2 = second[3];
        var mod2Val = mod2 !== null ? mod2[0] : null;
        var mod2Str = Array.isArray(mod2Val) ? mod2Val[0] : mod2Val;
        var isDistinct2 = mod2Str !== null && mod2Str !== undefined && mod2Str.toString().toUpperCase() === 'DISTINCT';
        var curryName = isDistinct2 ? effectiveName + 'Distinct' : effectiveName;
        call = { kind: 'functionCall', name: curryName, params: args1, args: second[4] || [] };
      } else {
        call = { kind: 'functionCall', name: effectiveName, args: args1 };
      }
      if (funcSettings !== null) call.funcSettings = funcSettings[3];
      if (filter !== null) {
        // count(*) FILTER (WHERE cond) → countIf(cond): drop the asterisk arg
        var filterArgs = (call.args.length === 1 && call.args[0].kind === 'asterisk')
          ? [] : call.args;
        call = { kind: 'functionCall', name: call.name + 'If', args: filterArgs.concat([filter]) };
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
      var items = [head];
      for (var i = 0; i < tail.length; i++) {
        var ws1 = tail[i][0]; // before comma
        var ws2 = tail[i][2]; // after comma
        var trailing = ws2.trailing;
        var leading = flattenWs(ws1).concat(ws2.leading);
        if (trailing.length > 0) {
          var prev = items[items.length - 1];
          items[items.length - 1] = Object.assign({}, prev, {
            trailingComments: (prev.trailingComments || []).concat(trailing)
          });
        }
        var next = tail[i][3];
        if (leading.length > 0) {
          next = Object.assign({}, next, {
            leadingComments: leading.concat(next.leadingComments || [])
          });
        }
        items.push(next);
      }
      return items;
    }

FunctionCallArg
  = params:MultiLambdaParams _ "->" _ body:Expression {
      return { kind: 'lambdaExpr', params: params, body: body };
    }
  / &(KW_SELECT / KW_WITH) query:UnionQuery {
      return { kind: 'subqueryExpr', query: query };
    }
  // Support implicit aliases in function args: f(expr alias, ...) — ClickHouse extension
  / ExpressionWithImplicitAlias
  // Allow keywords as column name identifiers in function args (e.g. sum(DISTINCT), repeat(ALL, 5))
  / name:AliasName &(_ (")" / ",")) { return { kind: 'columnRef', parts: [name] }; }

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
      return { kind: 'columnRef', parts: [first].concat(rest) };
    }
  // Unqualified: plain identifier (keyword-guarded) or digit-prefixed identifier
  / name:Identifier { return { kind: 'columnRef', parts: [name] }; }
  / name:$([0-9][a-zA-Z0-9_$]+) { return { kind: 'columnRef', parts: [name] }; }

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
      var result = { kind: 'qualifiedAsterisk', parts: [first].concat(rest) };
      if (transformers.length > 0) result.transformers = transformers.map(function(t) { return t[1]; });
      return result;
    }

// Asterisk optionally followed by column transformers (EXCEPT, APPLY, REPLACE).
Asterisk
  = "*" transformers:( _ ColumnTransformer )* {
      var result = { kind: 'asterisk' };
      if (transformers.length > 0) result.transformers = transformers.map(function(t) { return t[1]; });
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
      return [head].concat(tail.map(function(t) { return t[3]; }));
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
      return { kind: 'apply', func: { kind: 'columnRef', parts: [name] } };
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
      return [head].concat(tail.map(function(t) { return t[3]; }));
    }

// Single REPLACE item: expr AS colName
ReplaceItem
  = expr:TernaryExpr _ KW_AS _ alias:Identifier {
      return { expr: expr, alias: alias };
    }

// COLUMNS expression: COLUMNS(args) optionally preceded by a table qualifier and optionally followed by transformers.
// Without transformers or qualifier, COLUMNS(...) falls through to FunctionCall (preserving original casing).
// With transformers or qualifier (APPLY, EXCEPT, REPLACE, or table.COLUMNS(...)), it becomes a ColumnsExpr node.
// Qualifier can be a multi-part path (e.g. db.table.COLUMNS('^c'), 02339_db.test_table.COLUMNS(id)).
ColumnsExpr
  // [db.]table.COLUMNS(args) — table-qualified columns expression, e.g. t.COLUMNS('^c'), db.tbl.COLUMNS('^c')
  // Uses ColumnRefFirst for the first part to support digit-prefixed identifiers and QueryParamIdentifiers.
  = first:ColumnRefFirst rest:( _ "." _ !( "COLUMNS"i _ "(" ) part:ColumnRefCont { return part; } )* _ "." _ "COLUMNS"i _ "(" _ args:FunctionCallArgList _ ")" transformers:( _ ColumnTransformer )* {
      var qualPath = [first].concat(rest);
      var result = { kind: 'columnsExpr', args: args, qualifier: qualPath.join('.') };
      if (transformers.length > 0) result.transformers = transformers.map(function(t) { return t[1]; });
      return result;
    }
  / "COLUMNS"i _ "(" _ args:FunctionCallArgList _ ")" _ head:ColumnTransformer rest:( _ ColumnTransformer )* {
      var transformers = [head].concat(rest.map(function(t) { return t[1]; }));
      return { kind: 'columnsExpr', args: args, transformers: transformers };
    }

// ── Literals & identifiers ────────────────────────────────────────────────────

// IntegerLiteral supports underscore digit separators (e.g., 1_000_000).
// Uses proper separator pattern: no leading/trailing _ and no double __.
// Removes underscores and leading zeros for normalization.
// Values exceeding UInt64 max (18446744073709551615) become Float64.
// The ![a-zA-Z_] guard prevents consuming the digit prefix of digit-prefixed identifiers like 02337_db.
IntegerLiteral
  = digits:$([0-9]+("_"[0-9]+)*) ![a-zA-Z_] {
      var normalized = digits.replace(/_/g, '').replace(/^0+/, '') || '0';
      var UINT64_MAX = BigInt('18446744073709551615');
      if (normalized.length > 20 || (normalized.length >= 20 && BigInt(normalized) > UINT64_MAX)) {
        // Keep original string to preserve precision for CAST contexts
        return { kind: 'literal', type: 'Float64', value: normalized };
      }
      return { kind: 'literal', type: 'UInt64', value: normalized };
    }

// StringLiteral: decodes hex escape sequences as UTF-8 bytes (collecting consecutive \xNN
// sequences and decoding them together to handle multi-byte UTF-8 characters like \xD0\xA0 → 'Р').
StringLiteral
  // Unicode left/right single quotes (no escape processing - backslashes stored doubled)
  = "\u2018" chars:UnicodeQuoteChar* "\u2019" {
      return { kind: 'literal', type: 'String', value: chars.join('') };
    }
  / "'" chars:StringChar* "'" {
      // Collect consecutive hex byte objects and decode as UTF-8
      var parts = [];
      var hexBuf = [];
      for (var i = 0; i < chars.length; i++) {
        var c = chars[i];
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
      return { kind: 'literal', type: 'String', value: parts.join('') };
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
      return { kind: 'tableRef', database: db, table: table };
    }
  / table:( QueryParamIdentifier / AliasName ) {
      return { kind: 'tableRef', table: table };
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
      var leading = [];
      for (var i = 0; i < newlineContent.length; i++) {
        for (var j = 0; j < newlineContent[i].length; j++) {
          if (newlineContent[i][j] !== null) leading.push(newlineContent[i][j]);
        }
      }
      return { trailing: trailing, leading: leading };
    }

// Horizontal whitespace + comments (no newlines consumed)
_HWS
  = items:([ \t\u00A0\u2003\u3000\uFEFF]+ { return null; } / SingleLineComment / MultiLineComment)* {
      return items.filter(function(item) { return item !== null; });
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
