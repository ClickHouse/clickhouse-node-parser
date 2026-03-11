SELECT
    ProfileEvents['ParquetMetadataCacheHits'] AS hits,
    ProfileEvents['ParquetMetadataCacheMisses'] AS misses
FROM system.query_log
WHERE (log_comment = '03707-first-test-query') AND (type = 'QueryFinish') AND (current_database = currentDatabase());

SELECT
    ProfileEvents['ParquetMetadataCacheHits'] AS hits,
    ProfileEvents['ParquetMetadataCacheMisses'] AS misses
FROM system.query_log
WHERE (log_comment = '03707-second-test-query') AND (type = 'QueryFinish') AND (current_database = currentDatabase());
SELECT
    ProfileEvents['ParquetMetadataCacheHits'] AS hits,
    ProfileEvents['ParquetMetadataCacheMisses'] AS misses
FROM system.query_log
WHERE (log_comment = '03707-third-test-query') AND (type = 'QueryFinish') AND (current_database = currentDatabase());
