-- Tags: no-parallel
SYSTEM DROP  DATABASE IF EXISTS `foo 1234`;

CREATE DATABASE `foo 1234`;

CREATE TABLE `foo 1234`.dict_data
(
    key UInt64,
    val UInt64
)
ENGINE = Memory();

CREATE DICTIONARY `foo 1234`.dict
(
    key UInt64 DEFAULT 0,
    val UInt64 DEFAULT 10
)
PRIMARY KEY key
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'dict_data' PASSWORD '' DB 'foo 1234'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(FLAT());

SELECT query_count
FROM `system`.dictionaries
WHERE database = 'foo 1234'
    AND name = 'dict';

SELECT dictGetUInt64('foo 1234.dict', 'val', toUInt64(0));

SYSTEM DROP  DATABASE IF EXISTS `foo 123`;

CREATE DATABASE `foo 123`;

SYSTEM DROP  DICTIONARY `foo 1234`.dict;

SYSTEM DROP  TABLE `foo 1234`.dict_data;

SYSTEM DROP  DATABASE `foo 1234`;

SYSTEM DROP  DATABASE `foo 123`;