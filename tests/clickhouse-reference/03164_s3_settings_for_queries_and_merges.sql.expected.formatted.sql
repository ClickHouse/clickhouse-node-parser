SELECT count()
FROM t_compact_bytes_s3
WHERE NOT ignore(c2, c4);

-- Errors in S3 requests will be automatically retried, however ProfileEvents can be wrong. That is why we subtract errors.
SELECT
    ProfileEvents['S3ReadRequestsCount'] - ProfileEvents['S3ReadRequestsErrors'],
    ProfileEvents['ReadBufferFromS3Bytes'] < ProfileEvents['ReadCompressedBytes'] * 1.1
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND ilike(query, '%INSERT INTO t_compact_bytes_s3 SELECT number, number, number%');

SELECT
    ProfileEvents['S3ReadRequestsCount'] - ProfileEvents['S3ReadRequestsErrors'],
    ProfileEvents['ReadBufferFromS3Bytes'] < ProfileEvents['ReadCompressedBytes'] * 1.1
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND ilike(query, '%OPTIMIZE TABLE t_compact_bytes_s3 FINAL%');