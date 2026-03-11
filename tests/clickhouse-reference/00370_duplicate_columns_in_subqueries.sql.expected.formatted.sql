SELECT
    x,
    y
FROM (
        SELECT
            1 AS x,
            2 AS y,
            x,
            y
    );

SELECT
    x,
    y
FROM (
        SELECT
            1 AS x,
            1 AS y,
            x,
            y
    );

SELECT x
FROM (
        SELECT
            1 AS x,
            1 AS y,
            x,
            y
    );

SELECT *
FROM (
        SELECT
            1 AS x,
            2 AS y,
            x,
            y
    );

SELECT *
FROM (
        SELECT
            1 AS a,
            1 AS b,
            1 AS c,
            b,
            c
    );

SELECT
    b,
    c
FROM (
        SELECT
            1 AS a,
            1 AS b,
            1 AS c,
            b,
            c
    );

SELECT
    b,
    c
FROM
    (
        SELECT
            1 AS a,
            1 AS b,
            1 AS c,
            b,
            c
    )
LEFT JOIN (
        SELECT 1 AS a
    )
    USING (a);

SELECT
    b,
    c
FROM
    (
        SELECT
            1 AS a,
            1 AS b,
            1 AS c,
            1 AS b,
            1 AS c
    )
LEFT JOIN (
        SELECT 1 AS a
    )
    USING (a);

SELECT
    a,
    b,
    c
FROM
    (
        SELECT
            42 AS a,
            1 AS b,
            2 AS c,
            1 AS b,
            2 AS c
    )
LEFT JOIN (
        SELECT
            42 AS a,
            3 AS d
    )
    USING (a);

SELECT
    a,
    b,
    c
FROM
    (
        SELECT
            42 AS a,
            1 AS b,
            2 AS c,
            1 AS b,
            2 AS c
    )
LEFT JOIN (
        SELECT
            42 AS a,
            3 AS d
    )
    USING (a)
ORDER BY d ASC;

SELECT
    k,
    a1,
    b1,
    a2,
    b2
FROM
    (
        SELECT
            0 AS k,
            'hello' AS a1,
            'world' AS b1,
            a1
    )
FULL JOIN (
        SELECT
            1 AS k,
            'hello' AS a2,
            'world' AS b2,
            a2
    )
    USING (k)
ORDER BY k ASC;