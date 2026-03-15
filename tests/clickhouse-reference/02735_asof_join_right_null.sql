CREATE TABLE t1 (a Int, b Int) ENGINE = Memory;
CREATE TABLE t2 (a Int, b Nullable(Int)) ENGINE = Memory;
-- { echoOn }
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b < t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b <= t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b > t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b >= t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b < t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b <= t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b > t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b >= t2.b ORDER BY t1.b;
SET join_use_nulls = 1;
