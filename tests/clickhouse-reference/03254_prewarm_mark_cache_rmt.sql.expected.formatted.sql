SELECT count()
FROM t_prewarm_cache_rmt_1
WHERE NOT ignore(*);

SELECT count()
FROM t_prewarm_cache_rmt_2
WHERE NOT ignore(*);

SELECT ProfileEvents['LoadedMarksCount'] > 0
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT count() FROM t_prewarm_cache%')
ORDER BY event_time_microseconds ASC;