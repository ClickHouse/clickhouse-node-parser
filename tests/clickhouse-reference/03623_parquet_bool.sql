select * from file(current_database() ||'03626_parquet_bool.parquet') where x=1 settings input_format_parquet_use_native_reader_v3=1;
