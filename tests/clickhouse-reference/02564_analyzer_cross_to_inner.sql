SELECT * FROM t1, t2, (SELECT a as x from t3 where a + 1 = b ) as t3
WHERE t1.a = if(t2.b > 0, t2.a, 0) AND t2.a = t3.x AND 1
;
SELECT * FROM t1, t2, (SELECT a as x from t3 where a + 1 = b ) as t3
WHERE t1.a = if(t2.b > 0, t2.a, 0)
ORDER BY t1.a, t2.a, t3.x
;
SELECT * FROM t1, t2, t3, t4, t5
WHERE t2.a = t3.a AND t1.b = t5.b;
SELECT * FROM t1, t2, t3, t4, t5
WHERE t2.a = t3.a AND t1.b = t5.b AND t4.a = t5.a;
SELECT * FROM t1, t2, t3, t4, t5
WHERE t1.a = t3.a AND t3.b = t4.b AND t1.a = t4.a AND t2.a = t5.a;
SELECT * FROM t1, t2, t3, t4, t5
WHERE t1.a = t2.a AND t1.a = t3.a AND t1.a = t4.a AND t1.a = t5.a
AND t2.a = t3.a AND t2.a = t4.a AND t2.a = t5.a
AND t3.a = t4.a AND t3.a = t5.a
AND t4.a = t5.a;
-- { echoOff }

SELECT * FROM t1, t2, (SELECT a as x from t3 where a + 1 = b ) as t3
WHERE t1.a = if(t2.b > 0, t2.a, 0)
SETTINGS cross_to_inner_join_rewrite = 2; -- { serverError INCORRECT_QUERY }
