CREATE TABLE t
(
    id UInt32,
    a Int
)
ENGINE = MergeTree
ORDER BY id;

SELECT s
FROM t
PREWHERE a = 1;