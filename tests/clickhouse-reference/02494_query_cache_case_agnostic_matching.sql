-- Insert an entry into the query cache.
SELECT 1 SETTINGS use_query_cache = true;
-- Check that entry in QC exists
SELECT COUNT(*) FROM system.query_cache;
-- Run the same SELECT but with different case (--> select). We want its result to be served from the QC.
SELECT '---';
SELECT ProfileEvents['QueryCacheHits'], ProfileEvents['QueryCacheMisses']
FROM system.query_log
WHERE type = 'QueryFinish'
  AND current_database = currentDatabase()
  AND query = 'select 1 SETTINGS use_query_cache = true;';
