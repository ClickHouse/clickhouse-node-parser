CREATE DATABASE test_03333;
CREATE TABLE test_03333.t (x UInt8) ENGINE = Memory;
CREATE TABLE merge ENGINE = Merge(test_03333, 't');
SELECT * FROM merge;
SELECT table, total_rows, total_bytes FROM system.tables WHERE database = currentDatabase() AND table = 'merge';
