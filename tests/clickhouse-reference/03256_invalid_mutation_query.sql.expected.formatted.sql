DROP TABLE IF EXISTS t;

DROP TABLE IF EXISTS t2;

CREATE TABLE t
(
    x int
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE t2
(
    x int
)
ENGINE = MergeTree()
ORDER BY tuple();

DROP TABLE t;

DROP TABLE t2;