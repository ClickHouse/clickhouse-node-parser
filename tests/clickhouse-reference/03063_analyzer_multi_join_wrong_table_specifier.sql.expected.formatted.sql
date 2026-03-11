SELECT *
FROM
    t1
INNER JOIN s
    ON t1.k = s.k
INNER JOIN t2
    ON t2.x = t1.x
WHERE (t1.d >= now());

SELECT *
FROM
    t1
INNER JOIN s
    ON t1.k = s.k
WHERE (t1.d >= now());