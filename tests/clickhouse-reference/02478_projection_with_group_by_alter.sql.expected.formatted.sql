CREATE TABLE testing
(
    a String,
    b String,
    c Int32,
    d Int32,
    e Int32,
    PROJECTION proj_1 (    SELECT c
    ORDER BY d ASC),
    PROJECTION proj_2 (    SELECT c
    ORDER BY
        e ASC,
        d ASC)
)
ENGINE = MergeTree()
PRIMARY KEY a
SETTINGS min_bytes_for_wide_part = 0;

SELECT c
FROM testing
ORDER BY d ASC;

SELECT c
FROM testing
ORDER BY
    e ASC,
    d ASC;

SELECT *
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'testing'
    AND NOT is_done;