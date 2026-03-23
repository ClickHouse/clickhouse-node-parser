-- Tags: no-parallel
SYSTEM DROP  DATABASE IF EXISTS 01760_db;

CREATE DATABASE `01760_db`;

SYSTEM DROP  TABLE IF EXISTS 01760_db.example_simple_key_source;

CREATE TABLE `01760_db`.example_simple_key_source
(
    id UInt64,
    value UInt64
)
ENGINE = TinyLog;

INSERT INTO `01760_db`.example_simple_key_source;

SYSTEM DROP  DICTIONARY IF EXISTS 01760_db.example_simple_key_dictionary;

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

SYSTEM DROP  DICTIONARY 01760_db.example_simple_key_dictionary;

SYSTEM DROP  TABLE 01760_db.example_simple_key_source;

SYSTEM DROP  TABLE IF EXISTS 01760_db.example_complex_key_source;

CREATE TABLE `01760_db`.example_complex_key_source
(
    id UInt64,
    id_key String,
    value UInt64
)
ENGINE = TinyLog;

INSERT INTO `01760_db`.example_complex_key_source;

SYSTEM DROP  DICTIONARY IF EXISTS 01760_db.example_complex_key_dictionary;

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

SYSTEM DROP  DICTIONARY 01760_db.example_complex_key_dictionary;

SYSTEM DROP  TABLE 01760_db.example_complex_key_source;

SYSTEM DROP  DATABASE 01760_db;