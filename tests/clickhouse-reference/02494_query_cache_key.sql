SELECT * FROM tab SETTINGS use_query_cache = 1;
-- test with query-level settings
SELECT 1 SETTINGS use_query_cache = 1, limit = 1, use_skip_indexes = 0 Format Null;
SELECT 1 SETTINGS use_query_cache = 1, use_skip_indexes = 0 Format Null;
SELECT 1 SETTINGS use_query_cache = 1, use_skip_indexes = 1 Format Null;
SELECT 1 SETTINGS use_query_cache = 1, max_block_size = 1 Format Null;
-- 4x the same query but with different settings each. There should yield four entries in the query cache.
SELECT count(query) FROM system.query_cache;
SELECT 1 SETTINGS use_skip_indexes = 0 Format Null;
SELECT 1 Format Null;
SELECT 1 SETTINGS use_skip_indexes = 1 Format Null;
