CREATE TABLE t1
(
    c0 Int32,
    PRIMARY KEY(c0)
)
ENGINE = MergeTree;

SELECT MIN(t1.c0)
FROM t1
SETTINGS aggregate_functions_null_for_empty = 1;