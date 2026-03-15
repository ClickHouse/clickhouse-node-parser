-- Tags: no-parallel
SET prefer_localhost_replica = 1;

CREATE DATABASE test_01457;

CREATE TABLE tmp
(
    n Int8
)
ENGINE = Memory;

CREATE TABLE test_01457.tf_remote AS remote('localhost', currentDatabase(), 'tmp');

CREATE TABLE test_01457.tf_remote_explicit_structure
(
    n UInt64
) AS remote('localhost', currentDatabase(), 'tmp');

CREATE TABLE test_01457.tf_numbers
(
    number String
) AS numbers(1);

CREATE TABLE test_01457.tf_merge AS merge(currentDatabase(), 'tmp');

-- To suppress "Structure does not match (...), implicit conversion will be done." message
SET send_logs_level = 'error';

SELECT *
FROM tmp;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM tmp;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_remote;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_remote_explicit_structure;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_numbers;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_merge;