-- distinct because minio isn't cleaned up
SELECT DISTINCT ON (counter)
    replaceRegexpAll(_path, '/[0-9]+\\.parquet', '/<snowflakeid>.parquet') AS _path,
    counter
FROM t_03363_parquet
ORDER BY counter ASC;

SELECT DISTINCT ON (counter)
    replaceRegexpAll(_path, '/[0-9]+\\.csv', '/<snowflakeid>.csv') AS _path,
    counter
FROM t_03363_csv
ORDER BY counter ASC;

SELECT DISTINCT ON (counter)
    replaceRegexpAll(_path, '/[0-9]+\\.parquet', '/<snowflakeid>.parquet') AS _path,
    counter
FROM s3(s3_conn, filename = 't_03363_function/**.parquet')
ORDER BY counter ASC;

-- Depends on the above two inserts, should throw exception because it could not find the hive partition columns it was looking for
-- The format is null because one of the files contains the requested columns and might return the data before we throw the exception
SELECT *
FROM s3(s3_conn, filename = 't_03363_mixed_partitioning/**.parquet')
FORMAT null; -- {serverError INCORRECT_DATA}

SELECT *
FROM t_03363_mixed_partitioning
FORMAT null; -- {serverError INCORRECT_DATA}

-- should output 1 because partition columns are not written down to the file by default when hive style is being used
SELECT num_columns
FROM s3(s3_conn, filename = 't_03363_function/**.parquet', `format` = ParquetMetadata)
LIMIT 1;

SELECT num_columns
FROM s3(s3_conn, filename = 't_03363_function_write_down_partition_columns/**.parquet', `format` = ParquetMetadata)
LIMIT 1;

-- hive partitioning = 0 so we know it is not reading columns from the path
SELECT *
FROM s3(s3_conn, filename = 't_03363_function_write_down_partition_columns/**.parquet', `format` = Parquet)
ORDER BY counter ASC
LIMIT 1
SETTINGS use_hive_partitioning = 0;

-- Should succeed and not return hive columns (as nothing else is in schema - then no columns at all). Distinct because maybe MinIO isn't cleaned up
SELECT DISTINCT *
FROM s3_table_half_schema_with_format;

SELECT DISTINCT *
FROM s3_table_half_schema_with_format_2;

-- Should fail because the column year does not exist
SELECT
    key,
    *
FROM s3_table_half_schema_with_format; -- {serverError UNKNOWN_IDENTIFIER}

-- hive partition strategy can't be set in select statement?
SELECT *
FROM s3(s3_conn, filename = 't_03363_function_write_down_partition_columns/**.parquet', `format` = Parquet, partition_strategy = 'hive'); -- {serverError BAD_ARGUMENTS}