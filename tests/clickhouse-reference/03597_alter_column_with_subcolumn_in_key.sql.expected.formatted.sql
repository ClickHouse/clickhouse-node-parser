CREATE TABLE test
(
    id UInt32,
    t Tuple(a UInt32)
)
ENGINE = MergeTree
ORDER BY t.a;

CREATE TABLE test
(
    id UInt32,
    json JSON
)
ENGINE = MergeTree
ORDER BY json.a::Int64;