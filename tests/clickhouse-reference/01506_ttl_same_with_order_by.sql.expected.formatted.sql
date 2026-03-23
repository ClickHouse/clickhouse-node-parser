CREATE TABLE derived_metrics_local
(
    timestamp DateTime,
    bytes UInt64
)
ENGINE = SummingMergeTree()
ORDER BY (toStartOfHour(timestamp), timestamp)
PARTITION BY toYYYYMMDD(timestamp)
TTL toStartOfHour(timestamp) + toIntervalHour(1);

INSERT INTO derived_metrics_local;

INSERT INTO derived_metrics_local;

INSERT INTO derived_metrics_local;

SELECT *
FROM derived_metrics_local;

CREATE TABLE derived_metrics_local
(
    timestamp DateTime,
    timestamp_h DateTime MATERIALIZED toStartOfHour(timestamp),
    bytes UInt64
)
ENGINE = SummingMergeTree()
ORDER BY (timestamp_h, timestamp)
PARTITION BY toYYYYMMDD(timestamp)
TTL toStartOfHour(timestamp) + toIntervalHour(1);

INSERT INTO derived_metrics_local;

INSERT INTO derived_metrics_local;

INSERT INTO derived_metrics_local;

SELECT
    timestamp,
    timestamp_h,
    bytes
FROM derived_metrics_local;

CREATE TABLE derived_metrics_local
(
    timestamp DateTime,
    bytes UInt64 TTL toStartOfHour(timestamp) + toIntervalHour(1)
)
ENGINE = MergeTree()
ORDER BY (toStartOfHour(timestamp), timestamp)
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO derived_metrics_local;

SELECT sum(bytes)
FROM derived_metrics_local;

CREATE TABLE derived_metrics_local
(
    timestamp DateTime,
    bytes UInt64
)
ENGINE = MergeTree()
ORDER BY (toStartOfHour(timestamp), timestamp)
PARTITION BY toYYYYMMDD(timestamp)
TTL toStartOfHour(timestamp) + toIntervalHour(1)
SETTINGS min_bytes_for_wide_part = 0;

SELECT count()
FROM derived_metrics_local;