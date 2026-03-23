SET max_compress_block_size = 0;
CREATE TABLE 03760_backup_memory (c0 Int) ENGINE = Memory;
INSERT INTO TABLE 03760_backup_memory (c0) VALUES (1);
CREATE TABLE 03760_backup_keepermap (c0 Int) ENGINE = KeeperMap('/' || currentDatabase() || '/test03760_backup') PRIMARY KEY (c0);
INSERT INTO TABLE 03760_backup_keepermap (c0) VALUES (1);
