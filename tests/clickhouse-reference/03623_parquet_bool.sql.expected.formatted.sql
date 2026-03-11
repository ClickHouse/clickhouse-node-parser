SELECT *
FROM file(concat(current_database(), '03626_parquet_bool.parquet'))
WHERE x = 1
SETTINGS input_format_parquet_use_native_reader_v3 = 1;