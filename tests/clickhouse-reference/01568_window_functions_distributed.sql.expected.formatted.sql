-- Tags: distributed
-- { echo }
SELECT row_number() OVER (ORDER BY dummy ASC) AS x
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', `system`, one)
    )
ORDER BY x ASC;

SELECT row_number() OVER (ORDER BY dummy ASC) AS x
FROM remote('127.0.0.{1,2}', `system`, one)
ORDER BY x ASC;

SELECT max(identity(dummy + 1)) OVER () AS x
FROM remote('127.0.0.{1,2}', `system`, one)
ORDER BY x ASC;

DROP TABLE IF EXISTS t_01568;

CREATE TABLE t_01568
ENGINE = Memory AS
SELECT
    intDiv(number, 3) AS p,
    modulo(number, 3) AS o,
    number
FROM numbers(9);

SELECT
    sum(number) AS x,
    max(number) AS y
FROM t_01568
ORDER BY
    x ASC,
    y ASC
WINDOW w AS (PARTITION BY p);

SELECT
    sum(number),
    max(number)
FROM t_01568
ORDER BY p ASC
WINDOW w AS (PARTITION BY p);

SELECT
    sum(number) AS x,
    max(number) AS y
FROM remote('127.0.0.{1,2}', '', t_01568)
ORDER BY
    x ASC,
    y ASC
WINDOW w AS (PARTITION BY p);

SELECT
    sum(number) AS x,
    max(number) AS y
FROM remote('127.0.0.{1,2}', '', t_01568)
ORDER BY
    x ASC,
    y ASC
WINDOW w AS (PARTITION BY p)
SETTINGS max_threads = 1;

SELECT DISTINCT
    sum(number) AS x,
    max(number) AS y
FROM remote('127.0.0.{1,2}', '', t_01568)
ORDER BY
    x ASC,
    y ASC
WINDOW w AS (PARTITION BY p);

-- window functions + aggregation w/shards
SELECT groupArray(groupArray(number)) OVER (ROWS UNBOUNDED PRECEDING) AS x
FROM remote('127.0.0.{1,2}', '', t_01568)
GROUP BY mod(number, 3)
ORDER BY x ASC;

SELECT groupArray(groupArray(number)) OVER (ROWS UNBOUNDED PRECEDING) AS x
FROM remote('127.0.0.{1,2}', '', t_01568)
GROUP BY mod(number, 3)
ORDER BY x ASC
SETTINGS distributed_group_by_no_merge = 1;

SELECT groupArray(groupArray(number)) OVER (ROWS UNBOUNDED PRECEDING) AS x
FROM remote('127.0.0.{1,2}', '', t_01568)
GROUP BY mod(number, 3)
ORDER BY x ASC
SETTINGS distributed_group_by_no_merge = 2; -- { serverError NOT_IMPLEMENTED }

-- proper ORDER BY w/window functions
SELECT
    p,
    o,
    count() OVER (PARTITION BY p)
FROM remote('127.0.0.{1,2}', '', t_01568)
ORDER BY
    p ASC,
    o ASC;

DROP TABLE t_01568;