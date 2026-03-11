SELECT *
FROM ts_raw_data;

SELECT
    'groupArray: ',
    timeSeriesGroupArray(timestamp, value)
FROM ts_raw_data;