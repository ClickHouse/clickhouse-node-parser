CREATE DATABASE `01720_dictionary_db`;

CREATE TABLE `01720_dictionary_db`.dictionary_source_table
(
    key UInt8,
    value String
)
ENGINE = TinyLog;

INSERT INTO `01720_dictionary_db`.dictionary_source_table;

CREATE DICTIONARY `01720_dictionary_db`.dictionary
(
    key UInt64,
    value String
)
PRIMARY KEY key
SOURCE(clickhouse(DB '01720_dictionary_db' TABLE 'dictionary_source_table' HOST hostName() PORT tcpPort()))
LIFETIME(0)
LAYOUT(FLAT());

SELECT *
FROM `01720_dictionary_db`.dictionary;