SELECT t1.b
FROM
    t0
LEFT JOIN t1
    ON t0.a = t1.b
INNER JOIN t2
    ON t0.a = t2.c
ORDER BY t1.b ASC
SETTINGS join_use_nulls = 1;

SELECT t1.b
FROM
    (
        SELECT 1 AS a
    ) AS t0
LEFT JOIN (
        SELECT 1 AS b
    ) AS t1
    ON t0.a = t1.b
CROSS JOIN (
        SELECT 1 AS c
    ) AS t2
SETTINGS join_use_nulls = 1;