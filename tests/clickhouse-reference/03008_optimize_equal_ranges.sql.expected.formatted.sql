SELECT
    a,
    uniqExact(b)
FROM t_optimize_equal_ranges
GROUP BY a
ORDER BY a ASC
SETTINGS max_threads = 16;

SELECT
    a,
    uniqExact(b)
FROM t_optimize_equal_ranges
GROUP BY a
ORDER BY a ASC
SETTINGS max_threads = 1;

SELECT
    a,
    sum(c)
FROM t_optimize_equal_ranges
GROUP BY a
ORDER BY a ASC
SETTINGS max_threads = 16;

SELECT
    a,
    sum(c)
FROM t_optimize_equal_ranges
GROUP BY a
ORDER BY a ASC
SETTINGS max_threads = 1;

SELECT
    used_aggregate_functions[1] AS func,
    `Settings`['max_threads'] AS threads,
    ProfileEvents['AggregationOptimizedEqualRangesOfKeys'] > 0
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND like(query, '%SELECT%FROM%t_optimize_equal_ranges%')
ORDER BY
    func ASC,
    threads ASC;