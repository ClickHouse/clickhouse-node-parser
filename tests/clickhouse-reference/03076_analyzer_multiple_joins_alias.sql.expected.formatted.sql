SELECT *
FROM
    (
        SELECT 1 AS x
    ) AS a
INNER JOIN (
        SELECT
            1 AS x,
            2 AS y
    ) AS b
    ON (a.x = b.x)
    AND (a.y = b.y);

SELECT *
FROM
    (
        SELECT 1 AS x
    ) AS a
INNER JOIN (
        SELECT
            1 AS x,
            2 AS y
    ) AS b
    ON (a.x = b.x)
    AND (a.y = b.y)
INNER JOIN (
        SELECT 3 AS x
    ) AS c
    ON a.x = c.x;

SELECT *
FROM
    (
        SELECT number AS x
        FROM numbers(10)
    ) AS a
INNER JOIN (
        SELECT
            number AS x,
            number AS y
        FROM numbers(10)
    ) AS b
    ON (a.x = b.x)
    AND (a.y = b.y)
INNER JOIN (
        SELECT number AS x
        FROM numbers(10)
    ) AS c
    ON a.x = c.x;