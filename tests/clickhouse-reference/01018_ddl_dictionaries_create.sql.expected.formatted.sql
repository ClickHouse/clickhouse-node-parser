-- Tags: no-parallel, no-fasttest
SET send_logs_level = 'fatal';

SYSTEM DROP  DATABASE IF EXISTS memory_db;

SYSTEM DROP  DATABASE IF EXISTS db_01018;

SYSTEM DROP  DATABASE IF EXISTS database_for_dict_01018;

CREATE DATABASE database_for_dict_01018;

CREATE TABLE database_for_dict_01018.table_for_dict
(
    key_column UInt64,
    second_column UInt8,
    third_column String
)
ENGINE = MergeTree()
ORDER BY key_column;

INSERT INTO database_for_dict_01018.table_for_dict;

CREATE DATABASE db_01018;

CREATE DICTIONARY db_01018.dict1
(
    key_column UInt64 DEFAULT 0,
    second_column UInt8 DEFAULT 1,
    third_column String DEFAULT 'qqq'
)
PRIMARY KEY key_column
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'table_for_dict' PASSWORD '' DB 'database_for_dict_01018'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(FLAT());

SELECT
    database,
    name
FROM `system`.dictionaries
WHERE database = 'db_01018'
    AND like(name, 'dict1');

SYSTEM DROP  DICTIONARY IF EXISTS db_01018.dict1;

CREATE DATABASE memory_db
ENGINE = Memory;

CREATE DICTIONARY memory_db.dict2
(
    key_column UInt64 DEFAULT 0,
    second_column UInt8 DEFAULT 1 EXPRESSION rand() % 222,
    third_column String DEFAULT 'qqq'
)
PRIMARY KEY key_column
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'table_for_dict' PASSWORD '' DB 'database_for_dict_01018'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(FLAT());

SELECT
    database,
    name
FROM `system`.dictionaries
WHERE database = 'memory_db'
    AND like(name, 'dict2');

CREATE DICTIONARY db_01018.dict4
(
    key_column UInt64 DEFAULT 0,
    second_column UInt8 DEFAULT 1,
    third_column String DEFAULT 'qqq'
)
PRIMARY KEY key_column
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'table_for_dict' PASSWORD '' DB 'database_for_dict_01018'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(FLAT());

SYSTEM DROP  DICTIONARY memory_db.dict2;

SYSTEM DROP  TABLE IF EXISTS database_for_dict_01018.table_for_dict;