-- Tags: no-parallel
SET enable_analyzer = 1;

SELECT dummy;

SELECT '--';

SELECT one.dummy;

SELECT `system`.one.dummy;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

SELECT test_id
FROM test_table; -- { serverError UNKNOWN_IDENTIFIER }

SELECT test_id
FROM test_unknown_table; -- { serverError UNKNOWN_TABLE }

SELECT id
FROM test_table;

SELECT value
FROM test_table;

SELECT
    id,
    value
FROM test_table;

SELECT test_table.id
FROM test_table;

SELECT test_table.value
FROM test_table;

SELECT
    test_table.id,
    test_table.value
FROM test_table;

SELECT
    test.id,
    test.value
FROM test_table AS test;

CREATE DATABASE `02337_db`;

CREATE TABLE `02337_db`.test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

SELECT
    test_table.id,
    test_table.value
FROM `02337_db`.test_table;

SELECT
    `02337_db`.test_table.id,
    `02337_db`.test_table.value
FROM `02337_db`.test_table;

SELECT
    test_table.id,
    test_table.value
FROM `02337_db`.test_table AS test_table;