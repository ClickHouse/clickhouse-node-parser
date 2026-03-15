CREATE TABLE lwd_test
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1, min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, enable_block_number_column = 0, enable_block_offset_column = 0;

SELECT *
FROM lwd_test
ORDER BY
    id ASC,
    value ASC;

SELECT
    name,
    part_type
FROM `system`.parts
WHERE (database = currentDatabase())
    AND (table = 'lwd_test')
    AND active
ORDER BY name ASC;

SELECT
    name,
    column,
    type,
    `rows`
FROM `system`.parts_columns
WHERE (database = currentDatabase())
    AND (table = 'lwd_test')
    AND active
ORDER BY
    name ASC,
    column ASC;

SET mutations_sync = 0;