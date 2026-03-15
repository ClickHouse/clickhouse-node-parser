SET session_timezone = 'UTC';

CREATE TABLE test
(
    id UInt64,
    ts Nullable(DateTime64(3)),
    INDEX idx_ts ts TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity = 1;

CREATE VIEW view_assume
AS
SELECT
    id,
    assumeNotNull(ts) AS ts
FROM test;

CREATE VIEW view_coalesce
AS
SELECT
    id,
    coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) AS ts
FROM test;

CREATE VIEW view_ifnull
AS
SELECT
    id,
    ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) AS ts
FROM test;

SELECT *
FROM test
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM view_assume
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM view_coalesce
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM view_ifnull
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

CREATE TABLE test_non_null
(
    ts Nullable(DateTime64(3))
)
ENGINE = MergeTree()
ORDER BY ts
SETTINGS index_granularity = 1, allow_nullable_key = 1;

SELECT *
FROM test_non_null
WHERE assumeNotNull(ts) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_non_null
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_non_null
WHERE ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

CREATE TABLE test_null
(
    ts Nullable(DateTime64(3))
)
ENGINE = MergeTree()
ORDER BY ts
SETTINGS index_granularity = 1, allow_nullable_key = 1;

SELECT *
FROM test_null
WHERE assumeNotNull(ts) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null
WHERE ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

CREATE TABLE test_null_rev
(
    ts Nullable(DateTime64(3))
)
ENGINE = MergeTree()
ORDER BY (ts DESC)
SETTINGS index_granularity = 1, allow_nullable_key = 1, allow_experimental_reverse_key = 1;

SELECT *
FROM test_null_rev
WHERE assumeNotNull(ts) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null_rev
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null_rev
WHERE ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SET allow_suspicious_low_cardinality_types = 1;

SET optimize_use_projections = 0;

CREATE TABLE test_lc_left_inf
(
    a UInt8,
    ts LowCardinality(Nullable(Int64))
)
ENGINE = MergeTree()
ORDER BY (a, ts)
SETTINGS index_granularity = 1, allow_nullable_key = 1;

SELECT *
FROM test_lc_left_inf
WHERE assumeNotNull(ts) >= 1000
ORDER BY `ALL` ASC;