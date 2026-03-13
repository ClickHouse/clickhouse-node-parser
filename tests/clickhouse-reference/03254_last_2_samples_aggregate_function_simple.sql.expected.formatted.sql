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