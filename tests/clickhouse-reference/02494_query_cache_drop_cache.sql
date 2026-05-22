-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache

-- (it's silly to use what will be tested below but we have to assume other tests cluttered the query cache)
SYSTEM CLEAR QUERY CACHE;
SELECT 1 SETTINGS use_query_cache = true;
SELECT count(*) FROM system.query_cache;
SYSTEM CLEAR QUERY CACHE TAG 'tag';
SELECT 1 SETTINGS use_query_cache = true, query_cache_tag = 'abc';
SELECT 1 SETTINGS use_query_cache = true, query_cache_tag = 'def';
SELECT 2 SETTINGS use_query_cache = true;
SYSTEM CLEAR QUERY CACHE TAG '';
SYSTEM CLEAR QUERY CACHE TAG 'def';
SYSTEM CLEAR QUERY CACHE TAG 'abc';
