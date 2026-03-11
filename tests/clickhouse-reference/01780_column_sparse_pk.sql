SELECT k, s FROM t_sparse_pk WHERE k = 2 ORDER BY k, s;
SELECT k, s FROM t_sparse_pk WHERE k = 0 OR k = 3 ORDER BY k, s;
SELECT count(v), sum(v) FROM t_sparse_pk WHERE k = 0;
SELECT count(v), sum(v) FROM t_full_pk WHERE k = 0;
SELECT count(v), sum(v) FROM t_sparse_pk WHERE k = 0 OR k = 3 OR k = 7 OR k = 8;
SELECT count(v), sum(v) FROM t_full_pk WHERE k = 0 OR k = 3 OR k = 7 OR k = 8;
SELECT (k = NULL) OR (k = 1000) FROM t_sparse_pk LIMIT 3;
SELECT range(k) FROM t_sparse_pk ORDER BY k LIMIT 3;
