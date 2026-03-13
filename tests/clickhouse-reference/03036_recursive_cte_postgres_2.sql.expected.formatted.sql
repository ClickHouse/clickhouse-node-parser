-- inside subqueries
SELECT count(*)
FROM (
        WITH t AS (
            SELECT toUInt64(1) AS n
            UNION ALL
            SELECT n + 1
            FROM t
            WHERE n < 500
        )

        SELECT *
        FROM t
    ) AS t
WHERE n < (
        SELECT count(*)
        FROM (
                WITH t AS (
                    SELECT toUInt64(1) AS n
                    UNION ALL
                    SELECT n + 1
                    FROM t
                    WHERE n < 100
                )

                SELECT *
                FROM t
                WHERE n < 50000
            ) AS t
        WHERE n < 100
    );