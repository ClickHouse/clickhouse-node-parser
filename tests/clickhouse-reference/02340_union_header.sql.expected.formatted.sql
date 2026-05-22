-- { echo }
SELECT
    a,
    b,
    c
FROM (
        SELECT
            3 AS a,
            2147483647 AS b,
            1048575 AS c
        UNION ALL
        SELECT
            -2,
            NULL,
            -2
    ) AS js1
ORDER BY a ASC;

SELECT
    a,
    b,
    c,
    d
FROM
    (
        SELECT
            3 AS a,
            2147483647 AS b,
            1048575 AS c
        UNION ALL
        SELECT
            -2,
            NULL,
            -2
    ) AS js1
LEFT JOIN (
        SELECT
            100 AS a,
            -9223372036854775808 AS b,
            NULL AS d
        UNION ALL
        SELECT
            256,
            256,
            NULL
    ) AS js2
    USING (a, b)
ORDER BY
    a DESC,
    '-0.02' ASC,
    b ASC,
    c DESC,
    1048575 ASC,
    d DESC
SETTINGS enable_positional_arguments = 0;