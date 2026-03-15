CREATE TABLE t_s3_filter_02495
(
    a UInt64
)
ENGINE = S3(s3_conn, filename = 'test_02495_{_partition_id}', `format` = Parquet)
PARTITION BY a;

SET max_rows_to_read = 5;

SELECT
    *,
    _file
FROM s3(s3_conn, filename = 'test_02495_1', `format` = Parquet)
WHERE _file = 'test_02495_1';