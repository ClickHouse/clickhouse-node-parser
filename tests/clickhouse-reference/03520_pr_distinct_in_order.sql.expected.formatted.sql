SELECT DISTINCT
    a,
    b,
    x,
    y
FROM (
        SELECT
            a,
            b,
            1 AS x,
            2 AS y
        FROM t_dio
        ORDER BY a ASC
    )
ORDER BY
    a ASC,
    b ASC;