--set send_logs_level='trace', send_logs_source_regexp = 'optimize';
SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_0'; -- empty cache, don't apply optimization, collect stats

SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_1'; -- stats available, don't apply since no benefit

--set send_logs_level='trace', send_logs_source_regexp = 'optimize';
SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_2'; -- stats available, but we have to recollect since data grew, don't apply

SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_3'; -- stats available, apply

--set send_logs_level='trace', send_logs_source_regexp = 'optimize';
SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_4'; -- stats available, but we have to recollect since data grew, don't apply

SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_5'; -- stats available, apply

--set send_logs_level='trace', send_logs_source_regexp = 'optimize';
SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_6'; -- stats available, but we have to recollect since data shrinked, don't apply

SELECT
    key,
    SUM(value)
FROM t
GROUP BY key
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_7'; -- stats available, don't apply since no benefit

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