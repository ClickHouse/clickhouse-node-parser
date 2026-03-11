SELECT 1
FROM
    (
        SELECT 1 AS a
    ) AS A
INNER JOIN (
        SELECT 1 AS b
    ) AS B
    ON equals(a);

SELECT 1
FROM
    (
        SELECT 1 AS a
    ) AS A
INNER JOIN (
        SELECT 1 AS b
    ) AS B
    ON less(a);

SELECT 1
FROM
    (
        SELECT 1 AS a
    ) AS A
INNER JOIN (
        SELECT
            1 AS b,
            1 AS c
    ) AS B
    ON a = b
    OR a = c;