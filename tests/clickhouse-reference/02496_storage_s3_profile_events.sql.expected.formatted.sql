CREATE TABLE t_s3_events_02496
(
    a UInt64
)
ENGINE = S3(s3_conn, filename = 'test_02496_{_partition_id}', `format` = Parquet)
PARTITION BY a;

SET max_threads = 1;

SET parallel_replicas_for_cluster_engines = 0;

SELECT count()
FROM s3(s3_conn, filename = 'test_02496_*', `format` = Parquet, structure = 'a UInt64');

SELECT
    ProfileEvents['S3HeadObject'],
    ProfileEvents['S3ListObjects'],
    ProfileEvents['RemoteFSPrefetches'],
    ProfileEvents['IOBufferAllocBytes'] < 100000
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND ilike(query, 'SELECT count() FROM s3%test_02496%');