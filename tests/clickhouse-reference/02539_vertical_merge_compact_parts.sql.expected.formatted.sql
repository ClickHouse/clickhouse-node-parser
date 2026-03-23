CREATE TABLE t_compact_vertical_merge
(
    id UInt64,
    s LowCardinality(String),
    arr Array(UInt64)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 16, min_bytes_for_wide_part = 0, min_rows_for_wide_part = 100, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1, allow_vertical_merges_from_compact_to_wide_parts = 1, min_bytes_for_full_part_storage = 0;

INSERT INTO t_compact_vertical_merge SELECT
    number,
    toString(number),
    range(number % 10)
FROM numbers(40);