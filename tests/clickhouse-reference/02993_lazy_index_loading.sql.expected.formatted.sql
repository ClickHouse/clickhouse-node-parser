SELECT
    round(primary_key_bytes_in_memory, -7),
    round(primary_key_bytes_in_memory_allocated, -7)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
FORMAT Vertical;

SELECT
    primary_key_bytes_in_memory,
    primary_key_bytes_in_memory_allocated
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
FORMAT Vertical;

SELECT s != ''
FROM test
LIMIT 1;

SELECT s != ''
FROM test
WHERE s < '9999999999'
LIMIT 1;