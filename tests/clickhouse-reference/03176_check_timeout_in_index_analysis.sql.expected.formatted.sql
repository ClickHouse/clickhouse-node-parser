SELECT count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_03176'
    AND active;

SELECT
    log_comment,
    type = 'QueryFinish',
    intDiv(query_duration_ms, 2000),
    exception_code != 0,
    (position(stack_trace, 'selectPartsToRead') > 0
    OR position(stack_trace, 'filterPartsByPartition') > 0) AS has_selectPartsToRead
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(log_comment, '03176_q_')
    AND type IN ('QueryFinish', 'ExceptionBeforeStart')
ORDER BY log_comment ASC;