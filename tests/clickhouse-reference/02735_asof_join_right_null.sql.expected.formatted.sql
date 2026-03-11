SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.a = t2.a
    AND t1.b < t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.a = t2.a
    AND t1.b <= t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.a = t2.a
    AND t1.b > t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.a = t2.a
    AND t1.b >= t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON t1.a = t2.a
    AND t1.b < t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON t1.a = t2.a
    AND t1.b <= t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON t1.a = t2.a
    AND t1.b > t2.b
ORDER BY t1.b ASC;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON t1.a = t2.a
    AND t1.b >= t2.b
ORDER BY t1.b ASC;