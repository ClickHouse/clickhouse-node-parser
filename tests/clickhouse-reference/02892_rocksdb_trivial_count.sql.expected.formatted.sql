SELECT count()
FROM dict
SETTINGS
    optimize_trivial_approximate_count_query = 0,
    max_rows_to_read = 1;

SELECT count()
FROM dict
SETTINGS
    optimize_trivial_approximate_count_query = 1,
    max_rows_to_read = 1;

SELECT
    total_rows,
    total_bytes > 0
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'dict'
FORMAT CSV;