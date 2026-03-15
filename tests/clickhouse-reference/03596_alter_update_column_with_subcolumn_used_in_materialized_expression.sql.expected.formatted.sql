CREATE TABLE test
(
    t Tuple(a UInt32),
    a UInt32 MATERIALIZED t.a
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT
    t,
    a
FROM test;

CREATE TABLE test
(
    t Tuple(a UInt32),
    a UInt32 MATERIALIZED t.a + 42
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE test
(
    t Tuple(a UInt32),
    a UInt32 MATERIALIZED t.a
)
ENGINE = MergeTree()
ORDER BY a;

CREATE TABLE test
(
    json JSON,
    a UInt32 MATERIALIZED json.a::UInt32
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT
    json,
    a
FROM test;

CREATE TABLE test
(
    json JSON,
    a UInt32 MATERIALIZED json.a::UInt32 + 42
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE test
(
    json JSON,
    a UInt32 MATERIALIZED json.a::UInt32
)
ENGINE = MergeTree()
ORDER BY a;