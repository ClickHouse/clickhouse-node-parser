CREATE TABLE t0 (c0 Int) ENGINE = AggregatingMergeTree() ORDER BY tuple();
SELECT 42 FROM t0 FINAL PREWHERE t0.c0 = 1;
CREATE TABLE t0 (c0 Int) ENGINE = SummingMergeTree() ORDER BY tuple();
SELECT 43 FROM t0 FINAL PREWHERE t0.c0 = 1;
CREATE TABLE t0 (c0 Int) ENGINE = ReplacingMergeTree() ORDER BY tuple();
SELECT 44 FROM t0 FINAL PREWHERE t0.c0 = 1;
CREATE TABLE t1 (a0 UInt8, c0 Int32, c1 UInt8) ENGINE = AggregatingMergeTree() ORDER BY tuple();
SELECT 45 FROM t1 FINAL PREWHERE t1.c0 = t1.c1;
