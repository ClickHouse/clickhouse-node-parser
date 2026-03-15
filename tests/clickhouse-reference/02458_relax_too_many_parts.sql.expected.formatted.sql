CREATE TABLE test
(
    x UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS parts_to_throw_insert = 3, max_parts_to_merge_at_once = 1;

-- The "too many parts" threshold works:
SET max_block_size = 1, min_insert_block_size_rows = 1, min_insert_block_size_bytes = 1;

SET max_block_size = 65000, min_insert_block_size_rows = 65000, min_insert_block_size_bytes = '1M';

SELECT
    count(),
    round(avg(bytes), -6)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
    AND active;