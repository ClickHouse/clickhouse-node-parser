SET optimize_trivial_insert_select = 1;

SET check_query_single_value_result = 0;

CREATE TABLE check_query_test
(
    SomeKey UInt64,
    SomeValue String
)
ENGINE = MergeTree()
ORDER BY SomeKey
SETTINGS min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0;

CREATE TABLE check_query_test_non_adaptive
(
    SomeKey UInt64,
    SomeValue String
)
ENGINE = MergeTree()
ORDER BY SomeKey
SETTINGS index_granularity_bytes = 0, min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0;