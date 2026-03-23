-- Tags: no-parallel

SET enable_analyzer = 1;
SELECT dummy;
SELECT '--';
SELECT one.dummy;
SELECT system.one.dummy;
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
SELECT test_id FROM test_table; -- { serverError UNKNOWN_IDENTIFIER }
SELECT test_id FROM test_unknown_table; -- { serverError UNKNOWN_TABLE }
SELECT id FROM test_table;
SELECT value FROM test_table;
SELECT id, value FROM test_table;
SELECT test_table.id FROM test_table;
SELECT test_table.value FROM test_table;
SELECT test_table.id, test_table.value FROM test_table;
SELECT test.id, test.value FROM test_table AS test;
DROP TABLE test_table;
DROP DATABASE IF EXISTS 02337_db;
CREATE DATABASE 02337_db;
DROP TABLE IF EXISTS 02337_db.test_table;
CREATE TABLE 02337_db.test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO 02337_db.test_table VALUES (0, 'Value');
SELECT test_table.id, test_table.value FROM 02337_db.test_table;
SELECT 02337_db.test_table.id, 02337_db.test_table.value FROM 02337_db.test_table;
SELECT test_table.id, test_table.value FROM 02337_db.test_table AS test_table;
DROP TABLE 02337_db.test_table;
DROP DATABASE 02337_db;
