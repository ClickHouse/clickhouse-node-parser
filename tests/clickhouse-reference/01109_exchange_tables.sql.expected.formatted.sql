-- Tags: no-parallel
SET send_logs_level = 'fatal';

SYSTEM DROP  DATABASE IF EXISTS test_01109;

CREATE DATABASE test_01109
ENGINE = Atomic;

USE test_01109;

CREATE TABLE t0
ENGINE = MergeTree()
ORDER BY tuple() AS
SELECT
    rowNumberInAllBlocks(),
    *
FROM (
        SELECT toLowCardinality(arrayJoin(['exchange', 'tables']))
    );

-- NOTE: database = currentDatabase() is not mandatory
CREATE TABLE t1
ENGINE = Log() AS
SELECT *
FROM
    `system`.tables AS t
INNER JOIN `system`.databases AS d
    ON t.database = d.name;

CREATE TABLE t2
ENGINE = MergeTree()
ORDER BY tuple() AS
SELECT
    rowNumberInAllBlocks() + (
        SELECT count()
        FROM t0
    ),
    *
FROM (
        SELECT arrayJoin(['hello', 'world'])
    );

SYSTEM DROP  TABLE t1;

SELECT *
FROM t1;

SELECT *
FROM t2;

SYSTEM DROP  DATABASE IF EXISTS test_01109_other_atomic;

SYSTEM DROP  DATABASE IF EXISTS test_01109_ordinary;

CREATE DATABASE test_01109_other_atomic;

SET allow_deprecated_database_ordinary = 1;

-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test_01109_ordinary
ENGINE = Ordinary;

CREATE TABLE test_01109_other_atomic.t3
ENGINE = MergeTree()
ORDER BY tuple() AS
SELECT
    rowNumberInAllBlocks() + (
        SELECT max((*,*).1.1) + 1
        FROM (
                SELECT tuple(*)
                FROM t1
                UNION ALL
                SELECT tuple(*)
                FROM t2
            )
    ),
    *
FROM (
        SELECT arrayJoin(['another', 'db'])
    );

CREATE TABLE test_01109_ordinary.t4 AS t1;

SELECT *
FROM test_01109_other_atomic.t3;

SELECT *
FROM test_01109_ordinary.t4;

SYSTEM DROP  DATABASE IF EXISTS test_01109_rename_exists;

CREATE DATABASE test_01109_rename_exists
ENGINE = Atomic;

USE test_01109_rename_exists;

CREATE TABLE t0
ENGINE = Log() AS
SELECT *
FROM `system`.numbers
LIMIT 2;

SYSTEM DROP  DATABASE test_01109;

SYSTEM DROP  DATABASE test_01109_other_atomic;

SYSTEM DROP  DATABASE test_01109_ordinary;

SYSTEM DROP  DATABASE test_01109_rename_exists;