-- https://github.com/ClickHouse/ClickHouse/issues/48049
SET enable_analyzer = 1;
CREATE TABLE test_table (`id` UInt64, `value` String) ENGINE = TinyLog() AS Select number, number::String from numbers(10);
DROP TABLE test_table;
