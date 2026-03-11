SELECT coalesce(t1.x, t2.x, t3.x, t4.x) AS x
FROM
    t1
FULL JOIN t2
    USING (x)
FULL JOIN t3
    USING (x)
FULL JOIN t4
    USING (x);

SELECT 1 AS x
FROM
    t1
FULL JOIN t2
    USING (x)
FULL JOIN t3
    USING (x)
FULL JOIN t4
    USING (x);

SELECT 1 AS x
FROM
    t1
RIGHT JOIN t2
    USING (x)
RIGHT JOIN t3
    USING (x)
RIGHT JOIN t4
    USING (x);

SELECT 1 AS x
FROM
    t1
LEFT JOIN t2
    USING (x)
LEFT JOIN t3
    USING (x)
LEFT JOIN t4
    USING (x);

SELECT 1 AS x
FROM
    t1
RIGHT JOIN t2
    USING (x)
FULL JOIN t3
    USING (x)
INNER JOIN t4
    USING (x);