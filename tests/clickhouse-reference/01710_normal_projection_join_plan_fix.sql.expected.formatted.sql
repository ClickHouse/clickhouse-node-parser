CREATE TABLE t1
(
    id UInt32,
    s String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE t2
(
    id1 UInt32,
    id2 UInt32
)
ENGINE = MergeTree
ORDER BY id1
SETTINGS index_granularity = 1;

SELECT s
FROM
    t1 AS lhs
LEFT JOIN (
        SELECT *
        FROM t2
        WHERE id2 = 2
    ) AS rhs
    ON lhs.id = rhs.id2;