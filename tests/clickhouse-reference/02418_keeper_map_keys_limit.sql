CREATE TABLE 02418_test (key UInt64, value Float64) Engine=KeeperMap('/' || currentDatabase() || '/test2418', 3) PRIMARY KEY(key);
SELECT count() FROM 02418_test;
CREATE TABLE 02418_test_another (key UInt64, value Float64) Engine=KeeperMap('/' || currentDatabase() || '/test2418', 4) PRIMARY KEY(key);
SELECT count() FROM 02418_test_another;
