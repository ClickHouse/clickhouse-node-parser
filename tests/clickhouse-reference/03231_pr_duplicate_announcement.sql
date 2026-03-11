SELECT id, value FROM test_table WHERE id IN (SELECT id FROM test_table_for_in UNION DISTINCT SELECT id FROM test_table_for_in);
