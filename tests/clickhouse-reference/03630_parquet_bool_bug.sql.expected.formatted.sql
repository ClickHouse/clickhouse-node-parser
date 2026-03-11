SELECT sum(tags)
FROM
    file(concat(current_database(), '03630_parquet_bool_bug.parquet'))
ARRAY JOIN tags
SETTINGS input_format_parquet_use_native_reader_v3 = 1;

SELECT sum(n = arraySum(arrayMap(i -> bitShiftLeft(bits[i + 1], i), range(8)))) AS ok
FROM file(concat(current_database(), '03630_parquet_bool_bug.parquet'))
SETTINGS
    input_format_parquet_use_native_reader_v3 = 1,
    schema_inference_make_columns_nullable = 0;