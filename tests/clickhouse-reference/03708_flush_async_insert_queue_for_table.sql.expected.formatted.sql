CREATE TABLE IF NOT EXISTS `test_table with spaces`
(
    id UInt64,
    value String
)
ORDER BY id;

SET async_insert = 1;

SET wait_for_async_insert = 0;

SET wait_for_async_insert_timeout = 10000, async_insert_max_query_number = 1000, async_insert_max_data_size = 10000000, async_insert_use_adaptive_busy_timeout = 0;

SELECT
    '`test_table with spaces`',
    count()
FROM `test_table with spaces`;

CREATE DATABASE `this.is.a.valid.databasename`;

CREATE TABLE `this.is.a.valid.databasename`.`test_table with spaces`
(
    id UInt64,
    value String
)
ORDER BY id;

SELECT
    '`this.is.a.valid.databasename`.`test_table with spaces`',
    count()
FROM `this.is.a.valid.databasename`.`test_table with spaces`;