SET allow_experimental_ts_to_grid_aggregate_function=1;
SET cluster_for_parallel_replicas = 'test_shard_localhost';
CREATE TABLE t_resampled_timeseries
(
    step UInt32,   -- Resampling step in seconds
    metric_id UInt64,
    grid_timestamp DateTime('UTC') CODEC(DoubleDelta, ZSTD),
    samples Tuple(Array(DateTime('UTC')), Array(Float64)) -- Timeseries data resampled to the grid
)
ENGINE = AggregatingMergeTree()
ORDER BY (step, metric_id, grid_timestamp);
INSERT INTO t_resampled_timeseries(step, metric_id, grid_timestamp, samples) VALUES
(10, 42, '2024-12-12 12:00:10', (['2024-12-12 12:00:09', '2024-12-12 12:00:07'], [100, 90])),
(10, 42, '2024-12-12 12:00:20', (['2024-12-12 12:00:19'], [110])),
(10, 42, '2024-12-12 12:00:30', (['2024-12-12 12:00:29', '2024-12-12 12:00:23'], [100, 100])),
(10, 42, '2024-12-12 12:00:40', (['2024-12-12 12:00:39', '2024-12-12 12:00:38'], [90, 100]));
-- Test with DateTime64

CREATE TABLE t_resampled_timeseries_64
(
    step UInt32,   -- Resampling step in seconds
    metric_id UInt64,
    grid_timestamp DateTime('UTC') CODEC(DoubleDelta, ZSTD),
    samples Tuple(Array(DateTime64(3, 'UTC')), Array(Float64)) -- Timeseries data resampled to the grid
)
ENGINE = AggregatingMergeTree()
ORDER BY (step, metric_id, grid_timestamp);
INSERT INTO t_resampled_timeseries_64(step, metric_id, grid_timestamp, samples) VALUES
(10, 142, '2024-12-12 12:00:10', (['2024-12-12 12:00:09.100', '2024-12-12 12:00:08.600'], [100, 90])),
(10, 142, '2024-12-12 12:00:20', (['2024-12-12 12:00:19.100'], [110])),
(10, 142, '2024-12-12 12:00:30', (['2024-12-12 12:00:29.300', '2024-12-12 12:00:23.400'], [100, 100])),
(10, 142, '2024-12-12 12:00:40', (['2024-12-12 12:00:39.400', '2024-12-12 12:00:38.500'], [90, 100]));
-- Tests to validate block header compatibility in queries with parallel replicas
SET serialize_query_plan=1, prefer_localhost_replica = false;
SELECT
    metric_id,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c1,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime64(4,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c2,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(2,'UTC'), 10, 60)(samples.1, samples.2)) as c3,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123'::DateTime64(4,'UTC'), '2024-12-12 12:01:01'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c4,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123456'::DateTime64(4,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c5,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.12'::DateTime64(1,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c6,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123'::DateTime64(0,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c7,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime('UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) as c8,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123'::DateTime64(2,'UTC'), '2024-12-12 12:01:01'::DateTime('UTC'), 10, 60)(samples.1, samples.2)) as c9
FROM clusterAllReplicas('test_shard_localhost', currentDatabase(), t_resampled_timeseries_64)
GROUP BY metric_id
FORMAT Vertical;
SELECT
    metric_id,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c1,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime64(4,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c2,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(2,'UTC'), 10, 60)(samples.1, samples.2) as c3,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123'::DateTime64(4,'UTC'), '2024-12-12 12:01:01'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c4,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123456'::DateTime64(4,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c5,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.12'::DateTime64(1,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c6,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123'::DateTime64(0,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c7,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime('UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) as c8,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123'::DateTime64(2,'UTC'), '2024-12-12 12:01:01'::DateTime('UTC'), 10, 60)(samples.1, samples.2) as c9
FROM clusterAllReplicas('test_shard_localhost', currentDatabase(), t_resampled_timeseries_64)
GROUP BY metric_id
FORMAT Vertical;
