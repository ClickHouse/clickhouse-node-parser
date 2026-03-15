CREATE TABLE t (x UInt64) ENGINE = MergeTree ORDER BY tuple();
SELECT * FROM t;
SET mutations_sync = 1;
SELECT '---';
