-- distinct because minio isn't cleaned up
select distinct on (counter) replaceRegexpAll(_path, '/[0-9]+\\.parquet', '/<snowflakeid>.parquet') AS _path, counter from t_03363_parquet order by counter;
select distinct on (counter) replaceRegexpAll(_path, '/[0-9]+\\.csv', '/<snowflakeid>.csv') AS _path, counter from t_03363_csv order by counter;
select distinct on (counter) replaceRegexpAll(_path, '/[0-9]+\\.parquet', '/<snowflakeid>.parquet') AS _path, counter from s3(s3_conn, filename='t_03363_function/**.parquet') order by counter;
-- Depends on the above two inserts, should throw exception because it could not find the hive partition columns it was looking for
-- The format is null because one of the files contains the requested columns and might return the data before we throw the exception
select * from s3(s3_conn, filename='t_03363_mixed_partitioning/**.parquet') Format null; -- {serverError INCORRECT_DATA}
SELECT * FROM t_03363_mixed_partitioning Format null; -- {serverError INCORRECT_DATA}
-- should output 1 because partition columns are not written down to the file by default when hive style is being used
select num_columns from s3(s3_conn, filename='t_03363_function/**.parquet', format=ParquetMetadata) limit 1;
select num_columns from s3(s3_conn, filename='t_03363_function_write_down_partition_columns/**.parquet', format=ParquetMetadata) limit 1;
-- hive partitioning = 0 so we know it is not reading columns from the path
select * from s3(s3_conn, filename='t_03363_function_write_down_partition_columns/**.parquet', format=Parquet) order by counter limit 1 SETTINGS use_hive_partitioning=0;
-- Should succeed and not return hive columns (as nothing else is in schema - then no columns at all). Distinct because maybe MinIO isn't cleaned up
SELECT DISTINCT * FROM s3_table_half_schema_with_format;
SELECT DISTINCT * FROM s3_table_half_schema_with_format_2;
-- Should fail because the column year does not exist
SELECT key, * FROM s3_table_half_schema_with_format; -- {serverError UNKNOWN_IDENTIFIER}
-- hive partition strategy can't be set in select statement?
select * from s3(s3_conn, filename='t_03363_function_write_down_partition_columns/**.parquet', format=Parquet, partition_strategy='hive'); -- {serverError BAD_ARGUMENTS}
