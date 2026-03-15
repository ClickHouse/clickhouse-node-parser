CREATE TABLE ts_raw_data
(
    timestamp DateTime64(3, 'UTC'),
    value Float64
)
ENGINE = MergeTree()
ORDER BY timestamp;

SELECT *
FROM ts_raw_data;

SET allow_experimental_time_series_aggregate_functions = 1;

SELECT
    'groupArray: ',
    timeSeriesGroupArray(timestamp, value)
FROM ts_raw_data;