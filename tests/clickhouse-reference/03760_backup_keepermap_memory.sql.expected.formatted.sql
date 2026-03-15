SET max_compress_block_size = 0;

CREATE TABLE `03760_backup_memory`
(
    c0 Int
)
ENGINE = Memory;

CREATE TABLE `03760_backup_keepermap`
(
    c0 Int
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test03760_backup'))
PRIMARY KEY c0;