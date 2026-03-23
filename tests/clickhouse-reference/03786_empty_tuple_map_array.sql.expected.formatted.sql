DROP TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Map(Tuple(Tuple(), Int), Int)
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO t0 (c0);

SELECT *
FROM t0;

DROP TABLE IF EXISTS t1;

CREATE TABLE t1
(
    c0 Map(Tuple(Tuple(), Int), Int)
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO t1 (c0);

SELECT *
FROM t1;