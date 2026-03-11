SELECT v
FROM test__fuzz_22
ORDER BY v ASC
LIMIT 10, 10
SETTINGS merge_tree_min_rows_for_concurrent_read = 9223372036854775806;

SELECT '---';

SELECT
    k,
    v
FROM test__fuzz_22
ORDER BY k ASC
LIMIT 100, 10
SETTINGS
    optimize_read_in_order = 1,
    merge_tree_min_rows_for_concurrent_read = 9223372036854775806;