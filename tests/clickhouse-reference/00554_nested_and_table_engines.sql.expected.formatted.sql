SELECT *
FROM nested
ORDER BY x ASC;

SELECT
    x,
    n.a
FROM nested
ORDER BY x ASC;

SELECT
    n.a,
    n.b
FROM nested
ORDER BY n.a ASC;