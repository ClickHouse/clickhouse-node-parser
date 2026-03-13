-- { echo }
-- 25 is the size of marks in case constant index granularity
SELECT count()
FROM test_materialize;

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