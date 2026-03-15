CREATE TABLE a
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY x;

SELECT *
FROM a
WHERE negate(x) = -42;

CREATE TABLE a
(
    x UInt128
)
ENGINE = MergeTree
ORDER BY x;

CREATE TABLE a
(
    x UInt256
)
ENGINE = MergeTree
ORDER BY x;