SYSTEM drop  table if exists test;

CREATE TABLE test
(
    t Tuple(a UInt32),
    a UInt32 MATERIALIZED t.a
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO test SELECT tuple(1);

SELECT
    t,
    a
FROM test;

SYSTEM drop  table test;

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

INSERT INTO test SELECT '{"a" : 1}';

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