-- Tags: no-fasttest
-- Tag no-fasttest: Depends on S3
-- Issue: https://github.com/ClickHouse/ClickHouse/issues/87059
DROP TABLE IF EXISTS test_03629;

CREATE TABLE test_03629
(
    a UInt64
)
ENGINE = S3(s3_conn, filename = 'test_03629_{_partition_id}', `format` = 'Native')
PARTITION BY a;

DROP TABLE test_03629;