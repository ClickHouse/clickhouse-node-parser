-- This is a fancy way to check that the MV hasn't been called (no functions executed by ALTER)
SELECT
    ProfileEvents['FunctionExecute'],
    ProfileEvents['TableFunctionExecute']
FROM system.query_log
WHERE
        type = 'QueryFinish' AND
        query like '%ALTER TABLE mv_source%' AND
        current_database = currentDatabase() AND
        event_time > now() - INTERVAL 10 minute;
