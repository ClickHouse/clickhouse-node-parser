SYSTEM drop  table if exists m3;

SYSTEM drop  table if exists replacing_m3;

-- { echoOn }
SET enable_analyzer = 1;

SET optimize_trivial_count_query = 1;

CREATE TABLE m3
(
    a Int64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM m3;

INSERT INTO m3;

INSERT INTO m3;

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN
        SELECT count()
        FROM m3
    )
WHERE like(`explain`, '%ReadFromPreparedSource (Optimized trivial count)%');

SELECT count(*)
FROM m3;

SELECT count(a)
FROM m3;

SELECT count(b)
FROM m3;

SELECT count() + 1
FROM m3;

SYSTEM drop  table m3;

-- checking queries with FINAL
CREATE TABLE replacing_m3
(
    a Int64,
    b UInt64
)
ENGINE = ReplacingMergeTree()
ORDER BY (a, b);

SELECT count()
FROM replacing_m3;

INSERT INTO replacing_m3;

INSERT INTO replacing_m3;

INSERT INTO replacing_m3;

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN
        SELECT count()
        FROM replacing_m3
    )
WHERE like(`explain`, '%ReadFromPreparedSource (Optimized trivial count)%');

SELECT count(*)
FROM replacing_m3;

SELECT count(a)
FROM replacing_m3;

SELECT count(b)
FROM replacing_m3;

SELECT count()
FROM replacing_m3 FINAL;

SELECT count(a)
FROM replacing_m3 FINAL;

SELECT count(b)
FROM replacing_m3 FINAL;

SYSTEM drop  table replacing_m3;