SELECT *
FROM table1 AS t1
FORMAT PrettyCompact;

SELECT
    *,
    c AS a,
    d AS b
FROM table2
FORMAT PrettyCompact;

SELECT *
FROM
    table1 AS t1
LEFT JOIN (
        SELECT
            *,
            c,
            d AS b
        FROM table2
    ) AS t2
    USING (a, b)
ORDER BY
    d ASC,
    t1.a ASC
FORMAT PrettyCompact;

SELECT *
FROM
    table1 AS t1
INNER JOIN (
        SELECT
            *,
            c,
            d AS b
        FROM table2
    ) AS t2
    USING (a, b)
ORDER BY
    d ASC,
    t1.a ASC
FORMAT PrettyCompact;