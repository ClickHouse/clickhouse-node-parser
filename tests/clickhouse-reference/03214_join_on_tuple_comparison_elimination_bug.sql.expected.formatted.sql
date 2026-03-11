SELECT a.key
FROM
    a
LEFT JOIN b
    ON tuple(a.key) = tuple(b.key)
ORDER BY a.key ASC;

SELECT a.key
FROM
    a
LEFT JOIN b
    ON a.key <=> b.key
ORDER BY a.key ASC;

SELECT a.key
FROM
    a
LEFT JOIN b
    ON tuple(a.key) = tuple(b.key)
ORDER BY a.key ASC;