-- Tags: no-fasttest
INSERT INTO FUNCTION file(concat(currentDatabase(), '_data_02304.parquet')) SELECT 'hello' AS s
FROM numbers(3)
SETTINGS
    engine_file_truncate_on_insert = 1,
    output_format_parquet_string_as_string = 1;

INSERT INTO FUNCTION file(concat(currentDatabase(), '_data_02304.orc')) SELECT 'hello' AS s
FROM numbers(3)
SETTINGS
    engine_file_truncate_on_insert = 1,
    output_format_orc_string_as_string = 1;

INSERT INTO FUNCTION file(concat(currentDatabase(), '_data_02304.arrow')) SELECT 'hello' AS s
FROM numbers(3)
SETTINGS
    engine_file_truncate_on_insert = 1,
    output_format_arrow_string_as_string = 1;