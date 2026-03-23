DROP TABLE IF EXISTS t;
-- Create test table with "many" rows
CREATE TABLE t(c String) ENGINE=MergeTree ORDER BY c;
INSERT INTO t values ('abc') ('def') ('ghi') ('jkl');
-- Run query which reads multiple chunks (small max_block_size), cache result in query cache, force squashing of partial results
SELECT '-- insert with enabled squashing';
SELECT * FROM t ORDER BY c
SETTINGS max_block_size = 3, use_query_cache = true, query_cache_squash_partial_results = true;
SELECT * FROM t ORDER BY c
SETTINGS max_block_size = 3, use_query_cache = true;
SELECT * FROM t ORDER BY c
SETTINGS max_block_size = 3, use_query_cache = true, query_cache_squash_partial_results = false;
DROP TABLE t;
