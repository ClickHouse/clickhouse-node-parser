CREATE TABLE `03549_test`
(
    key UInt64,
    value UInt64 COMMENT 'value'
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test3549'))
PRIMARY KEY key;

CREATE TABLE `03549_test_another`
(
    key UInt64 COMMENT 'key',
    value UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test3549'))
PRIMARY KEY key;

SELECT *
FROM `03549_test_another`
ORDER BY key ASC;