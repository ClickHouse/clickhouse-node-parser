CREATE TABLE adaptive_table
(
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS index_granularity_bytes = 1048576, min_bytes_for_wide_part = 0, old_parts_lifetime = 0, index_granularity = 8192;

SELECT
    'marks',
    marks
FROM `system`.parts
WHERE table = 'adaptive_table'
    AND database = currentDatabase()
    AND active
FORMAT CSV;

-- This works correctly, since it does not read any marks
SELECT
    'optimize_trivial_count_query',
    count()
FROM adaptive_table
SETTINGS optimize_trivial_count_query = 1
FORMAT CSV;

-- This works correctly, since it reads marks sequentially and don't seek
SELECT
    'max_threads=1',
    count()
FROM adaptive_table
SETTINGS
    optimize_trivial_count_query = 0,
    max_threads = 1
FORMAT CSV;

-- This works wrong, since it seek to each mark (due to reading each mark from a separate thread),
-- so if the marks offsets will be wrong it will read more data.
--
-- Reading each mark from a separate thread is just the simplest reproducers,
-- this can be also reproduced with PREWHERE since it skips data physically,
-- so it also uses seeks.
SELECT
    'max_threads=100',
    count()
FROM adaptive_table
SETTINGS
    optimize_trivial_count_query = 0,
    merge_tree_min_rows_for_concurrent_read = 1,
    merge_tree_min_bytes_for_concurrent_read = 1,
    max_threads = 100
FORMAT CSV;