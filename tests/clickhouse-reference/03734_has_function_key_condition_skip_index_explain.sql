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
INSERT INTO test_has_skip_minmax
SELECT number,
       number % 10000,
       toString(number)
FROM numbers(100000);
CREATE TABLE test_has_skip_set (
    user_id UInt32,
    event_time DateTime,
    INDEX user_set_idx user_id TYPE set(100) GRANULARITY 2
)
ENGINE = MergeTree
ORDER BY event_time
SETTINGS index_granularity = 1000, add_minmax_index_for_numeric_columns=0;
INSERT INTO test_has_skip_set 
SELECT 
    toUInt32(intDiv(number, 1000)) AS user_id,
    now() - INTERVAL number MINUTE AS event_time
FROM numbers(100000);
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
INSERT INTO test_has_skip_bloom
SELECT number,
       concat('v_', toString(number % 100000)),
       toString(number)
FROM numbers(100000);
