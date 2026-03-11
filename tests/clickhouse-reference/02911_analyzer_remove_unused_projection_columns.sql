SELECT id FROM (SELECT * FROM test_table);
SELECT id FROM (SELECT * FROM (SELECT * FROM test_table));
SELECT id FROM (SELECT * FROM test_table UNION ALL SELECT * FROM test_table);
SELECT id FROM (SELECT id, value FROM test_table);
SELECT id FROM (SELECT id, value FROM (SELECT id, value FROM test_table));
SELECT id FROM (SELECT id, value FROM test_table UNION ALL SELECT id, value FROM test_table);
