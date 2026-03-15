CREATE TABLE t
(
    n UInt64,
    s String DEFAULT concat('s', toString(n))
)
ENGINE = Memory;

CREATE TABLE dist
(
    n int
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), t);

CREATE TABLE buf
(
    n int
)
ENGINE = Buffer(currentDatabase(), dist, 1, 10, 100, 10, 100, 1000, 1000);

SELECT *
FROM t
ORDER BY n ASC;

-- table is not created if select fails
CREATE OR REPLACE TABLE `join`
ENGINE = Join(`ANY`, `INNER`, n) AS
SELECT *
FROM t
WHERE throwIf(n); -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }

SELECT count()
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'join';

-- table is created and filled
CREATE OR REPLACE TABLE `join`
ENGINE = Join(`ANY`, `INNER`, n) AS
SELECT *
FROM t;

SELECT *
FROM
    numbers(10) AS t
INNER JOIN `join`
    ON t.number = `join`.n
ORDER BY n ASC;

SELECT name
FROM `system`.tables
WHERE database = currentDatabase()
ORDER BY name ASC;