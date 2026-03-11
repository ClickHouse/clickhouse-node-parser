SELECT count() FROM t_prewarm_columns WHERE NOT ignore(*);
SELECT ProfileEvents['LoadedMarksCount'] FROM system.query_log
WHERE current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE 'SELECT count() FROM t_prewarm_columns%'
ORDER BY event_time_microseconds;
