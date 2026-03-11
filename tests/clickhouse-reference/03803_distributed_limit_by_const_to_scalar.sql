SELECT c0 FROM t1 ORDER BY c0 LIMIT 1 BY c0 SETTINGS optimize_const_name_size = 0;
SELECT c0 FROM t1 ORDER BY c0 LIMIT 2 BY c0 SETTINGS optimize_const_name_size = 0;
SELECT c0 FROM t1 ORDER BY c0 LIMIT 1, 1 BY c0 SETTINGS optimize_const_name_size = 0;
