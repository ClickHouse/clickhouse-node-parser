create table if not exists `test_table with spaces`
(
    `id` UInt64,
    `value` String
)
ORDER by id;
set async_insert = 1;
set wait_for_async_insert = 0;
set wait_for_async_insert_timeout = 10000, async_insert_max_query_number = 1000, async_insert_max_data_size = 10000000, async_insert_use_adaptive_busy_timeout = 0;
select '`test_table with spaces`', count() from `test_table with spaces`;
create database `this.is.a.valid.databasename`;
create table `this.is.a.valid.databasename`.`test_table with spaces`
(
    `id` UInt64,
    `value` String
)
ORDER by id;
select '`this.is.a.valid.databasename`.`test_table with spaces`', count() from `this.is.a.valid.databasename`.`test_table with spaces`;
