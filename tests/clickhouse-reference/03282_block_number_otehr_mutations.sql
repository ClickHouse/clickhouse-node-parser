SET mutations_sync = 2;
CREATE TABLE t_block_number_proj (a UInt64, b UInt64) ENGINE = MergeTree ORDER BY a
SETTINGS enable_block_number_column = 1, min_bytes_for_wide_part = 0, index_granularity = 128;
set parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;
SELECT a, b FROM t_block_number_proj WHERE b = 5 SETTINGS force_optimize_projection = 1;
CREATE TABLE t_block_number_ttl (d Date, a UInt64, b UInt64) ENGINE = MergeTree ORDER BY a
SETTINGS enable_block_number_column = 1, min_bytes_for_wide_part = 0, index_granularity = 128;
SELECT * FROM t_block_number_ttl ORDER BY a;
