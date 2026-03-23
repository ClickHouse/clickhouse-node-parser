DROP TABLE IF EXISTS mv;

DROP TABLE IF EXISTS dst;

DROP TABLE IF EXISTS src;

DROP DICTIONARY IF EXISTS dict;

CREATE TABLE src
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE dst
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE DICTIONARY dict
(
    key Int,
    value Int
)
PRIMARY KEY key
SOURCE(clickhouse(query 'select 0 key, 0 value'))
LAYOUT(DIRECT());

CREATE MATERIALIZED VIEW mv
TO dst
AS
SELECT *
FROM src;