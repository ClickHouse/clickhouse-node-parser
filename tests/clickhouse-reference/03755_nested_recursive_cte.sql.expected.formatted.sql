SELECT count() > 0
FROM (
        WITH q AS (
            SELECT 1
            FROM t0
            UNION ALL
(            WITH x AS (
                SELECT 1
                FROM t0
                UNION ALL
(                SELECT 1
                FROM q
                WHERE false
                UNION ALL
                SELECT 1
                FROM x
                WHERE false)
            )

            SELECT 1
            FROM x)
        )

        SELECT 1
        FROM q
    ); -- { serverError TOO_DEEP_RECURSION }