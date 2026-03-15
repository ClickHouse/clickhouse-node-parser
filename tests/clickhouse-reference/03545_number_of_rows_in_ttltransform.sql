-- Tags: no-parallel

CREATE TABLE t
(
    `timestamp` DateTime,
    `id` String,
    `value` UInt16,
)
ENGINE = MergeTree
ORDER BY (id, toStartOfDay(timestamp))
TTL timestamp + toIntervalDay(1)
    GROUP BY id, toStartOfDay(timestamp)
    SET timestamp = max(timestamp) + interval 100 years, id = argMax(id, timestamp), value = max(value);
SELECT '-- Intersecting columns in GROUP BY and SET';
SELECT * FROM t ORDER BY ALL;
