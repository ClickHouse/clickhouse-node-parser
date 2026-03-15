CREATE DATABASE `01837_db`
ENGINE = Memory;

CREATE TABLE `01837_db`.simple_key_dictionary_source
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

CREATE DICTIONARY `01837_db`.simple_key_direct_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() DB '01837_db' TABLE 'simple_key_dictionary_source'))
LAYOUT(DIRECT());

SELECT *
FROM `01837_db`.simple_key_direct_dictionary
ORDER BY `ALL` ASC;