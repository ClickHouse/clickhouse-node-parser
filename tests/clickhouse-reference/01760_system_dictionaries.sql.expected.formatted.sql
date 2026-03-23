CREATE DATABASE `01760_db`;

CREATE TABLE `01760_db`.example_simple_key_source
(
    id UInt64,
    value UInt64
)
ENGINE = TinyLog;

INSERT INTO `01760_db`.example_simple_key_source;

CREATE DICTIONARY `01760_db`.example_simple_key_dictionary
(
    id UInt64,
    value UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'example_simple_key_source' DATABASE '01760_db'))
LAYOUT(DIRECT());

SELECT
    name,
    database,
    key.names,
    key.types,
    attribute.names,
    attribute.types,
    status
FROM `system`.dictionaries
WHERE database = '01760_db';

SELECT *
FROM `01760_db`.example_simple_key_dictionary;

CREATE TABLE `01760_db`.example_complex_key_source
(
    id UInt64,
    id_key String,
    value UInt64
)
ENGINE = TinyLog;

INSERT INTO `01760_db`.example_complex_key_source;

CREATE DICTIONARY `01760_db`.example_complex_key_dictionary
(
    id UInt64,
    id_key String,
    value UInt64
)
PRIMARY KEY id, id_key
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'example_complex_key_source' DATABASE '01760_db'))
LAYOUT(COMPLEX_KEY_DIRECT());

SELECT *
FROM `01760_db`.example_complex_key_dictionary;