SET allow_experimental_ts_to_grid_aggregate_function = 1;

-- Table for raw data
CREATE TABLE t_raw_timeseries
(
    metric_id UInt64,
    timestamp DateTime64(3, 'UTC') CODEC(DoubleDelta, ZSTD),
    value Float64 CODEC(DoubleDelta)
)
ENGINE = MergeTree()
ORDER BY (metric_id, timestamp);

-- Table with data re-sampled to bigger (15 sec) time steps
CREATE TABLE t_resampled_timeseries_15_sec
(
    metric_id UInt64,
    grid_timestamp DateTime('UTC') CODEC(DoubleDelta, ZSTD),
    samples AggregateFunction(timeSeriesLastTwoSamples, DateTime64(3, 'UTC'), Float64)
)
ENGINE = AggregatingMergeTree()
ORDER BY (metric_id, grid_timestamp);

-- MV for populating re-sampled table
CREATE MATERIALIZED VIEW mv_resampled_timeseries
TO t_resampled_timeseries_15_sec
(
    metric_id UInt64,
    grid_timestamp DateTime('UTC') CODEC(DoubleDelta, ZSTD),
    samples AggregateFunction(timeSeriesLastTwoSamples, DateTime64(3, 'UTC'), Float64)
)
AS
SELECT
    metric_id,
    ceil(toUnixTimestamp(timestamp + toIntervalMillisecond(999)) / 15, 0) * 15 AS grid_timestamp, -- Round timestamp up to the next grid point
    initializeAggregation('timeSeriesLastTwoSamplesState', timestamp, value) AS samples
FROM t_raw_timeseries
ORDER BY
    metric_id ASC,
    grid_timestamp ASC;

-- Insert some data
INSERT INTO t_raw_timeseries (metric_id, timestamp, value) SELECT
    number % 10 AS metric_id,
    '2024-12-12 12:00:00'::DateTime64(3, 'UTC') + toIntervalMillisecond(((number / 10) % 100) * 900) AS timestamp,
    number % 3 + number % 29 AS value
FROM numbers(1000);

-- Check raw data
SELECT *
FROM t_raw_timeseries
WHERE metric_id = 3
    AND and(greaterOrEquals(timestamp, '2024-12-12 12:00:12'), lessOrEquals(timestamp, '2024-12-12 12:00:31'))
ORDER BY
    metric_id ASC,
    timestamp ASC;

-- Check re-sampled data
SELECT
    metric_id,
    grid_timestamp,
    (finalizeAggregation(samples).1 as timestamp, finalizeAggregation(samples).2 as value)
FROM t_resampled_timeseries_15_sec
WHERE metric_id = 3
    AND and(greaterOrEquals(grid_timestamp, '2024-12-12 12:00:15'), lessOrEquals(grid_timestamp, '2024-12-12 12:00:30'))
ORDER BY
    metric_id ASC,
    grid_timestamp ASC;