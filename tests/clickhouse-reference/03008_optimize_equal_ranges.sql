CREATE TABLE t_optimize_equal_ranges (a UInt64, b String, c UInt64) ENGINE = MergeTree ORDER BY a;
SET max_block_size = 1024;
SET max_bytes_before_external_group_by = 0;
SET max_bytes_ratio_before_external_group_by = 0;
SET optimize_aggregation_in_order = 0;
SET optimize_use_projections = 0;
SELECT a, uniqExact(b) FROM t_optimize_equal_ranges GROUP BY a ORDER BY a SETTINGS max_threads = 16;
SELECT a, uniqExact(b) FROM t_optimize_equal_ranges GROUP BY a ORDER BY a SETTINGS max_threads = 1;
SELECT a, sum(c) FROM t_optimize_equal_ranges GROUP BY a ORDER BY a SETTINGS max_threads = 16;
SELECT a, sum(c) FROM t_optimize_equal_ranges GROUP BY a ORDER BY a SETTINGS max_threads = 1;
SELECT
    used_aggregate_functions[1] AS func,
    Settings['max_threads'] AS threads,
    ProfileEvents['AggregationOptimizedEqualRangesOfKeys'] > 0
FROM system.query_log
WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND query LIKE '%SELECT%FROM%t_optimize_equal_ranges%'
ORDER BY func, threads;
