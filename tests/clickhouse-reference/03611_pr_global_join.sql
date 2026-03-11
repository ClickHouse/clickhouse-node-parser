SELECT *
FROM t2
INNER JOIN t2 AS tx ON true
RIGHT JOIN t1 ON true;
SELECT '---';
-- this query was problematic, now GLOBAL JOINs has been disabled in n-way JOINs
SELECT *
FROM t2
INNER JOIN t2 AS tx ON true
GLOBAL RIGHT JOIN t1 ON true;
-- just check that simple GLOBAL JOIN works with parallel replicas
SELECT *
FROM t2 GLOBAL RIGHT JOIN t1 ON true;
