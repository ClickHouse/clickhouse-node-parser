SELECT *
FROM (
        SELECT number
        FROM numbers(1)
    )
WHERE NOT ignore(*);