CREATE TABLE t0 (c0 Dynamic) ENGINE = SummingMergeTree() ORDER BY tuple();
SELECT c0 FROM t0 FINAL;
