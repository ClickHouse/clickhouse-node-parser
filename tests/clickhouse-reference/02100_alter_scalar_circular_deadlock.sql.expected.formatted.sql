SYSTEM DROP  TABLE IF EXISTS foo;

CREATE TABLE foo
(
    ts DateTime,
    x UInt64
)
ENGINE = MergeTree
ORDER BY (ts)
PARTITION BY toYYYYMMDD(ts);

INSERT INTO foo (ts, x) SELECT
    toDateTime('2020-01-01 00:05:00'),
    number
FROM `system`.numbers_mt
LIMIT 10;

SET mutations_sync = 1;

SELECT sum(x) == 42
FROM foo;

SELECT sum(x) == 9
FROM foo;

SYSTEM DROP  TABLE IF EXISTS bar;

CREATE TABLE bar
(
    ts DateTime,
    x UInt64
)
ENGINE = Memory;

INSERT INTO bar (ts, x) SELECT
    toDateTime('2020-01-01 00:05:00'),
    number
FROM `system`.numbers_mt
LIMIT 10;

SELECT sum(x) == 42
FROM bar;

SELECT sum(x) == 9
FROM bar;