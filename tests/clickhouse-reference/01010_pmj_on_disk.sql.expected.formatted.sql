SELECT
    n,
    j
FROM
    (
        SELECT number AS n
        FROM numbers(4)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number + 10 AS j
        FROM numbers(4000)
    ) AS js2
    USING (n)
ORDER BY n ASC;