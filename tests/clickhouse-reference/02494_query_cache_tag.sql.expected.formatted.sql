SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_tag = 'abc';

SELECT
    query,
    tag
FROM `system`.query_cache;

SELECT '---';

SELECT 1
SETTINGS use_query_cache = true;

SELECT
    query,
    tag
FROM `system`.query_cache
ORDER BY `ALL` ASC;