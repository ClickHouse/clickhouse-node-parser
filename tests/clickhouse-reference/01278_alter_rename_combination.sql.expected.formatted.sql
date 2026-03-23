DROP TABLE IF EXISTS rename_table;

CREATE TABLE rename_table
(
    key Int32,
    value1 Int32,
    value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO rename_table;

SELECT *
FROM rename_table
FORMAT TSVWithNames;

INSERT INTO rename_table;

SELECT *
FROM rename_table
ORDER BY k ASC
FORMAT TSVWithNames;

SELECT '---polymorphic---';

DROP TABLE IF EXISTS rename_table_polymorphic;

CREATE TABLE rename_table_polymorphic
(
    key Int32,
    value1 Int32,
    value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 10000;

INSERT INTO rename_table_polymorphic;

SELECT *
FROM rename_table_polymorphic
FORMAT TSVWithNames;

INSERT INTO rename_table_polymorphic;

SELECT *
FROM rename_table_polymorphic
ORDER BY k ASC
FORMAT TSVWithNames;