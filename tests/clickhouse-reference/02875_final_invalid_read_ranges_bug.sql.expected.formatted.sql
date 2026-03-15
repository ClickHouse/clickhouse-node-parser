CREATE TABLE t
(
    tid UInt64,
    processed_at DateTime,
    created_at DateTime,
    amount Int64
)
ENGINE = ReplacingMergeTree
ORDER BY (toStartOfDay(created_at), toStartOfDay(processed_at), tid)
PARTITION BY toStartOfQuarter(created_at)
PRIMARY KEY (toStartOfDay(created_at), toStartOfDay(processed_at))
SETTINGS index_granularity = 1;

SELECT
    tid,
    processed_at,
    created_at,
    amount
FROM t FINAL
ORDER BY tid ASC;

SELECT sum(amount)
FROM t FINAL
WHERE (processed_at >= '2023-09-19 00:00:00')
    AND (processed_at <= '2023-09-20 01:00:00');