SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_min_query_runs = 0;

SELECT COUNT(*)
FROM `system`.query_cache;

SELECT '---';

SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_min_query_runs = 1;

SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_min_query_runs = 2;