SELECT
    x,
    y,
    transform(x, (
        SELECT groupArray(x)
        FROM (
                SELECT
                    x,
                    y
                FROM updates
                ORDER BY x ASC
            ) AS t1
    ), (
        SELECT groupArray(y)
        FROM (
                SELECT
                    x,
                    y
                FROM updates
                ORDER BY x ASC
            ) AS t2
    ), y)
FROM test_xy
WHERE 1
ORDER BY
    x ASC,
    y ASC;

SELECT *
FROM test_xy
ORDER BY
    x ASC,
    y ASC;