SELECT DISTINCT kafkaMurmurHash(*)
FROM
    numbers(10) AS y
RIGHT JOIN (
        SELECT
            concat('str', number) AS str,
            arrayJoin(range(number)) AS i,
            number
        FROM numbers(10)
    ) AS z
    ON y.number = z.number
ORDER BY 1 ASC;