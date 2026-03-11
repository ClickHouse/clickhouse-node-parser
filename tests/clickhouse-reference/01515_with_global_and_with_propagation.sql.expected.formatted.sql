SELECT x
FROM (
        WITH 1 AS x

        SELECT x
        UNION ALL
        WITH 2 AS x

        SELECT x
    )
ORDER BY x ASC;