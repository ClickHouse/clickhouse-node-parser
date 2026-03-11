SELECT
    index_granularity_bytes_in_memory,
    index_granularity_bytes_in_memory_allocated
FROM `system`.parts
WHERE table = 't'
    AND database = currentDatabase()
ORDER BY name ASC;