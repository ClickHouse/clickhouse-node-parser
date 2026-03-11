SELECT t1.*, t2.* FROM t1 SEMI LEFT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
SELECT t1.*, t2.* FROM t1 SEMI RIGHT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
SELECT t1.*, t2.* FROM t1 ANTI LEFT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
SELECT t1.*, t2.* FROM t1 ANTI RIGHT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
