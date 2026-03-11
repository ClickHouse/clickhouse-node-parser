SELECT *
FROM table_rename_with_default
WHERE key = 1
FORMAT TSVWithNames;

SELECT value2
FROM table_rename_with_default
WHERE key = 1;

SELECT value3
FROM table_rename_with_default
WHERE key = 1;

SELECT *
FROM table_rename_with_ttl
WHERE value1 = '1'
FORMAT TSVWithNames;