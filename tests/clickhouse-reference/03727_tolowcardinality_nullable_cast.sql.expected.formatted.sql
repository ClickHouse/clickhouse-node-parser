-- Test for issue #89412: Bad cast from ColumnNullable to ColumnLowCardinality
SYSTEM DROP  TABLE IF EXISTS test_tolowcardinality_nullable;

-- Test 1: Original fiddle query from issue #89412
SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Nullable(Int)
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (toLowCardinality(c0))
SETTINGS allow_nullable_key = 1;

INSERT INTO t0 (c0);

SYSTEM DROP  TABLE t0;

-- Test 2: Using toLowCardinality with Nullable in PARTITION BY
CREATE TABLE test_tolowcardinality_nullable
(
    id UInt32,
    str Nullable(String)
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY toLowCardinality(str)
SETTINGS allow_nullable_key = 1;

INSERT INTO test_tolowcardinality_nullable;

-- Query that triggers KeyCondition optimization with toLowCardinality
SELECT *
FROM test_tolowcardinality_nullable
WHERE toLowCardinality(str) = 'a'
ORDER BY id ASC;

SELECT *
FROM test_tolowcardinality_nullable
ORDER BY id ASC;

SYSTEM DROP  TABLE test_tolowcardinality_nullable;

-- Test 2: Direct toLowCardinality on Nullable column
SELECT toLowCardinality(materialize(toNullable('test'))) AS result;

SELECT toLowCardinality(materialize(CAST(NULL AS Nullable(String)))) AS result;

-- Test 3: toLowCardinality in WHERE clause with Nullable
SYSTEM DROP  TABLE IF EXISTS test_tolowcardinality_where;

CREATE TABLE test_tolowcardinality_where
(
    id UInt32,
    val Nullable(String)
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO test_tolowcardinality_where;

SELECT id
FROM test_tolowcardinality_where
WHERE toLowCardinality(val) = 'x'
ORDER BY id ASC;

SYSTEM DROP  TABLE test_tolowcardinality_where;