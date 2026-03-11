SELECT
    toTypeName(j1),
    toTypeName(t),
    toTypeName(j2)
FROM file(concat(currentDatabase(), '_03773.parquet'))
SETTINGS input_format_parquet_use_native_reader_v3 = 0;

SELECT
    toTypeName(j1),
    toTypeName(t),
    toTypeName(j2)
FROM file(concat(currentDatabase(), '_03773.parquet'))
SETTINGS input_format_parquet_use_native_reader_v3 = 1;