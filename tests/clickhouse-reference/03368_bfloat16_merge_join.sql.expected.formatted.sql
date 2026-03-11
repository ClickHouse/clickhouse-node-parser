SELECT count()
FROM
    t0 AS t0d0
INNER JOIN t0 AS t1d0
    ON t1d0.c0 = t0d0.c0
INNER JOIN t0 AS t2d0
    ON t1d0.c1 = t2d0.c1
WHERE t1d0.c0 != t2d0.c0;

SELECT sum(t1d0.c0 != t2d0.c0)
FROM
    t0 AS t0d0
INNER JOIN t0 AS t1d0
    ON t1d0.c0 = t0d0.c0
INNER JOIN t0 AS t2d0
    ON t1d0.c1 = t2d0.c1;