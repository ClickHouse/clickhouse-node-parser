-- add_minmax_index_for_numeric_columns=0: Changes data_skipping_indices
SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    key UInt64,
    value String,
    INDEX value_index value TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS compress_marks = false, add_minmax_index_for_numeric_columns = 0;

INSERT INTO test_table;

SELECT *
FROM `system`.data_skipping_indices
WHERE database = currentDatabase();

SYSTEM DROP  TABLE test_table;