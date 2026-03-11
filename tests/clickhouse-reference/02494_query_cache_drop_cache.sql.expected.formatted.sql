SELECT 1
SETTINGS use_query_cache = true;

SELECT count(*)
FROM `system`.query_cache;

SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_tag = 'abc';

SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_tag = 'def';

SELECT 2
SETTINGS use_query_cache = true;