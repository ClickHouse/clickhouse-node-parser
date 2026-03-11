SELECT
    number,
    1 AS k
FROM numbers(100000)
ORDER BY
    k ASC,
    number ASC
LIMIT 1025, 1023
FORMAT Values;