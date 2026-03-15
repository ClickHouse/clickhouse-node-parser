CREATE TABLE rename_table_multiple
(
    key Int32,
    value1 String,
    value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

SELECT *
FROM rename_table_multiple
FORMAT TSVWithNames;

SELECT *
FROM rename_table_multiple
ORDER BY key ASC
FORMAT TSVWithNames;

CREATE TABLE rename_table_multiple_compact
(
    key Int32,
    value1 String,
    value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 100000;

SELECT *
FROM rename_table_multiple_compact
FORMAT TSVWithNames;

SELECT *
FROM rename_table_multiple_compact
ORDER BY key ASC
FORMAT TSVWithNames;