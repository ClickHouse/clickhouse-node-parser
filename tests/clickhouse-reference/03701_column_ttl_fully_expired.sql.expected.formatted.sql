-- { echo ON }
SYSTEM drop  table if exists x;

CREATE TABLE x
(
    dt DateTime,
    i Int32 DEFAULT 42 TTL dt + toIntervalDay(1),
    INDEX idx i TYPE set(100)
)
ENGINE = MergeTree
ORDER BY dt
PARTITION BY indexHint(dt)
SETTINGS index_granularity = 8192, min_bytes_for_wide_part = 0;

INSERT INTO x;

SELECT i
FROM x
WHERE i = 1;

SELECT i
FROM x
WHERE i = 42;

SYSTEM drop  table x;

CREATE TABLE x
(
    dt DateTime,
    i Int32 DEFAULT 42 TTL dt + toIntervalDay(1)
)
ENGINE = ReplacingMergeTree(i)
ORDER BY dt
SETTINGS index_granularity = 8192, min_bytes_for_wide_part = 0;

CREATE TABLE x
(
    dt DateTime,
    i Int32 DEFAULT 42 TTL dt + toIntervalDay(1)
)
ENGINE = MergeTree
ORDER BY dt
SETTINGS index_granularity = 8192, min_bytes_for_wide_part = 0;

INSERT INTO x;

SELECT i
FROM x;