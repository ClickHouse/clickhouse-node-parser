SYSTEM drop  table if exists test;

CREATE TABLE test
(
    id UInt32,
    t Tuple(a UInt32)
)
ENGINE = MergeTree
ORDER BY t.a;

INSERT INTO test SELECT
    1,
    tuple(1);

SYSTEM drop  table test;

CREATE TABLE test
(
    id UInt32,
    json JSON
)
ENGINE = MergeTree
ORDER BY json.a::Int64;

INSERT INTO test SELECT
    1,
    '{"a" : 42}';