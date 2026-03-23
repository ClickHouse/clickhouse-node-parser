SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS src;

SYSTEM DROP  TABLE IF EXISTS dst;

SYSTEM DROP  VIEW IF EXISTS mv;

CREATE TABLE src
(
    data Array(Tuple(id UInt32)),
    dummy UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE dst
(
    id String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE MATERIALIZED VIEW mv
TO dst
AS
SELECT data_joined.id AS id
FROM (
        SELECT arrayJoin(data) AS data_joined
        FROM src
    )
WHERE data_joined.id != 42;

INSERT INTO src;

SELECT *
FROM src;

SELECT *
FROM dst;

SYSTEM DROP  VIEW mv;

SYSTEM DROP  TABLE dst;

SYSTEM DROP  TABLE src;