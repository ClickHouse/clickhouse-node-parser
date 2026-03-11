SELECT
    `partition`,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'move_partition_to_oneself'
    AND active;