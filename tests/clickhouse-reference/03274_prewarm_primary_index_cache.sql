SELECT count() FROM t_prewarm_cache_rmt_1 WHERE a % 2 = 0 AND a > 100 AND a < 1000;
SELECT sum(primary_key_bytes_in_memory) FROM system.parts WHERE database = currentDatabase() AND table IN ('t_prewarm_cache_rmt_1', 't_prewarm_cache_rmt_2');
SELECT count() FROM t_prewarm_cache_rmt_2 WHERE a % 2 = 0 AND a > 100 AND a < 1000;
SELECT ProfileEvents['LoadedPrimaryIndexFiles'] FROM system.query_log
WHERE current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE 'SELECT count() FROM t_prewarm_cache%'
ORDER BY event_time_microseconds;
