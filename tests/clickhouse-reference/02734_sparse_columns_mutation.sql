SELECT count(), sum(v) FROM t_sparse_mutation;
SELECT sum(has_lightweight_delete) FROM system.parts
WHERE database = currentDatabase() AND table = 't_sparse_mutation' AND active;
