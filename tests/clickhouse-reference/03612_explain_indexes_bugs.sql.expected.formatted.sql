-- Tags: no-parallel-replicas
-- no-parallel-replicas because the output of explain is different.
-- add_minmax_index_for_numeric_columns=0: Different plan
SET enable_analyzer = 1;

CREATE TABLE points
(
    x Int64,
    y Int64
)
ENGINE = MergeTree
ORDER BY (x, y)
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE morton
(
    x UInt64,
    y UInt64
)
ENGINE = MergeTree
ORDER BY mortonEncode(x, y)
SETTINGS add_minmax_index_for_numeric_columns = 0;

SELECT x + y
FROM morton
WHERE x + 1 = 101;