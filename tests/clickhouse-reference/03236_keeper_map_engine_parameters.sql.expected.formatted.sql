CREATE TABLE `03236_keeper_map_engine_parameters`
(
    key UInt64,
    value UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2417'))
PRIMARY KEY key;