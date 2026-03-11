SELECT max(blockSize()) + sum(ignore(short, long2))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'));

SELECT max(blockSize()) + sum(ignore(short))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'))
SETTINGS input_format_parquet_prefer_block_bytes = 100000;

SELECT max(blockSize()) + sum(ignore(short, long2))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'))
SETTINGS input_format_parquet_max_block_size = 64;

SELECT max(blockSize()) + sum(ignore(short, long2))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'))
SETTINGS input_format_parquet_prefer_block_bytes = 30;

SELECT roundToExp2(max(blockSize()) + sum(ignore(short, long2)))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'))
SETTINGS input_format_parquet_prefer_block_bytes = 700000;

SELECT roundToExp2(max(blockSize()) + sum(ignore(short, long1, long2)))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'))
SETTINGS input_format_parquet_prefer_block_bytes = 700000;

SELECT roundToExp2(max(blockSize()) + sum(ignore(short, long_low_cardinality)))
FROM file(concat(currentDatabase(), '03164_adapting_parquet_reader_output_size.parquet'))
SETTINGS
    input_format_parquet_prefer_block_bytes = 700000,
    input_format_parquet_use_native_reader_v3 = 1;