CREATE TABLE t_async_insert_table_function (id UInt32, s String) ENGINE = Memory;
SET async_insert = 1;
SELECT * FROM t_async_insert_table_function ORDER BY id;
