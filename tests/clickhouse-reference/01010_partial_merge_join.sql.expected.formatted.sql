SELECT *
FROM
    t1
LEFT JOIN t0
    USING (x)
ORDER BY x ASC;

SELECT *
FROM
    t1
LEFT JOIN t0
    USING (x)
ORDER BY x ASC;

SELECT *
FROM
    t1
INNER JOIN t0
    USING (x)
ORDER BY x ASC;

SELECT *
FROM
    t1
INNER JOIN t0
    USING (x)
ORDER BY x ASC;

SELECT *
FROM
    t1
LEFT JOIN t0
    ON t1.x = t0.x
ORDER BY x ASC;

SELECT *
FROM
    t1
LEFT JOIN t0
    ON t1.x = t0.x
ORDER BY x ASC;

SELECT *
FROM
    t1
INNER JOIN t0
    ON t1.x = t0.x
ORDER BY x ASC;

SELECT *
FROM
    t1
INNER JOIN t0
    ON t1.x = t0.x
ORDER BY x ASC;

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x);

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x);

SELECT *
FROM
    t0
INNER JOIN t1
    USING (x);

SELECT *
FROM
    t0
INNER JOIN t1
    USING (x);

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
INNER JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
INNER JOIN t1
    ON t1.x = t0.x;

SELECT
    t1.*,
    t2.x
FROM
    t1
LEFT JOIN t2
    USING (x)
ORDER BY x ASC;

SELECT
    t1.*,
    t2.x
FROM
    t1
LEFT JOIN t2
    USING (x, y)
ORDER BY x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.x = t2.x
ORDER BY
    x ASC,
    t2.y ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.y = t2.y
ORDER BY x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.x = t2.x
    AND t1.y = t2.y
ORDER BY x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.x = t2.x
    AND toUInt32(intDiv(t1.y, 10)) = t2.x
ORDER BY
    x ASC,
    t2.y ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.x = t2.x
    AND toUInt64(t1.x) = intDiv(t2.y, 10)
ORDER BY
    x ASC,
    t2.y ASC;

SELECT
    t1.*,
    t2.x
FROM
    t1
INNER JOIN t2
    USING (x)
ORDER BY x ASC;

SELECT
    t1.*,
    t2.x
FROM
    t1
INNER JOIN t2
    USING (x, y)
ORDER BY x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
ORDER BY
    x ASC,
    t2.y ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
INNER JOIN t2
    ON t1.y = t2.y
ORDER BY x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
    AND t1.y = t2.y
ORDER BY x ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
    AND toUInt32(intDiv(t1.y, 10)) = t2.x
ORDER BY
    x ASC,
    t2.y ASC;

SELECT
    t1.*,
    t2.*
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
    AND toUInt64(t1.x) = intDiv(t2.y, 10)
ORDER BY
    x ASC,
    t2.y ASC;