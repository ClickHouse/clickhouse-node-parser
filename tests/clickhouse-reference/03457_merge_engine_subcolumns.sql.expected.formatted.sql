SYSTEM drop  table if exists test1;

SYSTEM drop  table if exists test2;

SYSTEM drop  table if exists test_merge;

CREATE TABLE test1
(
    x UInt64,
    t Tuple(a UInt32, b UInt32),
    y String
)
ENGINE = Memory;

CREATE TABLE test2
(
    x UInt64,
    t Tuple(a UInt32, b UInt32),
    y String
)
ENGINE = Memory;

CREATE TABLE test_merge
(
    x UInt64,
    t Tuple(a UInt32, b UInt32),
    y String
)
ENGINE = Merge(currentDatabase(), 'test');

INSERT INTO test1 SELECT
    1,
    tuple(2, 3),
    's1';

INSERT INTO test2 SELECT
    4,
    tuple(5, 6),
    's2';

SET allow_suspicious_types_in_order_by = 1;

SELECT *
FROM test_merge
ORDER BY `all` ASC;

SELECT t.a
FROM test_merge
ORDER BY `all` ASC;

SELECT t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    x,
    t.a
FROM test_merge
ORDER BY `all` ASC;

SELECT
    y,
    t.a
FROM test_merge
ORDER BY `all` ASC;

SELECT
    t.a,
    t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    x,
    t.a,
    t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    y,
    t.a,
    t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    x,
    t.a,
    t.b,
    y
FROM test_merge
ORDER BY `all` ASC;

SYSTEM drop  table test_merge;

SYSTEM drop  table test1;

SYSTEM drop  table test2;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

CREATE TABLE test_merge
(
    json JSON
)
ENGINE = Merge(currentDatabase(), 'test');

INSERT INTO test;

SELECT
    json.a.b,
    json.a.g,
    json.c,
    json.d
FROM test_merge;

SYSTEM drop  table test;