SELECT dummy;
SELECT '--';
SELECT one.dummy;
SELECT system.one.dummy;
SELECT test_id FROM test_table; -- { serverError UNKNOWN_IDENTIFIER }
SELECT test_id FROM test_unknown_table; -- { serverError UNKNOWN_TABLE }
SELECT id FROM test_table;
SELECT value FROM test_table;
SELECT id, value FROM test_table;
SELECT test_table.id FROM test_table;
SELECT test_table.value FROM test_table;
SELECT test_table.id, test_table.value FROM test_table;
SELECT test.id, test.value FROM test_table AS test;
SELECT test_table.id, test_table.value FROM 02337_db.test_table;
SELECT 02337_db.test_table.id, 02337_db.test_table.value FROM 02337_db.test_table;
SELECT test_table.id, test_table.value FROM 02337_db.test_table AS test_table;
