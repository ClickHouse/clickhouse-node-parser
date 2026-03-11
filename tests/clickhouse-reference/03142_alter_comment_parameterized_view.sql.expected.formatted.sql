SELECT create_table_query
FROM `system`.tables
WHERE name = 'test_table_comment'
    AND database = currentDatabase();