CREATE TABLE t_update_empty_nested
(
    `id` UInt32,
    `nested.arr1` Array(UInt64),
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';
SET mutations_sync = 2;
SELECT * FROM t_update_empty_nested FORMAT Null;
SELECT sum(length(nested.arr1)), sum(length(nested.arr2)) FROM t_update_empty_nested;
