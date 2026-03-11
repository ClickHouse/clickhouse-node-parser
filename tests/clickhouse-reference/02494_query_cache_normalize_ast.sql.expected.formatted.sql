SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_nondeterministic_function_handling = 'save',
    max_threads = 16;

SELECT COUNT(*)
FROM `system`.query_cache;

SELECT '---';

SELECT 1
SETTINGS
    use_query_cache = true,
    enable_writes_to_query_cache = false,
    max_threads = 16;

SELECT
    ProfileEvents['QueryCacheHits'],
    ProfileEvents['QueryCacheMisses']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query = 'SELECT 1 SETTINGS use_query_cache = true, enable_writes_to_query_cache = false, max_threads = 16;';