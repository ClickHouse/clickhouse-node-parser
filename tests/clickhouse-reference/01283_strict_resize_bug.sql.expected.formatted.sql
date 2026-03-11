SELECT *
FROM (
        SELECT sum(number)
        FROM num_10m
        UNION ALL
        SELECT sum(number)
        FROM num_10m
    )
LIMIT 1
SETTINGS max_block_size = 1024;