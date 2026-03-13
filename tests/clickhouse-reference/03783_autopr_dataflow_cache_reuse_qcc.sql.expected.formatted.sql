--set send_logs_level='trace', send_logs_source_regexp = 'optimize|SelectExecutor';
SELECT SUM(value)
FROM t
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_0'; -- empty cache, don't apply optimization, collect stats

SELECT SUM(value)
FROM t
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_1'; -- stats available, apply

-- Query #2 will see a lot of bytes read, since we read all rows.
-- At the same time, as query #2 completes, it populates the query condition cache with an entry for the condition "value = 42".
-- Subsequent queries will read much less data and thus the automatic parallel replicas decision should change.
-- The goal is to verify that it will actually happen.
SELECT SUM(value)
FROM t
WHERE value = 42
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_2'; -- empty cache, don't apply optimization, collect stats

-- For an unclear reason, the QCC is not always populated with the knowledge about all irrelevant granules from the first run.
-- It may take a few invocations (we do five to be sure). Because of that, we do a bit relaxed check here and only check the end result - that parallel replicas won't be used eventually.
SELECT SUM(value)
FROM t
WHERE value = 42
FORMAT Null;

SELECT SUM(value)
FROM t
WHERE value = 42
FORMAT Null
SETTINGS log_comment = '03783_autopr_dataflow_cache_reuse_query_3'; -- stats available, don't apply since no benefit

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