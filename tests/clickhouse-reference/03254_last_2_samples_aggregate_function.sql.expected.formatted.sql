SELECT *
FROM t_raw_timeseries
WHERE metric_id IN (3, 7)
    AND and(greaterOrEquals(timestamp, '2024-12-12 12:00:07'), lessOrEquals(timestamp, '2024-12-12 12:00:13'))
ORDER BY
    metric_id ASC,
    timestamp ASC;

-- Check resampled data
SELECT
    metric_id,
    grid_timestamp,
    (finalizeAggregation(samples).1 as timestamp, finalizeAggregation(samples).2 as value)
FROM t_resampled_timeseries
WHERE `step` = 10
    AND metric_id IN (3, 7)
    AND and(greaterOrEquals(grid_timestamp, '2024-12-12 12:00:00'), lessOrEquals(grid_timestamp, '2024-12-12 12:02:00'))
ORDER BY
    metric_id ASC,
    grid_timestamp ASC;

SELECT
    metric_id,
    grid_timestamp,
    (finalizeAggregation(samples).1 as timestamp, finalizeAggregation(samples).2 as value),
    arrayMap(x -> grid_timestamp + toIntervalMillisecond(x), timestamp) AS ts
FROM clusterAllReplicas('test_shard_localhost', currentDatabase(), t_resampled_timeseries_delta)
WHERE `step` = 10
    AND metric_id IN (3, 7)
    AND and(greaterOrEquals(grid_timestamp, '2024-12-12 12:00:00'), lessOrEquals(grid_timestamp, '2024-12-12 12:02:00'))
ORDER BY
    metric_id ASC,
    grid_timestamp ASC
SETTINGS
    enable_parallel_replicas = 1,
    max_parallel_replicas = 3,
    parallel_replicas_for_non_replicated_merge_tree = 1;

SELECT
    `step`,
    countDistinct((metric_id)),
    count(),
    min(grid_timestamp),
    max(grid_timestamp)
FROM t_resampled_timeseries FINAL
GROUP BY `step`
ORDER BY `step` ASC;

-- Compare aggregated table with timestamps and aggregated table with timestamp deltas
SELECT
    `step`,
    count(),
    sum(ts1 == ts2)
FROM (
        SELECT
            t.`step` AS `step`,
            finalizeAggregation(t.samples).1 AS ts1,
            arrayMap(x -> t_delta.grid_timestamp + toIntervalMillisecond(x), finalizeAggregation(t_delta.samples).1) AS ts2
        FROM
            t_resampled_timeseries AS t FINAL
        INNER JOIN t_resampled_timeseries_delta AS t_delta FINAL
            ON t.`step` == t_delta.`step`
            AND t.metric_id == t_delta.metric_id
            AND t.grid_timestamp == t_delta.grid_timestamp
    )
GROUP BY `step`
ORDER BY `step` ASC;