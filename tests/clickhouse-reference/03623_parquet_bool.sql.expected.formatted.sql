-- Tags: no-fasttest
INSERT INTO FUNCTION file(concat(current_database(), '03626_parquet_bool.parquet')) SELECT true AS x
SETTINGS engine_file_truncate_on_insert = 1;

SELECT *
FROM file(concat(current_database(), '03626_parquet_bool.parquet'))
WHERE x = 1
SETTINGS input_format_parquet_use_native_reader_v3 = 1;