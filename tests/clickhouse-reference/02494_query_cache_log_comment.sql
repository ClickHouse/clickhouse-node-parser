SELECT 1 SETTINGS use_query_cache = 1, log_comment='aaa' FORMAT Null;
SELECT 1 SETTINGS use_query_cache = 1, log_comment='bbb' FORMAT Null;
SELECT log_comment, ProfileEvents['QueryCacheHits'], ProfileEvents['QueryCacheMisses']
FROM system.query_log
WHERE type = 'QueryFinish'
    AND event_time > now() - 600
    AND current_database = currentDatabase()
    AND query LIKE 'SELECT 1 SETTINGS use_query_cache%'
ORDER BY event_time_microseconds;
