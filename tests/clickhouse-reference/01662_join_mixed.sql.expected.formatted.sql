SELECT *
FROM
    (
        SELECT
            'a' AS a,
            'b' AS b,
            42 AS forty_two
    ) AS t1
INNER JOIN (
        SELECT
            'a' AS a,
            'b' AS b,
            42 AS forty_two
    ) AS t2
    ON t1.b = t2.a
    OR t1.forty_two = t2.forty_two;

SELECT *
FROM
    (
        SELECT
            'a' AS a,
            'b' AS b,
            42 AS forty_two
    ) AS t1
INNER JOIN (
        SELECT
            'a' AS a,
            'b' AS b,
            42 AS forty_two
    ) AS t2
    ON t1.b = t2.b
    OR t1.forty_two = t2.forty_two;