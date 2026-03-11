SELECT n10
FROM file(concat(current_database(), '03596_parquet_prewhere_page_skip_bug.parquet'))
PREWHERE n IN (131, 174, 175, 176)
ORDER BY `all` ASC
SETTINGS
    input_format_parquet_page_filter_push_down = 0,
    input_format_parquet_filter_push_down = 0,
    input_format_parquet_bloom_filter_push_down = 0,
    input_format_parquet_max_block_size = 10;