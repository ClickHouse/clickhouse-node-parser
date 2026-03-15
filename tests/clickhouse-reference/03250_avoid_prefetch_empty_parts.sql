CREATE table 03250_avoid_prefetch(id UInt64, string LowCardinality(String))
ENGINE = MergeTree
ORDER BY id
SETTINGS enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_remote_filesystem_prefetch = 1,
vertical_merge_algorithm_min_bytes_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1,
min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, remove_empty_parts = 0, storage_policy = 's3_no_cache';
