SELECT *
FROM (
        WITH q AS (
            SELECT *
            FROM department__fuzz_3
            UNION ALL
(            WITH x AS (
                SELECT *
                FROM department__fuzz_1
                UNION ALL
(                SELECT *
                FROM q
                UNION ALL
                SELECT *
                FROM x)
            )

            SELECT *
            FROM x)
        )

        SELECT *
        FROM q
        LIMIT 32
    )
ORDER BY
    id ASC,
    parent_department DESC,
    name ASC;