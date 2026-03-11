SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC,
    t1.s ASC,
    t2.s ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
RIGHT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC,
    t1.s ASC,
    t2.s ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC,
    t1.s ASC,
    t2.s ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
RIGHT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC,
    t1.s ASC,
    t2.s ASC;