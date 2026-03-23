-- Tags: no-parallel, no-fasttest
SYSTEM DROP  TABLE IF EXISTS t_s3_filter_02495;

CREATE TABLE t_s3_filter_02495
(
    a UInt64
)
ENGINE = S3(s3_conn, filename = 'test_02495_{_partition_id}', `format` = Parquet)
PARTITION BY a;

INSERT INTO t_s3_filter_02495 SELECT number
FROM numbers(10)
SETTINGS s3_truncate_on_insert = 1;

SET max_rows_to_read = 5;

SELECT
    *,
    _file
FROM s3(s3_conn, filename = 'test_02495_1', `format` = Parquet)
WHERE _file = 'test_02495_1';

SYSTEM DROP  TABLE t_s3_filter_02495;