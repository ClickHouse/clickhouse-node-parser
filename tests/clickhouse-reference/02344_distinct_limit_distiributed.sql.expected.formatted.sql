SELECT id
FROM (
        SELECT DISTINCT id
        FROM remote('127.0.0.1,127.0.0.2', currentDatabase(), t_distinct_limit)
        LIMIT 10
    )
ORDER BY id ASC;