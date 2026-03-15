-- Tags: no-parallel, no-fasttest, no-random-settings

SET allow_suspicious_low_cardinality_types=1;
CREATE TABLE t_03363_parquet (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet', format = Parquet, partition_strategy='hive')
PARTITION BY (year, country);
-- distinct because minio isn't cleaned up
select distinct on (counter) replaceRegexpAll(_path, '/[0-9]+\\.parquet', '/<snowflakeid>.parquet') AS _path, counter from t_03363_parquet order by counter;
-- CSV test
CREATE TABLE t_03363_csv (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_csv', format = CSV, partition_strategy='hive')
PARTITION BY (year, country);
select distinct on (counter) replaceRegexpAll(_path, '/[0-9]+\\.csv', '/<snowflakeid>.csv') AS _path, counter from t_03363_csv order by counter;
select distinct on (counter) replaceRegexpAll(_path, '/[0-9]+\\.parquet', '/<snowflakeid>.parquet') AS _path, counter from s3(s3_conn, filename='t_03363_function/**.parquet') order by counter;
-- Depends on the above two inserts, should throw exception because it could not find the hive partition columns it was looking for
-- The format is null because one of the files contains the requested columns and might return the data before we throw the exception
select * from s3(s3_conn, filename='t_03363_mixed_partitioning/**.parquet') Format null; -- {serverError INCORRECT_DATA}
-- Depends on the above two inserts, should throw exception because it could not find the hive partition columns it was looking for
-- The format is null because one of the files contains the requested columns and might return the data before we throw the exception
CREATE TABLE t_03363_mixed_partitioning (id Int32, year UInt16) ENGINE=S3(s3_conn, filename='t_03363_mixed_partitioning', format=Parquet, partition_strategy='hive') PARTITION BY (year);
SELECT * FROM t_03363_mixed_partitioning Format null; -- {serverError INCORRECT_DATA}
-- should output 1 because partition columns are not written down to the file by default when hive style is being used
select num_columns from s3(s3_conn, filename='t_03363_function/**.parquet', format=ParquetMetadata) limit 1;
select num_columns from s3(s3_conn, filename='t_03363_function_write_down_partition_columns/**.parquet', format=ParquetMetadata) limit 1;
-- hive partitioning = 0 so we know it is not reading columns from the path
select * from s3(s3_conn, filename='t_03363_function_write_down_partition_columns/**.parquet', format=Parquet) order by counter limit 1 SETTINGS use_hive_partitioning=0;
-- Should fail because contains only partition columns in schema and `use_hive_partitioning=1`
CREATE TABLE s3_table_half_schema_with_format (year UInt64) engine=S3(s3_conn, filename='half_baked/**.parquet', format=Parquet) SETTINGS use_hive_partitioning=1; -- {serverError INCORRECT_DATA}
-- Should succeed because hive is off
CREATE TABLE s3_table_half_schema_with_format (year UInt64) engine=S3(s3_conn, filename='half_baked/**.parquet', format=Parquet) SETTINGS use_hive_partitioning=0;
-- Should succeed and not return hive columns (as nothing else is in schema - then no columns at all). Distinct because maybe MinIO isn't cleaned up
SELECT DISTINCT * FROM s3_table_half_schema_with_format;
CREATE TABLE s3_table_half_schema_with_format_2 (key UInt64) engine=S3(s3_conn, filename='half_baked/**.parquet', format=Parquet) SETTINGS use_hive_partitioning=0;
SELECT DISTINCT * FROM s3_table_half_schema_with_format_2;
-- Should fail because the column year does not exist
SELECT key, * FROM s3_table_half_schema_with_format; -- {serverError UNKNOWN_IDENTIFIER}
-- hive with partition id placeholder
CREATE TABLE t_03363_s3_sink (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet/{_partition_id}', format = Parquet, partition_strategy='hive')
PARTITION BY (year, country); -- {serverError BAD_ARGUMENTS};
-- unknown partitioning style
CREATE TABLE t_03363_s3_sink (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet', format = Parquet, partition_strategy='abc')
PARTITION BY (year, country); -- {serverError BAD_ARGUMENTS};
-- hive partition strategy can't be used without partition by clause
CREATE TABLE t_03363_s3_err (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet', partition_strategy='hive', format=Parquet); -- {serverError BAD_ARGUMENTS}
-- hive partition strategy can't be used with globbed path
CREATE TABLE t_03363_s3_err (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet/**', partition_strategy='hive', format=Parquet); -- {serverError BAD_ARGUMENTS}
-- partition_columns_in_data_file can't be zero for non hive
CREATE TABLE t_03363_s3_err (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet{_partition_id}', partition_strategy='wildcard', format=Parquet, partition_columns_in_data_file=0)
PARTITION BY (year, country); -- {serverError BAD_ARGUMENTS}
-- partition_columns_in_data_file can't be zero for non hive strategy
CREATE TABLE t_03363_s3_err (year UInt16, country String, counter UInt8)
ENGINE = S3(s3_conn, filename = 't_03363_parquet', format=Parquet, partition_columns_in_data_file=0) PARTITION BY (year, country); -- {serverError BAD_ARGUMENTS}
-- hive partition strategy can't be set in select statement?
select * from s3(s3_conn, filename='t_03363_function_write_down_partition_columns/**.parquet', format=Parquet, partition_strategy='hive'); -- {serverError BAD_ARGUMENTS}
-- do not support expressions in hive partitioning
CREATE TABLE t_invalid_expression (year UInt16, country String, counter UInt8)
                                  ENGINE = S3(s3_conn, filename = 'invalid', format = Parquet, partition_strategy='hive')
                                  PARTITION BY toString(year); -- {serverError BAD_ARGUMENTS}
-- floating types not supported
CREATE TABLE t_invalid_expression (year UInt16, country String, counter Float64)
                                  ENGINE = S3(s3_conn, filename = 'invalid', format = Parquet, partition_strategy='hive')
                                  PARTITION BY counter; -- {serverError BAD_ARGUMENTS}
-- Data lake like engines do not support the `partition_strategy` argument
CREATE TABLE t_03363_iceberg ENGINE=IcebergS3(s3_conn, filename = 'iceberg_data/default/t_iceberg/', format='parquet', url = 'http://minio1:9001/bucket/', partition_strategy='WILDCARD'); -- {serverError BAD_ARGUMENTS}
CREATE TABLE t_03363_iceberg ENGINE=IcebergS3(s3_conn, filename = 'iceberg_data/default/t_iceberg/', format='parquet', url = 'http://minio1:9001/bucket/', partition_strategy='HIVE'); -- {serverError BAD_ARGUMENTS}
-- Should throw because format is not present and it is mandatory for hive strategy and it should not be a LOGICAL_ERROR
CREATE TABLE t_03363_hive_requires_format (c0 Int) ENGINE = S3(s3_conn, partition_strategy = 'hive') PARTITION BY (c0); -- {serverError BAD_ARGUMENTS}
-- Should throw because hive strategy does not allow partition columns to be the only columns
CREATE TABLE t_03363_hive_only_partition_columns (country String, year UInt16) ENGINE = S3(s3_conn, partition_strategy='hive') PARTITION BY (year, country); -- {serverError BAD_ARGUMENTS};
