SELECT create_table_query FROM system.tables WHERE database ILIKE 'INFORMATION_SCHEMA' AND table ILIKE 'TABLES'; -- supress style check: database = currentDatabase()
