
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b < t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b <= t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b > t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF JOIN t2 ON t1.a = t2.a AND t1.b >= t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b < t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b <= t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b > t2.b ORDER BY t1.b;
SELECT * FROM t1 ASOF LEFT JOIN t2 ON t1.a = t2.a AND t1.b >= t2.b ORDER BY t1.b;
