CREATE TABLE t0 (c0 Nullable(Int)) ENGINE = MergeTree() ORDER BY tuple() PARTITION BY (toLowCardinality(c0)) SETTINGS allow_nullable_key = 1;
-- Test 2: Using toLowCardinality with Nullable in PARTITION BY
CREATE TABLE test_tolowcardinality_nullable
(
    id UInt32,
    str Nullable(String)
)
ENGINE = MergeTree()
PARTITION BY toLowCardinality(str)
ORDER BY id
SETTINGS allow_nullable_key = 1;
-- Query that triggers KeyCondition optimization with toLowCardinality
SELECT * FROM test_tolowcardinality_nullable WHERE toLowCardinality(str) = 'a' ORDER BY id;
SELECT * FROM test_tolowcardinality_nullable ORDER BY id;
-- Test 2: Direct toLowCardinality on Nullable column
SELECT toLowCardinality(materialize(toNullable('test'))) AS result;
SELECT toLowCardinality(materialize(CAST(NULL AS Nullable(String)))) AS result;
CREATE TABLE test_tolowcardinality_where
(
    id UInt32,
    val Nullable(String)
)
ENGINE = MergeTree()
ORDER BY id;
SELECT id FROM test_tolowcardinality_where WHERE toLowCardinality(val) = 'x' ORDER BY id;
