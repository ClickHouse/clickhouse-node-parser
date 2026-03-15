CREATE TABLE source
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY x;

CREATE TABLE dest
(
    x UInt64,
    y UInt64
)
ENGINE = MergeTree
ORDER BY x;

-- Materialized view that uses a table function in a JOIN.
-- When data is inserted into source, multiple threads may process chunks
-- and resolve the numbers() table function concurrently.
CREATE MATERIALIZED VIEW mv
TO dest
AS
SELECT
    source.x,
    n.number AS y
FROM
    source
CROSS JOIN numbers(10) AS n;

-- Use small block size and parallel view processing to trigger the race.
SET max_block_size = 100, min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;

SET parallel_view_processing = 1;

SET max_threads = 8, max_insert_threads = 8;

SELECT count()
FROM dest;