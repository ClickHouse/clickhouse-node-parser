-- Tags: no-parallel
-- because of system.tables poisoning
SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    key UInt32
)
ENGINE = Buffer(currentDatabase(), test, 16, 10, 100, 10000, 1000000, 10000000, 100000000);

SELECT *
FROM test; -- { serverError INFINITE_LOOP }

SELECT *
FROM `system`.tables
WHERE table = 'test'
    AND database = currentDatabase()
FORMAT Null;

SYSTEM DROP  TABLE test;

SYSTEM DROP  TABLE IF EXISTS test1;

SYSTEM DROP  TABLE IF EXISTS test2;

CREATE TABLE test1
(
    key UInt32
)
ENGINE = Buffer(currentDatabase(), test2, 16, 10, 100, 10000, 1000000, 10000000, 100000000);

CREATE TABLE test2
(
    key UInt32
)
ENGINE = Buffer(currentDatabase(), test1, 16, 10, 100, 10000, 1000000, 10000000, 100000000); -- { serverError INFINITE_LOOP }

SYSTEM DROP  TABLE test1;