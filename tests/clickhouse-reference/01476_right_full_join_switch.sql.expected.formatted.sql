SELECT
    x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    t AS l
FULL JOIN nr AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    t.x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    nr AS l
LEFT JOIN t AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    t.x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    nr AS l
RIGHT JOIN t AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    t.x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    nr AS l
FULL JOIN t AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    t.x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    t AS l
LEFT JOIN nr AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    t.x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    t AS l
RIGHT JOIN nr AS r
    USING (x)
ORDER BY t.x ASC;

SELECT
    t.x,
    l.s,
    r.s,
    toTypeName(l.s),
    toTypeName(r.s)
FROM
    t AS l
FULL JOIN nr AS r
    USING (x)
ORDER BY t.x ASC;