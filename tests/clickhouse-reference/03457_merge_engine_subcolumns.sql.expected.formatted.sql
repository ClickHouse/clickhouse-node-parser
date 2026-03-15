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

SELECT
    json.a.b,
    json.a.g,
    json.c,
    json.d
FROM test_merge;