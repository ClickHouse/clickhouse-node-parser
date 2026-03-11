SELECT column, serialization_kind FROM system.parts_columns WHERE database = currentDatabase() AND table = 't_sparse_alter' AND active ORDER BY column;
SELECT uniqExact(u), uniqExact(s) FROM t_sparse_alter;
SELECT uniqExact(t) FROM t_sparse_alter;
