SELECT *
FROM
    table1 AS t1
LEFT JOIN (
        SELECT
            *,
            '0.10',
            c,
            d AS b
        FROM table2
    ) AS t2
    USING (a, b)
ORDER BY
    d ASC,
    t1.a ASC
FORMAT PrettyCompact
SETTINGS max_rows_in_join = 1;

SELECT
    pow('0.0000000257', NULL),
    pow(pow(NULL, NULL), NULL) - NULL,
    (val + NULL) = (rval * 0),
    *
FROM
    (
        SELECT
            (val + 256) = (NULL * NULL),
            toLowCardinality(toNullable(dummy)) AS val
        FROM `system`.one
    ) AS s1
LEFT JOIN (
        SELECT toLowCardinality(dummy) AS rval
        FROM `system`.one
    ) AS s2
    ON (val + 0) = (rval * 255)
SETTINGS max_rows_in_join = 1;