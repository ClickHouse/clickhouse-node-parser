SELECT 'a'
INTO OUTFILE '/dev/null'
FORMAT Parquet
SETTINGS input_format_parquet_max_block_size = 1024;