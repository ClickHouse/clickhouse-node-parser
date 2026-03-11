SELECT
    throwIf(countIf(part_type = 'Compact') = 0),
    throwIf(countIf(part_type = 'Wide') = 0)
FROM `system`.parts
WHERE (database = currentDatabase())
    AND (table = 't')
FORMAT Null;

SELECT *
FROM t
FORMAT Null
SETTINGS log_comment = 'parallel_replicas_task_size_82982938';

SELECT throwIf(ProfileEvents['ParallelReplicasNumRequests'] > 25)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'parallel_replicas_task_size_82982938'
    AND type = 'QueryFinish'
SETTINGS enable_parallel_replicas = 0
FORMAT Null;