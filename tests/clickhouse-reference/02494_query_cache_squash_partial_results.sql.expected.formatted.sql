SELECT '-- insert with enabled squashing';

SELECT *
FROM t
ORDER BY c ASC
SETTINGS
    max_block_size = 3,
    use_query_cache = true,
    query_cache_squash_partial_results = true;

SELECT *
FROM t
ORDER BY c ASC
SETTINGS
    max_block_size = 3,
    use_query_cache = true;

SELECT *
FROM t
ORDER BY c ASC
SETTINGS
    max_block_size = 3,
    use_query_cache = true,
    query_cache_squash_partial_results = false;