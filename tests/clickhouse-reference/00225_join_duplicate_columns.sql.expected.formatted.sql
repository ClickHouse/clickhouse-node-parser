SELECT b
FROM
    (
        SELECT
            1 AS a,
            42 AS c
    ) AS js1
LEFT JOIN (
        SELECT
            2 AS b,
            2 AS b,
            41 AS c
    ) AS js2
    USING (c);

SELECT b
FROM
    (
        SELECT
            1 AS a,
            42 AS c
    ) AS js1
LEFT JOIN (
        SELECT
            2 AS b,
            2 AS b,
            42 AS c
    ) AS js2
    USING (c);

SELECT
    c,
    a,
    a,
    b,
    b
FROM
    (
        SELECT
            1 AS a,
            1 AS a,
            42 AS c
        GROUP BY c
        ORDER BY
            a ASC,
            c ASC
    ) AS js1
LEFT JOIN (
        SELECT
            2 AS b,
            2 AS b,
            41 AS c
        GROUP BY c
        ORDER BY
            b ASC,
            c ASC
    ) AS js2
    USING (c)
ORDER BY b ASC;