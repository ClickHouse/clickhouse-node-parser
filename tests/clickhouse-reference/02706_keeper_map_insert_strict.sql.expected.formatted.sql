CREATE TABLE `02706_keeper_map_insert_strict`
(
    key UInt64,
    value Float64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test_02706_keeper_map_insert_strict'))
PRIMARY KEY key;

SELECT *
FROM `02706_keeper_map_insert_strict`
WHERE key = 1;

SET keeper_map_strict_mode = false;

SET keeper_map_strict_mode = true;