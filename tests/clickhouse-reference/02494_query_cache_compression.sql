-- Create test table with lot's of rows
CREATE TABLE t(c String) ENGINE=MergeTree ORDER BY c;
-- Run query which, store *compressed* result in query cache
SELECT '-- insert with enabled compression';
SELECT * FROM t ORDER BY c
SETTINGS use_query_cache = true, query_cache_compress_entries = true;
SELECT * FROM t ORDER BY c
SETTINGS use_query_cache = true;
SELECT * FROM t ORDER BY c
SETTINGS use_query_cache = true, query_cache_compress_entries = false;
