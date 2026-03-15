CREATE TABLE t0 (c0 String) ENGINE = MergeTree() ORDER BY tuple();
SELECT c0 FROM t0;
