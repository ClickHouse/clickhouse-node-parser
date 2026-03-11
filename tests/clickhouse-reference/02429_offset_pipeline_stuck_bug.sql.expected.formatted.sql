SELECT number
FROM (
        SELECT number
        FROM t
        ORDER BY number ASC
        OFFSET 3
    )
WHERE number < NULL;