-- Tags: no-parallel-replicas, no-random-merge-tree-settings
-- followup to 02882_primary_key_index_in_function_different_types
-- add_minmax_index_for_numeric_columns=0: Different plan
DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value UInt64
)
ENGINE = MergeTree
ORDER BY (id, value)
SETTINGS index_granularity = 8192, index_granularity_bytes = '1Mi', add_minmax_index_for_numeric_columns = 0;

INSERT INTO test_table SELECT
    number,
    number
FROM numbers(10);

DROP TABLE test_table;