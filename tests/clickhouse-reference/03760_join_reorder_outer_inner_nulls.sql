SELECT t1.b FROM t0
LEFT JOIN t1 ON t0.a = t1.b
INNER JOIN t2 ON t0.a = t2.c
ORDER BY t1.b
SETTINGS join_use_nulls = 1
;
SELECT t1.b FROM (SELECT 1 a) t0
LEFT JOIN (SELECT 1 b) t1 ON t0.a = t1.b
CROSS JOIN (SELECT 1 c) t2
SETTINGS join_use_nulls = 1
;
