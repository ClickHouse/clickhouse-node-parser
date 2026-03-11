SELECT
    b,
    sum(c)
FROM (
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union2
        WHERE a > 1
        GROUP BY
            a,
            b
        UNION ALL
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union2
        WHERE b > 1
        GROUP BY
            a,
            b
        ORDER BY
            a ASC,
            b ASC
    ) AS a
GROUP BY b
ORDER BY b ASC;

SELECT
    b,
    sum(c)
FROM (
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union1
        WHERE a > 1
        GROUP BY
            a,
            b
        UNION ALL
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union2
        WHERE b > 1
        GROUP BY
            a,
            b
        ORDER BY
            a ASC,
            b ASC
    ) AS a
GROUP BY b
ORDER BY b ASC;

SELECT
    b,
    sum(c)
FROM (
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union1
        WHERE a > 1
        GROUP BY
            a,
            b
        UNION ALL
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union1
        WHERE b > 1
        GROUP BY
            a,
            b
        ORDER BY
            a ASC,
            b ASC
    ) AS a
GROUP BY b
ORDER BY b ASC;

SELECT
    b,
    sum(c)
FROM (
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union2
        WHERE a > 1
        GROUP BY
            a,
            b
        UNION ALL
        SELECT
            a,
            b,
            sum(c) AS c
        FROM union3
        WHERE b > 1
        GROUP BY
            a,
            b
        ORDER BY
            a ASC,
            b ASC
    ) AS a
GROUP BY b
ORDER BY b ASC;