CREATE TABLE test_ttl_group_by01763
(
    key UInt32,
    ts DateTime,
    value UInt32,
    min_value UInt32 DEFAULT value,
    max_value UInt32 DEFAULT value
)
ENGINE = MergeTree()
ORDER BY (key, toStartOfInterval(ts, toIntervalMinute(3)), ts)
PARTITION BY toYYYYMM(ts)
TTL ts + toIntervalMinute(5);

SELECT
    sum(value),
    min(min_value),
    max(max_value),
    uniqExact(key)
FROM test_ttl_group_by01763;

SELECT
    sum(value),
    min(min_value),
    max(max_value),
    uniqExact(key)
FROM test_ttl_group_by01763
WHERE key = 3;

SELECT
    sum(value),
    min(min_value),
    max(max_value),
    uniqExact(key)
FROM test_ttl_group_by01763
WHERE key = 3
    AND ts <= today() - toIntervalDay(30);