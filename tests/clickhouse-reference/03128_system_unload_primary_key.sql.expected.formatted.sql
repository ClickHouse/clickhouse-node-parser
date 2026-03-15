CREATE TABLE test
(
    s String
)
ENGINE = MergeTree
ORDER BY s
SETTINGS index_granularity = 1, use_primary_key_cache = 0;

CREATE TABLE test2
(
    s String
)
ENGINE = MergeTree
ORDER BY s
SETTINGS index_granularity = 1, use_primary_key_cache = 0;

SELECT
    round(primary_key_bytes_in_memory, -7),
    round(primary_key_bytes_in_memory_allocated, -7)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table IN ('test', 'test2');

SELECT
    primary_key_bytes_in_memory,
    primary_key_bytes_in_memory_allocated
FROM `system`.parts
WHERE database = currentDatabase()
    AND table IN ('test', 'test2');