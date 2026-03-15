-- Run SELECT with quota that current user may write only 1 entry in the query cache
SET query_cache_max_entries = 1;
SELECT 'a' SETTINGS use_query_cache = true;
SELECT 'b' SETTINGS use_query_cache = true;
SELECT count(*) FROM system.query_cache; -- expect 1 entry
-- Run SELECTs again but w/o quota
SET query_cache_max_entries = DEFAULT;
SELECT 'c' SETTINGS use_query_cache = true;
SELECT 'd' SETTINGS use_query_cache = true;
-- Run the same as above after a DROP QUERY CACHE.
SELECT '--';
