SELECT *
FROM table_with_version_replicated_1
ORDER BY key ASC;

SELECT *
FROM table_with_version_replicated_1 FINAL
ORDER BY key ASC;

SELECT *
FROM table_with_version_replicated_2 FINAL
ORDER BY key ASC;