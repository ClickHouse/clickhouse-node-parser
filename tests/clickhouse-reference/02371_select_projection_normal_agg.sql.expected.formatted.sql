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
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE rng
(
    user_id_raw UInt64,
    device_id_raw UInt64,
    domain_raw UInt64,
    bytes_raw UInt64,
    duration_raw UInt64
)
ENGINE = GenerateRandom(1024);

CREATE TABLE video_log_result
(
    hour DateTime,
    sum_bytes UInt64,
    avg_duration Float64
)
ENGINE = MergeTree
ORDER BY sum_bytes
PARTITION BY toDate(hour)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    equals(sum_bytes1, sum_bytes2),
    equals(avg_duration1, avg_duration2)
FROM
    (
        SELECT
            toStartOfHour(datetime) AS hour,
            sum(bytes) AS sum_bytes1,
            avg(duration) AS avg_duration1
        FROM video_log
        WHERE (toDate(hour) = '2022-07-22')
            AND (device_id = '100')
        GROUP BY
            --(device_id = '100') Make sure it's not good and doesn't go into prewhere.
            hour
    )
LEFT JOIN (
        SELECT
            hour,
            sum_bytes AS sum_bytes2,
            avg_duration AS avg_duration2
        FROM video_log_result
    )
    USING (hour)
SETTINGS joined_subquery_requires_alias = 0;