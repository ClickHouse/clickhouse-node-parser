SELECT 1
FROM
    t AS l
INNER JOIN t AS r
    ON l.id = r.id
PREWHERE l.x;

SELECT 2
FROM
    t AS l
INNER JOIN t AS r
    ON l.id = r.id
WHERE r.x;

SELECT 3
FROM
    t AS l
INNER JOIN t AS r
    ON l.id = r.id
PREWHERE l.x
WHERE r.x;

SELECT 4
FROM
    t AS l
INNER JOIN t AS r
    USING (id)
PREWHERE l.x
WHERE r.x;

SELECT 5
FROM
    t AS l
INNER JOIN t AS r
    ON l.id = r.id
WHERE l.x
    AND r.x;

SELECT 6
FROM
    t AS l
INNER JOIN t AS r
    USING (id)
WHERE l.x
    AND r.x;

SELECT 7
FROM
    t AS l
INNER JOIN t AS r
    ON l.id = r.id
WHERE l.x
    AND r.x;

SELECT 8
FROM
    t AS l
INNER JOIN t AS r
    USING (id)
WHERE l.x
    AND r.x;