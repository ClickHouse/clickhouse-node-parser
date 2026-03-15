CREATE TABLE t_sparse_columns_clear (arr Array(UInt64), v UInt64)
ENGINE = MergeTree ORDER BY tuple()
SETTINGS
    ratio_of_defaults_for_sparse_serialization = 0.9,
    min_bytes_for_wide_part = 0,
    enable_block_number_column = 0,
    enable_block_offset_column = 0;
SELECT column, serialization_kind FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_columns_clear' AND active
ORDER BY column;
SET mutations_sync = 2;
SET alter_sync = 2;
SET max_rows_to_read = 0; -- system.text_log can be really big
SELECT count(), groupArray(message) FROM system.text_log WHERE logger_name LIKE '%' || currentDatabase() || '.t_sparse_columns_clear' || '%' AND level = 'Error';
