SELECT
    * APPLY(x -> x + 1),
    b + 1 AS a
FROM
    t1
INNER JOIN t2
    USING (a)
ORDER BY `ALL` ASC;

SELECT
    t1.* APPLY(x -> x + 1),
    b + 1 AS a
FROM
    t1
INNER JOIN t2
    USING (a)
ORDER BY `ALL` ASC;

SELECT
    t2.* APPLY(x -> x + 1),
    b + 1 AS a
FROM
    t1
INNER JOIN t2
    USING (a)
ORDER BY `ALL` ASC;

SELECT
    (*, 1),
    b + 1 AS a,
    b + 1 AS a
FROM
    t1
INNER JOIN t2
    USING (a)
ORDER BY `ALL` ASC;