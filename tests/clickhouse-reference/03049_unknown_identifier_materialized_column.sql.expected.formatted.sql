-- https://github.com/ClickHouse/ClickHouse/issues/54317
SET enable_analyzer = 1;

DROP DATABASE IF EXISTS {CLICKHOUSE_DATABASE:Identifier};

CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier};

USE {CLICKHOUSE_DATABASE:Identifier};

CREATE TABLE l
(
    y String
)
ENGINE = Memory;

CREATE TABLE r
(
    d Date,
    y String,
    ty UInt16 MATERIALIZED toYear(d)
)
ENGINE = Memory;

SELECT *
FROM
    l AS L
LEFT JOIN r AS R
    ON L.y = R.y
WHERE R.ty >= 2019;

SELECT *
FROM
    l
LEFT JOIN r
    ON l.y = r.y
WHERE r.ty >= 2019;

SELECT *
FROM
    {CLICKHOUSE_DATABASE:Identifier}.l
LEFT JOIN {CLICKHOUSE_DATABASE:Identifier}.r
    ON l.y = r.y
WHERE r.ty >= 2019;