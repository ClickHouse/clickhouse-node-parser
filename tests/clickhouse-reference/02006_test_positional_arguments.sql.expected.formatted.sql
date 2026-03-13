-- { echo }
SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY 1 ASC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY -3 ASC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY x3 ASC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY 3 ASC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY -1 ASC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY x1 ASC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY 1 DESC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY -3 DESC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY x3 DESC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY 3 DESC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY -1 DESC;

SELECT
    x3,
    x2,
    x1
FROM test
ORDER BY x1 DESC;

SELECT
    x3,
    x2
FROM test
GROUP BY
    x3,
    x2
ORDER BY x3 ASC;

SELECT
    x3,
    x2
FROM test
GROUP BY
    1,
    2
ORDER BY x3 ASC;

SELECT
    x1,
    x2,
    x3
FROM test
ORDER BY x3 ASC
LIMIT 1 BY x3;

SELECT
    x1,
    x2,
    x3
FROM test
ORDER BY 3 ASC
LIMIT 1 BY 3;

SELECT
    x1,
    x2,
    x3
FROM test
ORDER BY x3 ASC
LIMIT 1 BY x1;

SELECT
    x1,
    x2,
    x3
FROM test
ORDER BY 3 ASC
LIMIT 1 BY 1;

SELECT
    max(x1),
    x2
FROM test
GROUP BY
    1,
    2; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }

SELECT
    1 + max(x1),
    x2
FROM test
GROUP BY
    1,
    2; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }

SELECT
    max(x1),
    x2
FROM test
GROUP BY
    -2,
    -1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }

SELECT
    1 + max(x1),
    x2
FROM test
GROUP BY
    -2,
    -1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }

SELECT
    x1,
    x1 * 2,
    max(x2),
    max(x3)
FROM test2
GROUP BY
    2,
    1,
    x1
ORDER BY
    1 ASC,
    2 ASC,
    4 DESC,
    3 ASC;

SELECT
    x1,
    x1 * 2,
    max(x2),
    max(x3)
FROM test2
GROUP BY
    2,
    1,
    x1
ORDER BY
    1 ASC,
    2 ASC,
    -1 DESC,
    -2 ASC;

SELECT
    a,
    b,
    c,
    d,
    e,
    f
FROM (
        SELECT
            44 AS a,
            88 AS b,
            13 AS c,
            14 AS d,
            15 AS e,
            16 AS f
    ) AS t
GROUP BY
    1,
    2,
    3,
    4,
    5,
    6
ORDER BY a ASC;

SELECT
    a,
    b,
    c,
    d,
    e,
    f
FROM (
        SELECT
            44 AS a,
            88 AS b,
            13 AS c,
            14 AS d,
            15 AS e,
            16 AS f
    ) AS t
GROUP BY
    1,
    2,
    3,
    -3,
    -2,
    -1
ORDER BY a ASC;

SELECT substr('aaaaaaaaaaaaaa', 8) AS a
GROUP BY a
ORDER BY a ASC;

SELECT substr('aaaaaaaaaaaaaa', 8) AS a
GROUP BY substr('aaaaaaaaaaaaaa', 8)
ORDER BY a ASC;

SELECT b
FROM (
        SELECT
            5 AS a,
            'Hello' AS b
        ORDER BY a ASC
    );

SELECT b
FROM (
        SELECT
            5 AS a,
            'Hello' AS b
        GROUP BY a
    );

SELECT b
FROM (
        SELECT
            5 AS a,
            'Hello' AS b
        ORDER BY 1 ASC
    );

SELECT count(*)
FROM (
        SELECT
            first_col,
            count(second_col)
        FROM tp2
        GROUP BY 1
    );

SELECT total
FROM (
        SELECT
            first_col,
            count(second_col) AS total
        FROM tp2
        GROUP BY 1
    );

SELECT first_col
FROM (
        SELECT
            first_col,
            second_col AS total
        FROM tp2
        ORDER BY 1 DESC
    );

SELECT first_col
FROM (
        SELECT
            first_col,
            second_col AS total
        FROM tp2
        ORDER BY 2 DESC
    );

SELECT max
FROM (
        SELECT
            max(first_col) AS max,
            second_col AS total
        FROM tp2
        GROUP BY 2
    )
ORDER BY 1 ASC;

SELECT
    count(*) AS value,
    0 AS data
FROM test
GROUP BY data;