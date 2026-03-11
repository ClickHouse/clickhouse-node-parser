SELECT max(1), count() FROM t0 AS t0 LEFT JOIN t1 ON true WHERE 1;
SELECT max(1), count() FROM t0 AS t0 INNER JOIN t1 ON t0.c0 = t1.c1 WHERE 1;
SELECT max(1), count() FROM t0 AS t0 INNER JOIN t1 ON true WHERE 0;
