SELECT
    'n rj n',
    t1.x,
    t2.x
FROM
    nt AS t1
RIGHT JOIN nt AS t2
    ON t1.x = t2.x
ORDER BY t1.x ASC;

SELECT
    'n fj n',
    t1.x,
    t2.x
FROM
    nt AS t1
FULL JOIN nt AS t2
    ON t1.x = t2.x
ORDER BY t1.x ASC;

SELECT
    't rj n',
    t1.x,
    t2.x
FROM
    t AS t1
RIGHT JOIN nt AS t2
    ON t1.x = t2.x
ORDER BY t1.x ASC;

SELECT
    't fj n',
    t1.x,
    t2.x
FROM
    t AS t1
FULL JOIN nt AS t2
    ON t1.x = t2.x
ORDER BY t1.x ASC;

SELECT
    'n rj t',
    t1.x,
    t2.x
FROM
    nt AS t1
RIGHT JOIN t AS t2
    ON t1.x = t2.x
ORDER BY t1.x ASC;

SELECT
    'n fj t',
    t1.x,
    t2.x
FROM
    nt AS t1
FULL JOIN t AS t2
    ON t1.x = t2.x
ORDER BY t1.x ASC;

SELECT
    'n rj n',
    t1.x,
    t2.x
FROM
    nt AS t1
RIGHT JOIN nt AS t2
    USING (x)
ORDER BY t1.x ASC;

SELECT
    'n fj n',
    t1.x,
    t2.x
FROM
    nt AS t1
FULL JOIN nt AS t2
    USING (x)
ORDER BY t1.x ASC;

SELECT
    't rj n',
    t1.x,
    t2.x
FROM
    t AS t1
RIGHT JOIN nt AS t2
    USING (x)
ORDER BY t1.x ASC;

SELECT
    't fj n',
    t1.x,
    t2.x
FROM
    t AS t1
FULL JOIN nt AS t2
    USING (x)
ORDER BY t1.x ASC;

SELECT
    'n rj t',
    t1.x,
    t2.x
FROM
    nt AS t1
RIGHT JOIN t AS t2
    USING (x)
ORDER BY t1.x ASC;

SELECT
    'n fj t',
    t1.x,
    t2.x
FROM
    nt AS t1
FULL JOIN t AS t2
    USING (x)
ORDER BY t1.x ASC;

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
INNER JOIN nt AS t2
    ON t1.x = t2.x;

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
LEFT JOIN nt AS t2
    ON t1.x = t2.x;

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
RIGHT JOIN nt AS t2
    ON t1.x = t2.x;

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
FULL JOIN nt AS t2
    ON t1.x = t2.x;

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
INNER JOIN nt AS t2
    USING (x);

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
LEFT JOIN nt AS t2
    USING (x);

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
RIGHT JOIN nt AS t2
    USING (x);

SELECT
    sum(isNull(t1.x)),
    count(t1.x)
FROM
    nt AS t1
FULL JOIN nt AS t2
    USING (x);