SELECT '--';

SELECT *
FROM (
        WITH q AS (
            SELECT *
            FROM department
            UNION ALL
(            WITH x AS (
                SELECT *
                FROM q
            )

            SELECT *
            FROM x)
        )

        SELECT *
        FROM q
        LIMIT 24
    )
ORDER BY
    id ASC,
    parent_department ASC,
    name ASC;

SELECT *
FROM (
        WITH q AS (
            SELECT *
            FROM department
            UNION ALL
(            WITH x AS (
                SELECT *
                FROM department
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
    parent_department ASC,
    name ASC;