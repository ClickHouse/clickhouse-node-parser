SET enable_json_type = 1;

CREATE TABLE src
(
    a Tuple(b Tuple(c UInt32)),
    json JSON(`x.y` UInt32)
)
ENGINE = Memory;

CREATE TABLE dst
(
    a UInt32,
    x UInt32,
    z UInt32
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW view
TO dst
AS
SELECT
    a.b.c AS a,
    json.x.y AS x,
    json.z::UInt32 AS z
FROM src;

INSERT INTO src SELECT
    tuple(tuple(1)),
    '{"x" : {"y" : 2}, "z" : 3}';

SELECT *
FROM dst;