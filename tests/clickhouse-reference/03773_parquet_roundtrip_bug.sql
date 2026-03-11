select toTypeName(j1), toTypeName(t), toTypeName(j2) from file(currentDatabase() || '_03773.parquet') settings input_format_parquet_use_native_reader_v3=0;
select toTypeName(j1), toTypeName(t), toTypeName(j2) from file(currentDatabase() || '_03773.parquet') settings input_format_parquet_use_native_reader_v3=1;
