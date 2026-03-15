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
CREATE TABLE test_has_skip_set (
    user_id UInt32,
    event_time DateTime,
    INDEX user_set_idx user_id TYPE set(100) GRANULARITY 2
)
ENGINE = MergeTree
ORDER BY event_time
SETTINGS index_granularity = 1000, add_minmax_index_for_numeric_columns=0;
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
