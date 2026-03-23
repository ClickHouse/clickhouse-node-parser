DROP TABLE IF EXISTS rename_table_multiple;

CREATE TABLE rename_table_multiple
(
    key Int32,
    value1 String,
    value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO rename_table_multiple;

SELECT *
FROM rename_table_multiple
FORMAT TSVWithNames;

INSERT INTO rename_table_multiple;

SELECT *
FROM rename_table_multiple
ORDER BY key ASC
FORMAT TSVWithNames;

INSERT INTO rename_table_multiple;

DROP TABLE IF EXISTS rename_table_multiple_compact;

CREATE TABLE rename_table_multiple_compact
(
    key Int32,
    value1 String,
    value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 100000;

INSERT INTO rename_table_multiple_compact;

SELECT *
FROM rename_table_multiple_compact
FORMAT TSVWithNames;

INSERT INTO rename_table_multiple_compact;

SELECT *
FROM rename_table_multiple_compact
ORDER BY key ASC
FORMAT TSVWithNames;

INSERT INTO rename_table_multiple_compact;