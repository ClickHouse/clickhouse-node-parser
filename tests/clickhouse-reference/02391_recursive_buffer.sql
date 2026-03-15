CREATE TABLE test (key UInt32) Engine = Buffer(currentDatabase(), test, 16, 10, 100, 10000, 1000000, 10000000, 100000000);
SELECT * FROM test; -- { serverError INFINITE_LOOP }
SELECT * FROM system.tables WHERE table = 'test' AND database = currentDatabase() FORMAT Null;
CREATE TABLE test1 (key UInt32) Engine = Buffer(currentDatabase(), test2, 16, 10, 100, 10000, 1000000, 10000000, 100000000);
CREATE TABLE test2 (key UInt32) Engine = Buffer(currentDatabase(), test1, 16, 10, 100, 10000, 1000000, 10000000, 100000000); -- { serverError INFINITE_LOOP }
