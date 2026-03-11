SELECT 1
SETTINGS use_query_cache = true;

SELECT COUNT(*)
FROM `system`.query_cache;

SELECT '---';

SELECT
    ProfileEvents['QueryCacheHits'],
    ProfileEvents['QueryCacheMisses']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query = 'select 1 SETTINGS use_query_cache = true;';