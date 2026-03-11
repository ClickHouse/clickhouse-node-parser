SELECT countDistinct(year)
FROM s3(s3_conn, filename = '03631/**.parquet', `format` = RawBLOB)
SETTINGS use_hive_partitioning = 1;