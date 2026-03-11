SELECT
    'marks',
    marks
FROM `system`.parts
WHERE table = 'adaptive_table'
    AND database = currentDatabase()
    AND active
FORMAT CSV;

SELECT
    'optimize_trivial_count_query',
    count()
FROM adaptive_table
SETTINGS optimize_trivial_count_query = 1
FORMAT CSV;

SELECT
    'max_threads=1',
    count()
FROM adaptive_table
SETTINGS
    optimize_trivial_count_query = 0,
    max_threads = 1
FORMAT CSV;

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