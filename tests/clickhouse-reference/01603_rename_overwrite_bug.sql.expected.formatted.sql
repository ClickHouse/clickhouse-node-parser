-- Tags: no-parallel, memory-engine, log-engine
SET send_logs_level = 'fatal';

SET allow_deprecated_database_ordinary = 1;

-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test_1603_rename_bug_ordinary
ENGINE = Ordinary;

CREATE TABLE test_1603_rename_bug_ordinary.foo
ENGINE = Memory AS
SELECT *
FROM numbers(100);

CREATE TABLE test_1603_rename_bug_ordinary.bar
ENGINE = Log AS
SELECT *
FROM numbers(200);

SELECT count()
FROM test_1603_rename_bug_ordinary.foo;

SELECT count()
FROM test_1603_rename_bug_ordinary.bar;

CREATE DATABASE test_1603_rename_bug_atomic
ENGINE = Atomic;

CREATE TABLE test_1603_rename_bug_atomic.foo
ENGINE = Memory AS
SELECT *
FROM numbers(100);

CREATE TABLE test_1603_rename_bug_atomic.bar
ENGINE = Log AS
SELECT *
FROM numbers(200);

SELECT count()
FROM test_1603_rename_bug_atomic.foo;

SELECT count()
FROM test_1603_rename_bug_atomic.bar;