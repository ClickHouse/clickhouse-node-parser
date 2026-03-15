-- Tags: no-parallel
SET enable_analyzer = 1;

SELECT *;

SELECT '--';

SELECT COLUMNS(dummy);

SELECT COLUMNS('d');

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

SELECT *
FROM test_table;

SELECT COLUMNS(id)
FROM test_table;

SELECT
    COLUMNS(id),
    COLUMNS(value)
FROM test_table;

SELECT
    COLUMNS('i'),
    COLUMNS('v')
FROM test_table;

SELECT test_table.*
FROM test_table;

SELECT test_table.COLUMNS(id)
FROM test_table;

SELECT
    test_table.COLUMNS(id),
    test_table.COLUMNS(value)
FROM test_table;

SELECT
    test_table.COLUMNS('i'),
    test_table.COLUMNS('v')
FROM test_table;

CREATE DATABASE `02339_db`;

CREATE TABLE `02339_db`.test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

SELECT `02339_db`.test_table.*
FROM `02339_db`.test_table;

SELECT `02339_db.test_table`.COLUMNS(id)
FROM `02339_db`.test_table;

SELECT
    `02339_db.test_table`.COLUMNS(id),
    `02339_db.test_table`.COLUMNS(value)
FROM `02339_db`.test_table;

SELECT
    `02339_db.test_table`.COLUMNS('i'),
    `02339_db.test_table`.COLUMNS('v')
FROM `02339_db`.test_table;

SELECT * APPLY(toString)
FROM test_table;

SELECT * APPLY(x -> toString(x))
FROM test_table;

SELECT * APPLY(x -> toString(x)) APPLY(x -> length(x))
FROM test_table;

SELECT * APPLY(x -> toString(x)) APPLY(length)
FROM test_table;

SELECT * EXCEPT (id)
FROM test_table;

SELECT COLUMNS(id, value) EXCEPT (id)
FROM test_table;

SELECT * EXCEPT (id) APPLY(toString)
FROM test_table;

SELECT COLUMNS(id, value) EXCEPT (id) APPLY(toString)
FROM test_table;

SELECT * REPLACE (5 AS id)
FROM test_table;

SELECT COLUMNS(id, value) REPLACE (5 AS id)
FROM test_table;

SELECT * REPLACE (5 AS id, 6 AS value)
FROM test_table;

SELECT COLUMNS(id, value) REPLACE (5 AS id, 6 AS value)
FROM test_table;

SELECT * EXCEPT (id) REPLACE (5 AS id, 6 AS value) APPLY(toString)
FROM test_table;

SELECT COLUMNS(id, value) EXCEPT (id) REPLACE (5 AS id, 6 AS value) APPLY(toString)
FROM test_table;