CREATE TABLE t
(
    a Int,
    b Int
)
ENGINE = MergeTree
ORDER BY (a, b)
SETTINGS index_granularity = 400;

SELECT sleep(1)
FORMAT Null; -- sleep a bit to wait possible merges after insert

SET max_threads = 1;

SELECT sum(a)
FROM t
WHERE a IN (0, 3)
    AND b = 0;