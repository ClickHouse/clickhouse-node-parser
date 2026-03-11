-- Run a silly query with a non-trivial plan and put the result into the query cache QC
SELECT 1 + number from system.numbers LIMIT 1 SETTINGS use_query_cache = true;
SELECT count(*) FROM system.query_cache;
