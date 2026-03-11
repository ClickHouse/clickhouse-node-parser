SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t2
LEFT JOIN t1
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
INNER JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t2
INNER JOIN t1
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
RIGHT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t2
RIGHT JOIN t1
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
RIGHT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
RIGHT JOIN t2
    USING (x)
ORDER BY
    t1.x ASC,
    t2.x ASC;