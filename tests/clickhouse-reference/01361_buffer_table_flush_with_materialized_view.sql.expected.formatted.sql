CREATE TABLE t1_01361
(
    i UInt32,
    time DateTime
)
ENGINE = MergeTree()
ORDER BY time
PARTITION BY time;

CREATE TABLE t2_01361
(
    i UInt32,
    time DateTime
)
ENGINE = MergeTree()
ORDER BY time
PARTITION BY time;

CREATE MATERIALIZED VIEW mv1_01361
TO t2_01361
AS
SELECT *
FROM (
        SELECT *
        FROM t1_01361
    );

CREATE TABLE b1_01361 AS t1_01361
ENGINE = Buffer(currentDatabase(), t1_01361, 1, 0, 0, 1, 1, 1, 1);

SELECT count()
FROM b1_01361;

SELECT count()
FROM t1_01361;

SELECT count()
FROM t2_01361;