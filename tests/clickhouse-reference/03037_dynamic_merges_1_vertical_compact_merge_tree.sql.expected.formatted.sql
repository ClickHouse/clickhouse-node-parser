-- Tags: long, no-tsan, no-msan, no-ubsan, no-asan
-- Random settings limits: index_granularity=(100, None); merge_max_block_size=(100, None)
SET allow_experimental_dynamic_type = 1;

CREATE TABLE test
(
    id UInt64,
    d Dynamic(max_types = 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_rows_for_wide_part = 1000000000, min_bytes_for_wide_part = 10000000000, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1, index_granularity_bytes = 10485760, index_granularity = 8192, merge_max_block_size = 8192, merge_max_block_size_bytes = 10485760, lock_acquire_timeout_for_background_operations = 600;

SELECT
    count(),
    dynamicType(d),
    isDynamicElementInSharedData(d)
FROM test
GROUP BY
    dynamicType(d),
    isDynamicElementInSharedData(d)
ORDER BY
    count() ASC,
    dynamicType(d) ASC;

SELECT '---------------------';