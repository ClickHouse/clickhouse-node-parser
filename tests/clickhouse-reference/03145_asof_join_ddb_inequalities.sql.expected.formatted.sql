SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin > e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin > e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin <= e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin <= e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin < e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin < e.begin
ORDER BY p.begin ASC;