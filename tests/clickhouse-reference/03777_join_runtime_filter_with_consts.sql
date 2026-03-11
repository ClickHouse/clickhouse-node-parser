SELECT * FROM (SELECT 1 as a) t1
JOIN (SELECT 1 as a) as t2
ON t1.a = t2.a;
