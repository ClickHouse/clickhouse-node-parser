SELECT SUM(value)
FROM t
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_0';

SELECT SUM(value)
FROM t
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_1';

SELECT SUM(value)
FROM t
WHERE value = 42
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_2';

SELECT SUM(value)
FROM t
WHERE value = 42
FORMAT Null;

SELECT SUM(value)
FROM t
WHERE value = 42
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_3';

SELECT
    log_comment AS query,
    ProfileEvents['RuntimeDataflowStatisticsInputBytes'] > 0 AS stats_collected,
    ProfileEvents['ParallelReplicasUsedCount'] > 0 AS pr_used
FROM `system`.query_log
WHERE (event_date >= yesterday())
    AND (event_time >= (NOW() - toIntervalMinute(15)))
    AND (current_database = currentDatabase())
    AND (like(log_comment, '03783_autopr_dataflow_cache_reuse_query_%'))
    AND (type = 'QueryFinish')
ORDER BY log_comment ASC
FORMAT TSVWithNames;