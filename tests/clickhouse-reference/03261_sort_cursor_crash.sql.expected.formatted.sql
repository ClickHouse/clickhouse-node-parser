-- https://github.com/ClickHouse/ClickHouse/issues/70779
-- Crash in SortCursorImpl with the old analyzer, which produces a block with 0 columns and 1 row
SYSTEM DROP  TABLE IF EXISTS t0;

SYSTEM DROP  TABLE IF EXISTS t1;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = AggregatingMergeTree()
ORDER BY tuple();

INSERT INTO t0 (c0);

SELECT 42
FROM t0 FINAL
PREWHERE t0.c0 = 1;

SYSTEM DROP  TABLE t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = SummingMergeTree()
ORDER BY tuple();

SELECT 43
FROM t0 FINAL
PREWHERE t0.c0 = 1;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = ReplacingMergeTree()
ORDER BY tuple();

SELECT 44
FROM t0 FINAL
PREWHERE t0.c0 = 1;

CREATE TABLE t1
(
    a0 UInt8,
    c0 Int32,
    c1 UInt8
)
ENGINE = AggregatingMergeTree()
ORDER BY tuple();

INSERT INTO t1 (a0, c0, c1);

SELECT 45
FROM t1 FINAL
PREWHERE t1.c0 = t1.c1;

SYSTEM DROP  TABLE t1;