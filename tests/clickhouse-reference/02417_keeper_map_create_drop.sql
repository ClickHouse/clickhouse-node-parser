CREATE TABLE 02417_test (key UInt64, value UInt64) Engine=KeeperMap('/' || currentDatabase() || '/test2417') PRIMARY KEY(key);
SELECT * FROM 02417_test ORDER BY key;
SELECT '------';
CREATE TABLE 02417_test_another (key UInt64, value UInt64) Engine=KeeperMap('/' || currentDatabase() || '/test2417') PRIMARY KEY(key);
SELECT * FROM 02417_test_another ORDER BY key;
