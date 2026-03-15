CREATE TABLE t
(
    a Int
)
ENGINE = MergeTree
ORDER BY a;

SELECT s
FROM t
PREWHERE a != 1
WHERE rowNumberInBlock() % 2 = 0
LIMIT 1;