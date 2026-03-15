CREATE TABLE t_sparse_reload (id UInt64, v UInt64)
ENGINE = MergeTree ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.95;
SELECT count() FROM t_sparse_reload WHERE NOT ignore(*);
