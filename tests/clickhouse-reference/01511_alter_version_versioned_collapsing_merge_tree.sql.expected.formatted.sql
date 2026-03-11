SELECT *
FROM table_with_version
ORDER BY key ASC;

SELECT *
FROM table_with_version FINAL
ORDER BY key ASC;