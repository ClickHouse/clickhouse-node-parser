SELECT
    a,
    b,
    c,
    d
FROM
    (
        SELECT
            1 AS a,
            2 AS b,
            3 AS c
        UNION ALL
        SELECT
            2,
            3,
            4
    ) AS js1
INNER JOIN (
        SELECT
            1 AS a,
            2 AS b,
            4 AS d
        UNION ALL
        SELECT
            2,
            3,
            5
    ) AS js2
    USING (a)
ORDER BY
    a ASC,
    b ASC,
    c ASC,
    d ASC;

SELECT
    a,
    b,
    c,
    d
FROM
    (
        SELECT
            1 AS a,
            2 AS b,
            3 AS c
        UNION ALL
        SELECT
            2,
            3,
            4
    ) AS js1
LEFT JOIN (
        SELECT
            1 AS a,
            2 AS b,
            4 AS d
        UNION ALL
        SELECT
            2,
            3,
            5
    ) AS js2
    USING (a)
ORDER BY
    a ASC,
    b ASC,
    c ASC,
    d ASC;

SELECT
    a,
    b,
    c,
    d
FROM
    (
        SELECT
            1 AS a,
            2 AS b,
            3 AS c
        UNION ALL
        SELECT
            2,
            3,
            4
    ) AS js1
LEFT JOIN (
        SELECT
            1 AS a,
            2 AS b,
            4 AS d
        UNION ALL
        SELECT
            2,
            3,
            5
    ) AS js2
    USING (a, b)
ORDER BY
    a ASC,
    b ASC,
    c ASC,
    d ASC;