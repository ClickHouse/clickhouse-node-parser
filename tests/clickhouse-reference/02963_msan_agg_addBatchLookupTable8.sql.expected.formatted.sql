SELECT
    number % 2 AS even,
    aggThrow(number)
FROM numbers(10)
GROUP BY even;