-- The problem with too small task sizes specifically happens when we have compact parts.
-- Because for them we don't know individual column sizes, see `calculateMinMarksPerTask()` function.
SELECT
    throwIf(countIf(part_type = 'Compact') = 0),
    throwIf(countIf(part_type = 'Wide') = 0)
FROM system.parts
WHERE (database = currentDatabase()) AND (table = 't')
FORMAT Null;
SELECT * FROM t FORMAT Null SETTINGS log_comment = 'parallel_replicas_task_size_82982938';
-- The objective is to check that we request enough marks with each request. Obviously, the more we request, the less requests we will have.
-- Before the fix, in this particular case we made ~ 70 requests, now it should be <= 15 (25 is used to ensure no flakyness).
SELECT throwIf(ProfileEvents['ParallelReplicasNumRequests'] > 25)
FROM system.query_log
WHERE current_database = currentDatabase() AND log_comment = 'parallel_replicas_task_size_82982938' AND type = 'QueryFinish'
SETTINGS enable_parallel_replicas = 0
FORMAT Null;
