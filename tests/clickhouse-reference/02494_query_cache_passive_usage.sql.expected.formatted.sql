SELECT 1;

SELECT COUNT(*)
FROM `system`.query_cache;

SELECT '-----';

SELECT 1
SETTINGS
    use_query_cache = true,
    enable_writes_to_query_cache = false;

SELECT 1
SETTINGS use_query_cache = true;

SELECT
    ProfileEvents['QueryCacheHits'],
    ProfileEvents['QueryCacheMisses']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND like(query, '%\nSELECT 1 SETTINGS use_query_cache = true, enable_writes_to_query_cache = false;')
ORDER BY event_time_microseconds ASC;