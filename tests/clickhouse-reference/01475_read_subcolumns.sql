SELECT a.size0 FROM t_arr;
SELECT ProfileEvents['FileOpen']
FROM system.query_log
WHERE (type = 'QueryFinish') AND (lower(query) LIKE lower('SELECT a.size0 FROM %t_arr%'))
    AND current_database = currentDatabase();
SELECT t.s FROM t_tup;
SELECT t.u FROM t_tup;
SELECT ProfileEvents['FileOpen']
FROM system.query_log
WHERE (type = 'QueryFinish') AND (lower(query) LIKE lower('SELECT t._ FROM %t_tup%'))
    AND current_database = currentDatabase();
SELECT n.null FROM t_nul;
SELECT ProfileEvents['FileOpen']
FROM system.query_log
WHERE (type = 'QueryFinish') AND (lower(query) LIKE lower('SELECT n.null FROM %t_nul%'))
    AND current_database = currentDatabase();
SELECT m.keys FROM t_map;
SELECT m.values FROM t_map;
SELECT ProfileEvents['FileOpen']
FROM system.query_log
WHERE (type = 'QueryFinish') AND (lower(query) LIKE lower('SELECT m.% FROM %t_map%'))
    AND current_database = currentDatabase();
