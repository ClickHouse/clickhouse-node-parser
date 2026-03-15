CREATE TABLE t_sparse_mutation (id UInt64, v UInt64)
ENGINE = MergeTree ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;
SET mutations_sync = 2;
SELECT count(), sum(v) FROM t_sparse_mutation;
SELECT sum(has_lightweight_delete) FROM system.parts
WHERE database = currentDatabase() AND table = 't_sparse_mutation' AND active;
