CREATE TABLE t0 (c0 String) ENGINE = CoalescingMergeTree() ORDER BY tuple();
SELECT * FROM t0;
