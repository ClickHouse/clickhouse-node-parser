CREATE TABLE t0
(
    c0 Map(Tuple(Tuple(), Int), Int)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t0;

CREATE TABLE t1
(
    c0 Map(Tuple(Tuple(), Int), Int)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t1;