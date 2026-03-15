-- https://github.com/ClickHouse/ClickHouse/issues/89909
SET enable_analyzer = 1;

CREATE TABLE t0
(
    c0 String
)
ENGINE = Log();

SELECT
    c0,
    c0.size
FROM t0;

SELECT t0.c0.size
FROM t0
WHERE t0.c0 IN (1);

CREATE TABLE t0
(
    c0 Int,
    c3 String
)
ENGINE = TinyLog();

CREATE TABLE t1
(
    c0 Int
)
ENGINE = Memory;

SELECT 1
FROM
    (
        SELECT 1 AS c0
    ) AS t1
CROSS JOIN t0
GROUP BY
    t0.c3,
    t0.c3.size;

CREATE OR REPLACE TABLE t0
(
    c0 Nullable(String)
)
ENGINE = Log();

SELECT concat([1], c0.size)
FROM t0
GROUP BY
    1,
    c0,
    c0.size
WITH ROLLUP
FORMAT Null;