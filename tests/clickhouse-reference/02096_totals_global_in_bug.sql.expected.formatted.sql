SELECT sum(number)
FROM remote('127.0.0.{2,3}', numbers(2))
WHERE number GLOBAL IN (
        SELECT sum(number)
        FROM numbers(2)
        GROUP BY number
        WITH TOTALS
    )
GROUP BY number
WITH TOTALS
ORDER BY number ASC;