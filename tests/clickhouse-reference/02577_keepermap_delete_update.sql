CREATE TABLE 02577_keepermap_delete_update (key UInt64, value String, value2 UInt64) ENGINE=KeeperMap('/' ||  currentDatabase() || '/test02577_keepermap_delete_update') PRIMARY KEY(key);
INSERT INTO 02577_keepermap_delete_update VALUES (1, 'Some string', 0), (2, 'Some other string', 0), (3, 'random', 0), (4, 'random2', 0);
SELECT *, _version FROM 02577_keepermap_delete_update ORDER BY key;
SELECT '-----------';
SELECT count() FROM 02577_keepermap_delete_update;
INSERT INTO 02577_keepermap_delete_update VALUES (1, 'String', 10), (2, 'String', 20), (3, 'String', 30), (4, 'String', 40);
