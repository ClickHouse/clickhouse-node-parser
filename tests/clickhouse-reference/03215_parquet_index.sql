CREATE TABLE test_parquet (col1 int, col2 String) ENGINE=File(Parquet);
SELECT col1, col2 FROM test_parquet;
CREATE TABLE test_parquet (col1 int, col2 String) ENGINE=File(Parquet)  SETTINGS output_format_parquet_use_custom_encoder=false, output_format_parquet_write_page_index=true;
CREATE TABLE test_parquet (col1 int, col2 String) ENGINE=File(Parquet)  SETTINGS output_format_parquet_use_custom_encoder=false, output_format_parquet_write_page_index=false;
