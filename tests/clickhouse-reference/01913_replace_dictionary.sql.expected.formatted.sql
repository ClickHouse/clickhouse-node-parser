CREATE DATABASE `01913_db`
ENGINE = Atomic;

CREATE TABLE `01913_db`.test_source_table_1
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

CREATE DICTIONARY `01913_db`.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(DB '01913_db' TABLE 'test_source_table_1'))
LAYOUT(DIRECT());

SELECT *
FROM `01913_db`.test_dictionary;

CREATE TABLE `01913_db`.test_source_table_2
(
    id UInt64,
    value_1 String
)
ENGINE = TinyLog;