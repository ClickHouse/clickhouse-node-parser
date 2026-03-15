CREATE TABLE too_many_parts
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS parts_to_delay_insert = 5, parts_to_throw_insert = 5;

SET max_block_size = 1, min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;

-- Avoid concurrent parts check to avoid flakiness
SET max_threads = 1, max_insert_threads = 1;

SELECT count()
FROM too_many_parts;