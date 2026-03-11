SELECT *
FROM
    (
        SELECT toUInt64(1) AS s
        LIMIT 1
    ) AS js1
RIGHT JOIN (
        SELECT
            number AS s,
            s AS x
        FROM numbers(11)
    ) AS js2
    USING (s)
ORDER BY s ASC;