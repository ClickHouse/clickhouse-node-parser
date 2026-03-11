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