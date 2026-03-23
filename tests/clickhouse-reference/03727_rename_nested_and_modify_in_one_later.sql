CREATE TABLE t0 (`c0.c1` Array(Int)) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO t0 VALUES ([1]);
