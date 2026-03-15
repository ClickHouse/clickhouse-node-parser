CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplacingMergeTree(version, is_deleted)
ORDER BY uid
SETTINGS vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0, min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM test
ORDER BY uid ASC;