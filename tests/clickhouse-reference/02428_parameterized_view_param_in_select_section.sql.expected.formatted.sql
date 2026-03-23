-- https://github.com/ClickHouse/ClickHouse/issues/56564
CREATE TABLE t
(
    z String,
    ts DateTime
)
ENGINE = Memory AS
SELECT
    '1',
    '2020-01-01 00:00:00';

CREATE VIEW v1
AS
SELECT
    z,
    'test' = {m:String} AS c
FROM t
WHERE ts > '2019-01-01 00:00:00'
GROUP BY
    z,
    c;

CREATE VIEW v2
AS
SELECT
    z,
    {m:String} AS c
FROM t
WHERE ts > '2019-01-01 00:00:00'
GROUP BY
    z,
    c;

CREATE VIEW v3
AS
SELECT
    z,
    {m:String}
FROM t;

SELECT *
FROM v1(m = 'test');

SELECT *
FROM v2(m = 'test');

SELECT *
FROM v3(m = 'test');

SYSTEM drop  table t;

SYSTEM drop  view v1;

SYSTEM drop  view v2;

SYSTEM drop  view v3;

CREATE TABLE t
(
    z String,
    ts DateTime
)
ENGINE = MergeTree
ORDER BY z AS
SELECT
    '1',
    '2020-01-01 00:00:00';