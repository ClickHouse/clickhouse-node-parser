CREATE DATABASE `01780_db`;

CREATE DICTIONARY dict1
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dict1'))
LAYOUT(DIRECT());

SELECT *
FROM dict1; --{serverError BAD_ARGUMENTS}

CREATE DICTIONARY `01780_db`.dict2
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() DATABASE '01780_db' TABLE 'dict2'))
LAYOUT(DIRECT());

SELECT *
FROM `01780_db`.dict2; --{serverError BAD_ARGUMENTS}

CREATE TABLE `01780_db`.dict3_source
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

CREATE DICTIONARY `01780_db`.dict3
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dict3_source' DATABASE '01780_db'))
LAYOUT(DIRECT());

SELECT *
FROM `01780_db`.dict3;