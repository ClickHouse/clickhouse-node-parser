SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (x)
ORDER BY x ASC;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (x)
ORDER BY x ASC;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
FULL JOIN nr AS r
    USING (x)
ORDER BY x ASC;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 1;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 1;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
FULL JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 1;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 1;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 1;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
FULL JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 1;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 0;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 0;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
FULL JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 0;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 0;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 0;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
FULL JOIN nr AS r
    USING (lc)
ORDER BY x ASC
SETTINGS enable_analyzer = 0;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (lc)
ORDER BY x ASC;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (lc)
ORDER BY x ASC;

SELECT
    x,
    lc,
    r.lc,
    toTypeName(r.lc)
FROM
    t AS l
FULL JOIN nr AS r
    USING (lc)
ORDER BY x ASC;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (lc)
ORDER BY x ASC;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (lc)
ORDER BY x ASC;

SELECT
    x,
    lc,
    materialize(r.lc) AS y,
    toTypeName(y)
FROM
    t AS l
FULL JOIN nr AS r
    USING (lc)
ORDER BY x ASC;