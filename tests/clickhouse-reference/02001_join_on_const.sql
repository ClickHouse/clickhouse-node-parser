SELECT count() == 2222 FROM t1 JOIN t2 ON 1 = 1;
SELECT count() == 0 FROM t1 JOIN t2 ON 1 = 2;
SELECT count() == 2 FROM t1 LEFT JOIN t2 ON 1 = 2;
SELECT count() == 1111  FROM t1 RIGHT JOIN t2 ON 1 = 2;
SELECT count() == 1113  FROM t1 FULL JOIN t2 ON 1 = 2;
