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

SELECT *
FROM s3(s3_conn, filename = 't_03363_mixed_partitioning/**.parquet')
FORMAT null;

SELECT *
FROM t_03363_mixed_partitioning
FORMAT null;

SELECT num_columns
FROM s3(s3_conn, filename = 't_03363_function/**.parquet', `format` = ParquetMetadata)
LIMIT 1;

SELECT num_columns
FROM s3(s3_conn, filename = 't_03363_function_write_down_partition_columns/**.parquet', `format` = ParquetMetadata)
LIMIT 1;

SELECT *
FROM s3(s3_conn, filename = 't_03363_function_write_down_partition_columns/**.parquet', `format` = Parquet)
ORDER BY counter ASC
LIMIT 1
SETTINGS use_hive_partitioning = 0;

SELECT DISTINCT *
FROM s3_table_half_schema_with_format;

SELECT DISTINCT *
FROM s3_table_half_schema_with_format_2;

SELECT
    key,
    *
FROM s3_table_half_schema_with_format;

SELECT *
FROM s3(s3_conn, filename = 't_03363_function_write_down_partition_columns/**.parquet', `format` = Parquet, partition_strategy = 'hive');