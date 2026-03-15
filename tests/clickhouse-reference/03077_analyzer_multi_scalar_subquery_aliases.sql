-- https://github.com/ClickHouse/ClickHouse/issues/33825
SET enable_analyzer=1;
CREATE TABLE t1 (i Int64, j Int64) ENGINE = Memory;
SELECT
        (SELECT max(i) FROM t1) as i,
        (SELECT max(i) FROM t1) as j,
        (SELECT max(i) FROM t1) as k,
        (SELECT max(i) FROM t1) as l
FROM t1;
SELECT 1;
