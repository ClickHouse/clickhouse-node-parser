SELECT *
FROM (
        WITH b AS (
            SELECT toInt64(number) AS a
            FROM numbers(10)
        ),

        c AS (
            SELECT toInt64(number) AS a
            FROM numbers(10)
        )

        SELECT *
        FROM
            dist_t0 AS a
        LEFT JOIN b AS b
            ON a.a = b.a
        LEFT JOIN c AS c
            ON a.a = c.a
    )
ORDER BY `ALL` ASC;