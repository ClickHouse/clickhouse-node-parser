SET enable_lightweight_update = 1;

CREATE TABLE testing
(
    a String,
    b String,
    c Int32,
    d Int32,
    e Int32
)
ENGINE = MergeTree
PRIMARY KEY a
SETTINGS min_bytes_for_wide_part = 0, enable_block_number_column = 1, enable_block_offset_column = 1;

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