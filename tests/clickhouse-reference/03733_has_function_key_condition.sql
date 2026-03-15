CREATE TABLE test_has_idx_simple
(
    id UInt32,
    payload String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1000;
SELECT count()
FROM test_has_idx_simple
WHERE has([10, 50000, 90000], id);
SELECT count()
FROM test_has_idx_simple
WHERE id IN (10, 50000, 90000);
SELECT count()
FROM test_has_idx_simple
WHERE has([10, 50000, 90000], toUInt64(id + 2));
SELECT count()
FROM test_has_idx_simple
WHERE toUInt64(id + 2) IN (10, 50000, 90000);
SELECT count()
FROM test_has_idx_simple
WHERE has([10, 50000, 90000, NULL, NULL], toUInt64(id + 2));
SELECT count()
FROM test_has_idx_simple
WHERE has([10, 50000, 90000, 'a'], id); -- { serverError NO_COMMON_TYPE }
CREATE TABLE test_has_idx_tuple_col
(
    id UInt32,
    key_tuple Tuple(UInt32, UInt32),
    payload String
)
ENGINE = MergeTree
ORDER BY key_tuple
SETTINGS index_granularity = 1000;
SELECT count()
FROM test_has_idx_tuple_col
WHERE has([(10, 0), (50000, 0)], key_tuple);
SELECT count()
FROM test_has_idx_tuple_col
WHERE key_tuple IN ((10, 0), (50000, 0));
CREATE TABLE test_has_idx_tuple_col_nullable_elements
(
    id UInt32,
    key_tuple Tuple(Nullable(UInt32), Nullable(UInt32)),
    payload String
)
ENGINE = MergeTree
ORDER BY key_tuple
SETTINGS index_granularity = 1000, allow_nullable_key = 1;
SELECT count()
FROM test_has_idx_tuple_col_nullable_elements
WHERE has([(10, 0), (50000, 0), (0, NULL), (NULL, 10), (NULL, 20)], key_tuple);
SELECT count()
FROM test_has_idx_tuple_col_nullable_elements
WHERE key_tuple IN ((10, 0), (50000, 0), (0, NULL), (NULL, 10), (NULL, 20))
SETTINGS transform_null_in = 1;
CREATE TABLE test_has_idx_array_col
(
    id UInt32,
    arr_key Array(UInt32),
    payload String
)
ENGINE = MergeTree
ORDER BY arr_key
SETTINGS index_granularity = 1000;
SELECT count()
FROM test_has_idx_array_col
WHERE has([[10, 11], [50000, 50001]], arr_key);
SELECT count()
FROM test_has_idx_array_col
WHERE arr_key IN [[10, 11], [50000, 50001]];
CREATE TABLE test_has_idx_tuple_two_cols
(
    k1 UInt32,
    k2 UInt32,
    payload String
)
ENGINE = MergeTree
ORDER BY (k1, k2)
SETTINGS index_granularity = 1000;
SELECT count()
FROM test_has_idx_tuple_two_cols
WHERE has([(10, 0), (50000, 0)], (k1, k2));
SELECT count()
FROM test_has_idx_tuple_two_cols
WHERE (k1, k2) IN ((10, 0), (50000, 0));
SELECT count()
FROM test_has_idx_tuple_two_cols
WHERE has([(10, 0), (50000, 0), (NULL, NULL)], (k1, k2));
SELECT count()
FROM test_has_idx_tuple_two_cols
WHERE (k1, k2) IN ((10, 0), (50000, 0), (NULL, NULL));
CREATE TABLE test_has_idx_lowcard
(
    id UInt32,
    key_lc LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY key_lc
SETTINGS index_granularity = 1000;
SELECT count()
FROM test_has_idx_lowcard
WHERE has(['1000010', '1000042', '1000077'], key_lc);
SELECT count()
FROM test_has_idx_lowcard
WHERE key_lc IN ('1000010', '1000042', '1000077');
CREATE TABLE test_has_idx_nullable
(
    id UInt32,
    key_nullable Nullable(UInt32)
)
ENGINE = MergeTree
ORDER BY key_nullable
SETTINGS index_granularity = 1000, allow_nullable_key = 1;
SELECT count()
FROM test_has_idx_nullable
WHERE has([11, 50000, 90000], key_nullable);
SELECT count()
FROM test_has_idx_nullable
WHERE key_nullable IN (11, 50000, 90000);
SELECT count()
FROM test_has_idx_nullable
WHERE has([11, 50000, 90000, NULL], key_nullable);
SELECT count()
FROM test_has_idx_nullable
WHERE key_nullable IN (11, 50000, 90000, NULL)
SETTINGS transform_null_in = 1;
CREATE TABLE test_has_idx_func_key
(
    ts DateTime,
    payload String
)
ENGINE = MergeTree
ORDER BY ts
SETTINGS index_granularity = 1000;
SELECT count()
FROM test_has_idx_func_key
WHERE has([toDate('2020-01-01'), toDate('2020-01-02'), toDate('2020-01-03')], toDate(ts));
SELECT count()
FROM test_has_idx_func_key
WHERE toDate(ts) IN ('2020-01-01', '2020-01-02', '2020-01-03');
CREATE TABLE t1
(
    c1 UInt64
)
ENGINE = MergeTree()
ORDER BY (c1);
SELECT count()
FROM t1
WHERE has([], c1);
