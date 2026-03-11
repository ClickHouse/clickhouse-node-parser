SELECT c0 FROM t1 OFFSET -10 ROWS SETTINGS optimize_const_name_size = 1;
SELECT c0 FROM t1 OFFSET 10 ROWS SETTINGS optimize_const_name_size = 1;
SELECT c0 FROM t1 LIMIT -10 SETTINGS optimize_const_name_size = 1;
SELECT c0 FROM t1 LIMIT 10 SETTINGS optimize_const_name_size = 1;
