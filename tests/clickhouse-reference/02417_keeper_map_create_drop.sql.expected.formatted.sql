-- Tags: no-ordinary-database, no-fasttest
DROP TABLE IF EXISTS `02417_test`;

CREATE TABLE `02417_test`
(
    key UInt64,
    value UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2417'))
PRIMARY KEY key;

INSERT INTO `02417_test`;

SELECT *
FROM `02417_test`
ORDER BY key ASC;

SELECT '------';

CREATE TABLE `02417_test_another`
(
    key UInt64,
    value UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2417'))
PRIMARY KEY key;

INSERT INTO `02417_test_another`;

SELECT *
FROM `02417_test_another`
ORDER BY key ASC;

DROP TABLE `02417_test`;

DROP TABLE `02417_test_another`;