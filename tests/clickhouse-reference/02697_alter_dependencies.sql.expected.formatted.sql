SELECT
    ProfileEvents['FunctionExecute'],
    ProfileEvents['TableFunctionExecute']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND like(query, '%ALTER TABLE mv_source%')
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(10);