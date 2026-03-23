-- Tags: no-parallel
SYSTEM DROP  DATABASE IF EXISTS test_01915_db;

CREATE DATABASE test_01915_db
ENGINE = Atomic;

SYSTEM DROP  TABLE IF EXISTS test_01915_db.test_source_table_1;

CREATE TABLE test_01915_db.test_source_table_1
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_01915_db.test_source_table_1;

SYSTEM DROP  DICTIONARY IF EXISTS test_01915_db.test_dictionary;

CREATE OR REPLACE DICTIONARY test_01915_db.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(DB 'test_01915_db' TABLE 'test_source_table_1'))
LAYOUT(DIRECT());

SELECT *
FROM test_01915_db.test_dictionary;

SYSTEM DROP  TABLE IF EXISTS test_01915_db.test_source_table_2;

CREATE TABLE test_01915_db.test_source_table_2
(
    id UInt64,
    value_1 String
)
ENGINE = TinyLog;

INSERT INTO test_01915_db.test_source_table_2;

CREATE OR REPLACE DICTIONARY test_01915_db.test_dictionary
(
    id UInt64,
    value_1 String
)
PRIMARY KEY id
SOURCE(clickhouse(DB 'test_01915_db' TABLE 'test_source_table_2'))
LIFETIME(0)
LAYOUT(HASHED());

SYSTEM DROP  DICTIONARY test_01915_db.test_dictionary;

SYSTEM DROP  TABLE test_01915_db.test_source_table_1;

SYSTEM DROP  TABLE test_01915_db.test_source_table_2;

SYSTEM DROP  DATABASE test_01915_db;