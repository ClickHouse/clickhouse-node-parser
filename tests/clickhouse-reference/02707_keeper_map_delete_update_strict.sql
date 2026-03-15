SET keeper_map_strict_mode = 1;
CREATE TABLE 02707_keepermap_delete_update (key UInt64, value String, value2 UInt64) ENGINE=KeeperMap('/' ||  currentDatabase() || '/test02707_keepermap_delete_update') PRIMARY KEY(key);
SELECT *, _version, _version FROM 02707_keepermap_delete_update ORDER BY key;
SELECT '-----------';
SELECT *, _version FROM 02707_keepermap_delete_update ORDER BY key;
SELECT count() FROM 02707_keepermap_delete_update;
