-- Test for issue #75677
SYSTEM drop  table if exists t;

CREATE TABLE t
(
    a UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS add_minmax_index_for_numeric_columns = 1;

SYSTEM drop  table t;