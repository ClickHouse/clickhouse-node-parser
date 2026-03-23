-- Tags: no-parallel, no-replicated-database
-- ^ creates a database.
SYSTEM DROP  DATABASE IF EXISTS test_03333;

CREATE DATABASE test_03333;

CREATE TABLE test_03333.t
(
    x UInt8
)
ENGINE = Memory;

SYSTEM DROP  TABLE IF EXISTS merge;

CREATE TABLE merge
ENGINE = Merge(test_03333, 't');

SELECT *
FROM merge;

SELECT
    table,
    total_rows,
    total_bytes
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 'merge';

SYSTEM DROP  DATABASE test_03333;

SYSTEM DROP  TABLE merge;