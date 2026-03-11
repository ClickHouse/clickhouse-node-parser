SELECT l.c
FROM
    (
        SELECT
            1 AS a,
            2 AS b
    ) AS l
INNER JOIN (
        SELECT
            2 AS b,
            3 AS c
    ) AS r
    USING (b);

SELECT r.a
FROM
    (
        SELECT
            1 AS a,
            2 AS b
    ) AS l
INNER JOIN (
        SELECT
            2 AS b,
            3 AS c
    ) AS r
    USING (b);

SELECT
    l.a,
    r.c
FROM
    (
        SELECT
            1 AS a,
            2 AS b
    ) AS l
INNER JOIN (
        SELECT
            2 AS b,
            3 AS c
    ) AS r
    USING (b);