-- https://github.com/ClickHouse/ClickHouse/issues/50570
SYSTEM DROP  TABLE IF EXISTS tnul SYNC;

SYSTEM DROP  TABLE IF EXISTS tlc SYNC;

CREATE TABLE tnul
(
    lc Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tnul;

SELECT lc
FROM tnul
WHERE notIn(lc, ('rty', 'uiop'));

SYSTEM DROP  TABLE tnul SYNC;

CREATE TABLE tlc
(
    lc LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tlc;

SELECT lc
FROM tlc
WHERE notIn(lc, ('rty', 'uiop'));

SYSTEM DROP  TABLE tlc SYNC;