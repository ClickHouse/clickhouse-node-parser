SET enable_analyzer = 1;

CREATE TABLE test1
(
    a UInt64,
    b UInt64
)
ENGINE = Memory;

CREATE TABLE test2
(
    a UInt64,
    c UInt64
)
ENGINE = Memory;

CREATE TABLE test3
(
    a UInt64,
    d UInt64
)
ENGINE = Memory;

CREATE TABLE test_merge
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64,
    e UInt64
)
ENGINE = Merge(database(), 'test');

SELECT a
FROM test_merge
ORDER BY `all` ASC;

SELECT b
FROM test_merge
ORDER BY `all` ASC;

SELECT c
FROM test_merge
ORDER BY `all` ASC;

SELECT d
FROM test_merge
ORDER BY `all` ASC;

SELECT e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    c
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    d
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    c
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    d
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    c,
    d
FROM test_merge
ORDER BY `all` ASC;

SELECT
    c,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    b,
    c
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    b,
    d
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    b,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    c,
    d
FROM test_merge
ORDER BY `all` ASC;

SELECT
    a,
    c,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    c,
    d
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    c,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    c,
    d,
    e
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    c,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    d,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    e,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    c,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    d,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    b,
    e,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    c,
    d,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    c,
    e,
    _table
FROM test_merge
ORDER BY `all` ASC;

SELECT
    d,
    e,
    _table
FROM test_merge
ORDER BY `all` ASC;