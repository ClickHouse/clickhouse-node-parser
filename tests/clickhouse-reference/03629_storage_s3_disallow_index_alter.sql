CREATE TABLE test_03629 (a UInt64) ENGINE = S3(s3_conn, filename='test_03629_{_partition_id}', format='Native') PARTITION BY a;
