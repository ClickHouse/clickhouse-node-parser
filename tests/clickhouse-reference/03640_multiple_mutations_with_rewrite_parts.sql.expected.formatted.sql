CREATE TABLE test_materialize
(
    part Int,
    key Int,
    value String
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY part
SETTINGS index_granularity = 100, use_const_adaptive_granularity = false, enable_index_granularity_compression = false, min_bytes_for_wide_part = 0;

INSERT INTO test_materialize SELECT
    intDiv(number, 5000),
    number,
    repeat('a', number)
FROM numbers(10e3)
SETTINGS
    max_block_size = 10,
    min_insert_block_size_rows = 10000;

-- { echoOn }
SELECT
    partition_id,
    `rows`,
    index_granularity_bytes_in_memory_allocated > 25
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_materialize'
    AND active
ORDER BY 1 ASC;

SELECT
    partition_id,
    `rows`,
    index_granularity_bytes_in_memory_allocated
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_materialize'
    AND active
ORDER BY 1 ASC;

SELECT *
FROM `system`.mutations
WHERE database = currentDatabase()
    AND NOT is_done
FORMAT Vertical;