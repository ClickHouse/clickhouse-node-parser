SELECT a.x AS x
FROM
    a
LEFT JOIN b
    ON a.x = b.x
LEFT JOIN c
    ON a.x = c.x;

SELECT a.x AS x
FROM
    a
LEFT JOIN b
    ON a.x = b.x
LEFT JOIN c
    ON b.x = c.x;

SELECT b.x AS x
FROM
    a
LEFT JOIN b
    ON a.x = b.x
LEFT JOIN c
    ON b.x = c.x;

SELECT c.x AS x
FROM
    a
LEFT JOIN b
    ON a.x = b.x
LEFT JOIN c
    ON b.x = c.x;