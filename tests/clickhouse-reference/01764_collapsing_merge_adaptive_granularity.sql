SET optimize_on_insert = 0;
CREATE TABLE collapsing_table
(
    key UInt64,
    value UInt64,
    Sign Int8
)
ENGINE = CollapsingMergeTree(Sign)
ORDER BY key
SETTINGS
    vertical_merge_algorithm_min_rows_to_activate=0,
    vertical_merge_algorithm_min_columns_to_activate=0,
    min_bytes_for_wide_part = 0;
SELECT sum(Sign), count() from collapsing_table;
CREATE TABLE collapsing_suspicious_granularity
(
    key UInt64,
    value UInt64,
    Sign Int8
)
ENGINE = CollapsingMergeTree(Sign)
ORDER BY key
SETTINGS
    vertical_merge_algorithm_min_rows_to_activate=0,
    vertical_merge_algorithm_min_columns_to_activate=0,
    min_bytes_for_wide_part = 0,
    index_granularity = 1;
SELECT sum(Sign), count() from collapsing_suspicious_granularity;
