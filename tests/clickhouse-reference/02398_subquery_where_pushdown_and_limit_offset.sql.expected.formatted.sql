SELECT number
FROM (
        SELECT number
        FROM t
        ORDER BY number DESC
        OFFSET 3
    )
WHERE number < 18;

SELECT number
FROM (
        SELECT number
        FROM t
        ORDER BY number ASC
        LIMIT 5
    )
WHERE number % 2;