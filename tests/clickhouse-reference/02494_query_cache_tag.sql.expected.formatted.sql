-- Store the result a single query with a tag in the query cache and check that the system table knows about the tag
SELECT 1
SETTINGS
    use_query_cache = true,
    query_cache_tag = 'abc';

SELECT
    query,
    tag
FROM `system`.query_cache;

SELECT '---';

-- Store the result of the same query with two different tags. The cache should store two entries.
SELECT 1
SETTINGS use_query_cache = true; -- default query_cache_tag = ''

SELECT
    query,
    tag
FROM `system`.query_cache
ORDER BY `ALL` ASC;

-- Like before but the tag is set standalone.
SET query_cache_tag = 'abc';

SET query_cache_tag = 'def';