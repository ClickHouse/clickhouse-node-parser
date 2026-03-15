CREATE TABLE t0
(
    c0 Array(Int),
    c1 Tuple()
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM
    t0
ARRAY JOIN c0
ORDER BY c1 ASC;