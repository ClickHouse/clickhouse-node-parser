CREATE TABLE t
(
    a UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS add_minmax_index_for_numeric_columns = 1;