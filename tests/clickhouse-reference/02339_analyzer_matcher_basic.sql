-- Tags: no-parallel

SET enable_analyzer = 1;
SELECT *;
SELECT '--';
SELECT COLUMNS(dummy);
SELECT COLUMNS('d');
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
SELECT * FROM test_table;
SELECT COLUMNS(id) FROM test_table;
SELECT COLUMNS(id), COLUMNS(value) FROM test_table;
SELECT COLUMNS('i'), COLUMNS('v') FROM test_table;
SELECT test_table.* FROM test_table;
SELECT test_table.COLUMNS(id) FROM test_table;
SELECT test_table.COLUMNS(id), test_table.COLUMNS(value) FROM test_table;
SELECT test_table.COLUMNS('i'), test_table.COLUMNS('v') FROM test_table;
DROP DATABASE IF EXISTS 02339_db;
CREATE DATABASE 02339_db;
DROP TABLE IF EXISTS 02339_db.test_table;
CREATE TABLE 02339_db.test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO 02339_db.test_table VALUES (0, 'Value');
SELECT 02339_db.test_table.* FROM 02339_db.test_table;
SELECT 02339_db.test_table.COLUMNS(id) FROM 02339_db.test_table;
SELECT 02339_db.test_table.COLUMNS(id), 02339_db.test_table.COLUMNS(value) FROM 02339_db.test_table;
SELECT 02339_db.test_table.COLUMNS('i'), 02339_db.test_table.COLUMNS('v') FROM 02339_db.test_table;
DROP TABLE 02339_db.test_table;
DROP DATABASE 02339_db;
SELECT * APPLY toString FROM test_table;
SELECT * APPLY (x -> toString(x)) FROM test_table;
SELECT * APPLY (x -> toString(x)) APPLY (x -> length(x)) FROM test_table;
SELECT * APPLY (x -> toString(x)) APPLY length FROM test_table;
SELECT * EXCEPT (id) FROM test_table;
SELECT COLUMNS(id, value) EXCEPT (id) FROM test_table;
SELECT * EXCEPT (id) APPLY toString FROM test_table;
SELECT COLUMNS(id, value) EXCEPT (id) APPLY toString FROM test_table;
SELECT * REPLACE (5 AS id) FROM test_table;
SELECT COLUMNS(id, value) REPLACE (5 AS id) FROM test_table;
SELECT * REPLACE (5 AS id, 6 as value) FROM test_table;
SELECT COLUMNS(id, value) REPLACE (5 AS id, 6 as value) FROM test_table;
SELECT * EXCEPT id REPLACE (5 AS id, 6 as value) APPLY toString FROM test_table;
SELECT COLUMNS(id, value) EXCEPT id REPLACE (5 AS id, 6 as value) APPLY toString FROM test_table;
