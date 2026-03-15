CREATE TABLE test
(
    json JSON(max_dynamic_paths = 4)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, merge_max_dynamic_subcolumns_in_wide_part = 2;

SELECT
    JSONDynamicPaths(json),
    JSONSharedDataPaths(json)
FROM test;

SELECT
    JSONDynamicPaths(json),
    JSONSharedDataPaths(json)
FROM test
LIMIT 1;

CREATE TABLE test
(
    x UInt32,
    json JSON(max_dynamic_paths = 4)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, merge_max_dynamic_subcolumns_in_wide_part = 2, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1;