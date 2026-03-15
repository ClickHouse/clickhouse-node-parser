CREATE TABLE test_table
(
    id UInt64,
    value UInt64
)
ENGINE = MergeTree
ORDER BY (id, value)
SETTINGS index_granularity = 8192, index_granularity_bytes = '1Mi', add_minmax_index_for_numeric_columns = 0;