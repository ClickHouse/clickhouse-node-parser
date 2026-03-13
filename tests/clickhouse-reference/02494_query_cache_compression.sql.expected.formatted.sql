-- Run query which, store *compressed* result in query cache
SELECT '-- insert with enabled compression';

SELECT *
FROM t
ORDER BY c ASC
SETTINGS
    use_query_cache = true,
    query_cache_compress_entries = true;

SELECT *
FROM t
ORDER BY c ASC
SETTINGS use_query_cache = true;

SELECT *
FROM t
ORDER BY c ASC
SETTINGS
    use_query_cache = true,
    query_cache_compress_entries = false;