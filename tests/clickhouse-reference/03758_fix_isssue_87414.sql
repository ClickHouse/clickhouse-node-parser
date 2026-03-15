-- Tags: no-fasttest, no-parallel-replicas

CREATE TABLE t0 ENGINE = IcebergS3(s3_conn, filename = 'issue87414/test/t0') settings iceberg_metadata_file_path = 'metadata/v2.metadata.json';
SELECT count(*), sum(c0) FROM t0;
CREATE TABLE t0 ENGINE = IcebergS3(s3_conn, filename = 'issue87414/test/t0') settings iceberg_metadata_file_path = 'metadata/v3.metadata.json';
