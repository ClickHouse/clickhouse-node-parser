SELECT groupArraySorted(30)((toUnixTimestamp(timestamp), value))
FROM ts_data;

SELECT
    intDiv(toUnixTimestamp(timestamp), 130) * 130 AS fake_key,
    timeSeriesResampleToGridWithStaleness(100, 200, 10, 15)(timestamp, value)
FROM ts_data
GROUP BY fake_key
ORDER BY fake_key ASC;

SELECT
    avgForEach(values),
    countForEach(values) AS avg_values
FROM (
        SELECT
            intDiv(toUnixTimestamp(timestamp), 130) * 130 AS fake_key,
            timeSeriesResampleToGridWithStaleness(100, 200, 10, 15)(timestamp, value) AS values
        FROM ts_data
        GROUP BY fake_key
    );

SELECT
    k,
    finalizeAggregation(agg)
FROM ts_data_agg FINAL
ORDER BY k ASC;

SELECT timeSeriesResampleToGridWithStaleness(100, 200, 10, 15)(timestamp, value)
FROM ts_data;

SELECT timeSeriesResampleToGridWithStalenessMerge(100, 200, 10, 15)(agg)
FROM ts_data_agg;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp::DateTime64(2,'UTC'), value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100::Int32, 150::UInt16, 15::Decimal(10,2), 50)(timestamp::DateTime64(3, 'UTC'), value::Float32) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 100, 15, 50)(timestamp::DateTime64(3, 'UTC'), value::Float32) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStalenessIf(100, 150, 15, 50)(timestamp, value, value % 2 == 0) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(if(value < 10120, NULL, timestamp), value::Float32) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp, if(value < 10120, NULL, value)) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp, value::Decimal(10,3)) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp, value::Int64) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp, value::String) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50)(timestamp, value::DateTime) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100::Float64, 150, 15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150::Float32, 15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15::Float32, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, 50::Float64)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(-100, 150, 15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, -150, 15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, -15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 15, -50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(200, 100, 15, 50)(timestamp, value) AS res
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(100, 150, 0, 50)(timestamp, value) AS res
FROM ts_data;