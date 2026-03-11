SELECT count()
FROM t_prewarm_cache
WHERE NOT ignore(*);

SELECT ProfileEvents['LoadedMarksCount'] > 0
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT count() FROM t_prewarm_cache%')
ORDER BY event_time_microseconds ASC;