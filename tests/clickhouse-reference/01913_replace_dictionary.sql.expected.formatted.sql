-- Tags: no-parallel
SYSTEM DROP  DATABASE IF EXISTS 01913_db;

CREATE DATABASE `01913_db`
ENGINE = Atomic;

SYSTEM DROP  TABLE IF EXISTS 01913_db.test_source_table_1;

CREATE TABLE `01913_db`.test_source_table_1
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO `01913_db`.test_source_table_1;

SYSTEM DROP  DICTIONARY IF EXISTS 01913_db.test_dictionary;

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

SYSTEM DROP  TABLE IF EXISTS 01913_db.test_source_table_2;

CREATE TABLE `01913_db`.test_source_table_2
(
    id UInt64,
    value_1 String
)
ENGINE = TinyLog;

INSERT INTO `01913_db`.test_source_table_2;

SYSTEM DROP  DICTIONARY 01913_db.test_dictionary;

SYSTEM DROP  TABLE 01913_db.test_source_table_1;

SYSTEM DROP  TABLE 01913_db.test_source_table_2;

SYSTEM DROP  DATABASE 01913_db;