SELECT create_table_query
FROM `system`.tables
WHERE ilike(database, 'INFORMATION_SCHEMA')
    AND ilike(table, 'TABLES');