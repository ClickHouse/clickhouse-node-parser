-- Tags: no-parallel
SYSTEM drop  table if exists `test_table with spaces`;

CREATE TABLE IF NOT EXISTS `test_table with spaces`
(
    id UInt64,
    value String
)
ORDER BY id;

SET async_insert = 1;

SET wait_for_async_insert = 0;

SET wait_for_async_insert_timeout = 10000, async_insert_max_query_number = 1000, async_insert_max_data_size = 10000000, async_insert_use_adaptive_busy_timeout = 0;

INSERT INTO `test_table with spaces`;

INSERT INTO `test_table with spaces`;

SELECT
    '`test_table with spaces`',
    count()
FROM `test_table with spaces`;

INSERT INTO `test_table with spaces`;

SYSTEM drop  table `test_table with spaces`;

SYSTEM drop  database if exists `this.is.a.valid.databasename`;

CREATE DATABASE `this.is.a.valid.databasename`;

SYSTEM drop  table if exists `this.is.a.valid.databasename`.`test_table with spaces`;

CREATE TABLE `this.is.a.valid.databasename`.`test_table with spaces`
(
    id UInt64,
    value String
)
ORDER BY id;

INSERT INTO `this.is.a.valid.databasename`.`test_table with spaces`;

INSERT INTO `this.is.a.valid.databasename`.`test_table with spaces`;

SELECT
    '`this.is.a.valid.databasename`.`test_table with spaces`',
    count()
FROM `this.is.a.valid.databasename`.`test_table with spaces`;

SYSTEM drop  table `this.is.a.valid.databasename`.`test_table with spaces`;

SYSTEM drop  database `this.is.a.valid.databasename`;