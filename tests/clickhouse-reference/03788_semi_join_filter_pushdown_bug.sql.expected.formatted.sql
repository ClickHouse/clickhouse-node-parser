SELECT 1
FROM
    t0 AS t1
LEFT JOIN t0 AS t2
    ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;

SELECT 1
FROM
    t0 AS t1
INNER JOIN t0 AS t2
    ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;

SELECT 1
FROM
    t0 AS t1
RIGHT JOIN t0 AS t2
    ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;