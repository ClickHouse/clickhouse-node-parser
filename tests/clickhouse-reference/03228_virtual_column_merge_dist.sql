SELECT a, _table FROM t_merge ORDER BY a;
SELECT a, _table FROM t_distr ORDER BY a;
SELECT a, _database = currentDatabase() FROM t_merge ORDER BY a;
SELECT a, _database = currentDatabase() FROM t_distr ORDER BY a;
