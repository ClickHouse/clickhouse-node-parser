SELECT *
FROM t_prewarm_add_column
ORDER BY a ASC;

SELECT ProfileEvents['LoadedMarksCount']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT * FROM t_prewarm_add_column%')
ORDER BY event_time_microseconds ASC;