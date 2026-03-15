-- Tags: no-fasttest

set output_format_parquet_use_custom_encoder = 1;
set input_format_parquet_use_native_reader_v3 = 1;
set engine_file_truncate_on_insert = 1;
select n10 from file(current_database() ||'03596_parquet_prewhere_page_skip_bug.parquet') prewhere n in (131, 174, 175, 176) order by all settings input_format_parquet_page_filter_push_down=0, input_format_parquet_filter_push_down=0, input_format_parquet_bloom_filter_push_down=0, input_format_parquet_max_block_size=10;
