select sum(tags) from file(current_database() ||'03630_parquet_bool_bug.parquet') array join tags settings input_format_parquet_use_native_reader_v3=1;
select sum(n = arraySum(arrayMap(i -> bitShiftLeft(bits[i+1], i), range(8)))) as ok from file(current_database() ||'03630_parquet_bool_bug.parquet') settings input_format_parquet_use_native_reader_v3=1, schema_inference_make_columns_nullable=0;
