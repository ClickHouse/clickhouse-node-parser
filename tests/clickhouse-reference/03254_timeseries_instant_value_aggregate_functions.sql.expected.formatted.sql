SELECT
    metric_id,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c1,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime64(4,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c2,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(2,'UTC'), 10, 60)(samples.1, samples.2)) AS c3,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123'::DateTime64(4,'UTC'), '2024-12-12 12:01:01'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c4,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123456'::DateTime64(4,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c5,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.12'::DateTime64(1,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c6,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123'::DateTime64(0,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c7,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10'::DateTime('UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2)) AS c8,
    toTypeName(timeSeriesInstantRateToGridState('2024-12-12 12:00:10.123'::DateTime64(2,'UTC'), '2024-12-12 12:01:01'::DateTime('UTC'), 10, 60)(samples.1, samples.2)) AS c9
FROM clusterAllReplicas('test_shard_localhost', currentDatabase(), t_resampled_timeseries_64)
GROUP BY metric_id
FORMAT Vertical;

SELECT
    metric_id,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c1,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime64(4,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c2,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime64(3,'UTC'), '2024-12-12 12:01:00'::DateTime64(2,'UTC'), 10, 60)(samples.1, samples.2) AS c3,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123'::DateTime64(4,'UTC'), '2024-12-12 12:01:01'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c4,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123456'::DateTime64(4,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c5,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.12'::DateTime64(1,'UTC'), '2024-12-12 12:01:00.123'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c6,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123'::DateTime64(0,'UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c7,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10'::DateTime('UTC'), '2024-12-12 12:01:00'::DateTime64(3,'UTC'), 10, 60)(samples.1, samples.2) AS c8,
    timeSeriesInstantRateToGrid('2024-12-12 12:00:10.123'::DateTime64(2,'UTC'), '2024-12-12 12:01:01'::DateTime('UTC'), 10, 60)(samples.1, samples.2) AS c9
FROM clusterAllReplicas('test_shard_localhost', currentDatabase(), t_resampled_timeseries_64)
GROUP BY metric_id
FORMAT Vertical;