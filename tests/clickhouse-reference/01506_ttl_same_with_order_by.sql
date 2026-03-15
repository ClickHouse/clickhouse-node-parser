CREATE TABLE derived_metrics_local
(
  timestamp DateTime,
  bytes UInt64
)
ENGINE=SummingMergeTree()
PARTITION BY toYYYYMMDD(timestamp)
ORDER BY (toStartOfHour(timestamp), timestamp)
TTL toStartOfHour(timestamp) + INTERVAL 1 HOUR GROUP BY toStartOfHour(timestamp)
SET bytes=max(bytes);
SELECT * FROM derived_metrics_local;
CREATE TABLE derived_metrics_local
(
  timestamp DateTime,
  timestamp_h DateTime materialized toStartOfHour(timestamp),
  bytes UInt64
)
ENGINE=SummingMergeTree()
PARTITION BY toYYYYMMDD(timestamp)
ORDER BY (timestamp_h, timestamp)
TTL toStartOfHour(timestamp) + INTERVAL 1 HOUR GROUP BY timestamp_h
SET bytes=max(bytes), timestamp = toStartOfHour(any(timestamp));
SELECT timestamp, timestamp_h, bytes FROM derived_metrics_local;
CREATE TABLE derived_metrics_local
(
  timestamp DateTime,
  bytes UInt64 TTL toStartOfHour(timestamp) + INTERVAL 1 HOUR
)
ENGINE=MergeTree()
ORDER BY (toStartOfHour(timestamp), timestamp)
SETTINGS min_bytes_for_wide_part = 0;
SELECT sum(bytes) FROM derived_metrics_local;
CREATE TABLE derived_metrics_local
(
  timestamp DateTime,
  bytes UInt64
)
ENGINE=MergeTree()
PARTITION BY toYYYYMMDD(timestamp)
ORDER BY (toStartOfHour(timestamp), timestamp)
TTL toStartOfHour(timestamp) + INTERVAL 1 HOUR
SETTINGS min_bytes_for_wide_part = 0;
SELECT count() FROM derived_metrics_local;
