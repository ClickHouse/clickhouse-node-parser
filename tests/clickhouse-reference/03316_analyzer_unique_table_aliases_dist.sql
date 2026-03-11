SELECT
    sum(number GLOBAL IN (
        SELECT number AS n
        FROM numbers(5)
        WHERE number GLOBAL IN (
            SELECT *
            FROM numbers(3)
        )
    ) AS res),
    sum(number * res)
FROM remote('127.0.0.2', numbers(10));
