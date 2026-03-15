SET output_format_pretty_color = 1;

SET enable_analyzer = 1;

CREATE TABLE table1
(
    a String,
    b Date
)
ENGINE = MergeTree
ORDER BY a;

CREATE TABLE table2
(
    c String,
    a String,
    d Date
)
ENGINE = MergeTree
ORDER BY c;

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