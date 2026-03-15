CREATE TABLE `02947_table_1`
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE `02947_table_2`
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id;

SELECT
    database,
    table,
    name
FROM `system`.parts
WHERE database = currentDatabase()
    AND startsWith(table, '02947_table_');

SELECT *
FROM `system`.dropped_tables_parts
FORMAT Null;