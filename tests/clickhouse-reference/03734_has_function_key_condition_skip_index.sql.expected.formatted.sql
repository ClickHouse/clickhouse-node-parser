CREATE TABLE test_has_skip_minmax
(
    id UInt32,
    key_col UInt32,
    payload String,
    INDEX idx_key_minmax key_col TYPE minmax GRANULARITY 4
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1000;

SELECT count()
FROM test_has_skip_minmax
WHERE has([5432, 7432, 9999], key_col);

SELECT count()
FROM test_has_skip_minmax
WHERE key_col IN ([5432, 7432, 9999]);

CREATE TABLE test_has_skip_set
(
    user_id UInt32,
    event_time DateTime,
    INDEX user_set_idx user_id TYPE set(100) GRANULARITY 2
)
ENGINE = MergeTree
ORDER BY event_time
SETTINGS index_granularity = 1000;

SELECT count()
FROM test_has_skip_set
WHERE has([10, 20, 30], user_id);

SELECT count()
FROM test_has_skip_set
WHERE user_id IN (10, 20, 30);

CREATE TABLE test_has_skip_bloom
(
    id UInt32,
    key_str String,
    payload String,
    INDEX idx_key_bf key_str TYPE bloom_filter(0.1) GRANULARITY 4
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1000;

SELECT count()
FROM test_has_skip_bloom
WHERE has(['v_12345', 'v_54321', 'v_99999'], key_str);

SELECT count()
FROM test_has_skip_bloom
WHERE key_str IN (['v_12345', 'v_54321', 'v_99999']);