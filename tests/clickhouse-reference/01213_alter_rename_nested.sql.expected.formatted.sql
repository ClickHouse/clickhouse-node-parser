SELECT n.x
FROM table_for_rename_nested
WHERE key = 7;

SELECT n.y
FROM table_for_rename_nested
WHERE key = 7;

SELECT
    key,
    n.renamed_x
FROM table_for_rename_nested
WHERE key = 7;

SELECT
    key,
    n.renamed_y
FROM table_for_rename_nested
WHERE key = 7;

SELECT renamed_value1
FROM table_for_rename_nested
WHERE key = 7;

SELECT *
FROM table_for_rename_nested
WHERE key = 7
FORMAT TSVWithNames;