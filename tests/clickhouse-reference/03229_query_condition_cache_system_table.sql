SELECT '--- with move to PREWHERE';
SELECT count(*) FROM tab WHERE b = 10_000 SETTINGS use_query_condition_cache = true FORMAT Null;
SELECT count(*) FROM system.query_condition_cache;
