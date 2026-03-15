SET optimize_on_insert = 0;
CREATE TABLE replacing_table (a UInt32, b UInt32, c UInt32)
ENGINE = ReplacingMergeTree ORDER BY a
SETTINGS vertical_merge_algorithm_min_rows_to_activate = 1,
    vertical_merge_algorithm_min_columns_to_activate = 1,
    index_granularity = 16,
    min_bytes_for_wide_part = 0,
    merge_max_block_size = 16;
SELECT sum(a), count() FROM replacing_table;
CREATE TABLE replacing_table
(
    key UInt64,
    value UInt64
)
ENGINE = ReplacingMergeTree
ORDER BY key
SETTINGS
    vertical_merge_algorithm_min_rows_to_activate=0,
    vertical_merge_algorithm_min_columns_to_activate=0,
    min_bytes_for_wide_part = 0;
SELECT sum(key), count() from replacing_table;
