SELECT _database, _table, n FROM 01902_db_repr.t_merge ORDER BY _database, _table, n;
SELECT _database, _table, n FROM merge(REGEXP('^01902_db_repr'), '^t') ORDER BY _database, _table, n;
SELECT _database, _table, n FROM 01902_db_repr.t_merge WHERE _database = '01902_db_repr1' ORDER BY _database, _table, n;
SELECT _database, _table, n FROM 01902_db_repr.t_merge WHERE _table = 't1' ORDER BY _database, _table, n;
SELECT _database, _table, n FROM 01902_db_repr.t_merge1 ORDER BY _database, _table, n;
SELECT _database, _table, n FROM merge('01902_db_repr', '^t$') ORDER BY _database, _table, n;
SELECT _database, _table, n FROM 01902_db_repr.t_merge_1 ORDER BY _database, _table, n;
SELECT _database, _table, n FROM merge(currentDatabase(), '^t') ORDER BY _database, _table, n;
SELECT NULL FROM 01902_db_repr.t_merge WHERE n ORDER BY _table DESC;
