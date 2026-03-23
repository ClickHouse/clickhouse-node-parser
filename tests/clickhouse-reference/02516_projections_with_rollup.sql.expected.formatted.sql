CREATE TABLE video_log
(
    datetime DateTime,
    user_id UInt64,
    device_id UInt64,
    domain LowCardinality(String),
    bytes UInt64,
    duration UInt64
)
ENGINE = MergeTree
ORDER BY (user_id, device_id)
PARTITION BY toDate(datetime)
SETTINGS index_granularity_bytes = 10485760, index_granularity = 8192;

CREATE TABLE video_log_result__fuzz_0
(
    hour Nullable(DateTime),
    sum_bytes UInt64,
    avg_duration Float64
)
ENGINE = MergeTree
ORDER BY sum_bytes
PARTITION BY toDate(hour)
SETTINGS allow_nullable_key = 1;

CREATE TABLE rng
(
    user_id_raw UInt64,
    device_id_raw UInt64,
    domain_raw UInt64,
    bytes_raw UInt64,
    duration_raw UInt64
)
ENGINE = GenerateRandom(1024);

INSERT INTO video_log SELECT
    toUnixTimestamp('2022-07-22 01:00:00') + (rowNumberInAllBlocks() / 20000),
    user_id_raw % 100000000 AS user_id,
    device_id_raw % 200000000 AS device_id,
    domain_raw % 100,
    (bytes_raw % 1024) + 128,
    (duration_raw % 300) + 100
FROM rng
LIMIT 1728000;

INSERT INTO video_log SELECT
    toUnixTimestamp('2022-07-22 01:00:00') + (rowNumberInAllBlocks() / 20000),
    user_id_raw % 100000000 AS user_id,
    100 AS device_id,
    domain_raw % 100,
    (bytes_raw % 1024) + 128,
    (duration_raw % 300) + 100
FROM rng
LIMIT 10;

-- We are not interested in the result of this query, but it should not produce a logical error.
SELECT
    avg_duration1,
    avg_duration1 = avg_duration2
FROM
    (
        SELECT
            sum(bytes),
            hour,
            toStartOfHour(datetime) AS hour,
            avg(duration) AS avg_duration1
        FROM video_log
        GROUP BY hour
        WITH ROLLUP
        WITH TOTALS
    )
LEFT JOIN (
        SELECT
            hour,
            sum_bytes AS sum_bytes2,
            avg_duration AS avg_duration2
        FROM video_log_result__fuzz_0
    )
    USING (hour)
SETTINGS joined_subquery_requires_alias = 0
FORMAT Null;