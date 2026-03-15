CREATE TABLE testing
(
    a String,
    b String,
    c String,
    d String,
    PROJECTION proj_1 (    SELECT
        b,
        c
    ORDER BY d ASC)
)
ENGINE = MergeTree()
PRIMARY KEY a
ORDER BY (a, b)
SETTINGS index_granularity = 8192, index_granularity_bytes = 0, min_bytes_for_wide_part = 0;

SELECT *
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'testing'
    AND NOT is_done;