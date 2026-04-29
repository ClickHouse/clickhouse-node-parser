SHOW CREATE DATABASE INFORMATION_SCHEMA;

SHOW CREATE TABLE INFORMATION_SCHEMA.`COLUMNS`;

SELECT create_table_query
FROM `system`.tables
WHERE ilike(database, 'INFORMATION_SCHEMA')
    AND ilike(table, 'TABLES'); -- supress style check: database = currentDatabase()