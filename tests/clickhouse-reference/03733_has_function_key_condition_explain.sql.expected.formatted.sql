-- Tags: no-replicated-database, no-parallel-replicas, no-parallel, no-random-merge-tree-settings
-- add_minmax_index_for_numeric_columns=0: Different plan
-- EXPLAIN output may differ
-- { echoOn }
SYSTEM DROP  TABLE IF EXISTS test_has_idx_simple;

CREATE TABLE test_has_idx_simple
(
    id UInt32,
    payload String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1000, add_minmax_index_for_numeric_columns = 0;

INSERT INTO test_has_idx_simple SELECT
    number,
    toString(number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_tuple_col;

CREATE TABLE test_has_idx_tuple_col
(
    id UInt32,
    key_tuple Tuple(UInt32, UInt32),
    payload String
)
ENGINE = MergeTree
ORDER BY key_tuple
SETTINGS index_granularity = 1000;

INSERT INTO test_has_idx_tuple_col SELECT
    number,
    (number, number % 10),
    toString(number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_tuple_col_nullable_elements;

CREATE TABLE test_has_idx_tuple_col_nullable_elements
(
    id UInt32,
    key_tuple Tuple(Nullable(UInt32), Nullable(UInt32)),
    payload String
)
ENGINE = MergeTree
ORDER BY key_tuple
SETTINGS index_granularity = 1000, allow_nullable_key = 1;

INSERT INTO test_has_idx_tuple_col_nullable_elements SELECT
    number,
    tuple(number, NULL),
    toString(number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_array_col;

CREATE TABLE test_has_idx_array_col
(
    id UInt32,
    arr_key Array(UInt32),
    payload String
)
ENGINE = MergeTree
ORDER BY arr_key
SETTINGS index_granularity = 1000;

INSERT INTO test_has_idx_array_col SELECT
    number,
    [number, number + 1],
    toString(number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_tuple_two_cols;

CREATE TABLE test_has_idx_tuple_two_cols
(
    k1 UInt32,
    k2 UInt32,
    payload String
)
ENGINE = MergeTree
ORDER BY (k1, k2)
SETTINGS index_granularity = 1000, add_minmax_index_for_numeric_columns = 0;

INSERT INTO test_has_idx_tuple_two_cols SELECT
    number,
    number % 10,
    toString(number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_lowcard;

CREATE TABLE test_has_idx_lowcard
(
    id UInt32,
    key_lc LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY key_lc
SETTINGS index_granularity = 1000;

INSERT INTO test_has_idx_lowcard SELECT
    number,
    toString((number % 100) + 1000000)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_nullable;

CREATE TABLE test_has_idx_nullable
(
    id UInt32,
    key_nullable Nullable(UInt32)
)
ENGINE = MergeTree
ORDER BY key_nullable
SETTINGS index_granularity = 1000, allow_nullable_key = 1;

INSERT INTO test_has_idx_nullable SELECT
    number,
    if(number % 10 = 0, NULL, number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS test_has_idx_func_key;

CREATE TABLE test_has_idx_func_key
(
    ts DateTime,
    payload String
)
ENGINE = MergeTree
ORDER BY ts
SETTINGS index_granularity = 1000;

INSERT INTO test_has_idx_func_key SELECT
    toDate('2020-01-01') + number,
    toString(number)
FROM numbers(100000);

SYSTEM DROP  TABLE IF EXISTS t1;

CREATE TABLE t1
(
    c1 UInt64
)
ENGINE = MergeTree()
ORDER BY (c1);

INSERT INTO t1;