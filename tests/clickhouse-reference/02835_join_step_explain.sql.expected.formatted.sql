SET enable_analyzer = 1;

SET parallel_hash_join_threshold = 0;

SET enable_join_runtime_filters = 0;

CREATE TABLE test_table_1
(
    id UInt64,
    value_1 String,
    value_2 UInt64
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE test_table_2
(
    id UInt64,
    value_1 String,
    value_2 UInt64
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table_1;

INSERT INTO test_table_2;

SET query_plan_join_swap_table = 'false';

SELECT '--';