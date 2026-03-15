-- Tags: long, no-tsan, no-msan, no-ubsan, no-asan
-- Random settings limits: index_granularity=(100, None); merge_max_block_size=(100, None)
SET allow_experimental_variant_type = 1;

SET use_variant_as_common_type = 1;

SET allow_experimental_dynamic_type = 1;

SET enable_named_columns_in_function_tuple = 0;

CREATE TABLE test
(
    id UInt64,
    d Dynamic(max_types=2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_rows_for_wide_part = 1000000000, min_bytes_for_wide_part = 10000000000, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1, lock_acquire_timeout_for_background_operations = 600;

SELECT
    count(),
    concat(dynamicType(d), ':', dynamicType(d.`Tuple(a Dynamic(max_types=2))`.a)) AS type,
    isDynamicElementInSharedData(d.`Tuple(a Dynamic(max_types=2))`.a) AS flag
FROM test
GROUP BY
    type,
    flag
ORDER BY
    count() ASC,
    type ASC;

SELECT '---------------------';