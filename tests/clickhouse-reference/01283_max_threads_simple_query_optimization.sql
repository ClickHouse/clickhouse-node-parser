SELECT * FROM data_01283 LIMIT 1 FORMAT Null;
-- 1 for PullingAsyncPipelineExecutor::pull
SELECT
    throwIf(count() != 1, 'no query was logged'),
    throwIf(length(thread_ids) > 2, 'too many threads used')
FROM system.query_log
WHERE current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE '%data_01283 LIMIT 1%'
GROUP BY thread_ids
FORMAT Null;
