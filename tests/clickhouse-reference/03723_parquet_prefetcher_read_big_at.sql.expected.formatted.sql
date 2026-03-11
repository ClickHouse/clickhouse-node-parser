SELECT
    ProfileEvents['ParquetPrefetcherReadRandomRead'],
    ProfileEvents['ParquetPrefetcherReadSeekAndRead'],
    ProfileEvents['ParquetPrefetcherReadEntireFile']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND current_database = currentDatabase()
    AND log_comment = 'test_03723_parquet_prefetcher_read_big_at'
ORDER BY event_time DESC
LIMIT 1;