SELECT timeSeriesChangesToGrid(10, 120, 10, 10)(timestamps, values)
FROM ts_data;

SELECT timeSeriesResetsToGrid(10, 120, 10, 10)(timestamps, values)
FROM ts_data;

SELECT timeSeriesChangesToGrid(10, 120, 10, 70)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesChangesToGridIf(10, 120, 10, 70)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesChangesToGridIf(10, 120, 10, 70)(timestamps, values, toNullable(length(timestamps) = length(values)))
FROM ts_data;

SELECT timeSeriesResetsToGrid(10, 120, 10, 70)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesResetsToGridIf(10, 120, 10, 70)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesResetsToGridIf(10, 120, 10, 70)(timestamps, values, toNullable(length(timestamps) = length(values)))
FROM ts_data;

SELECT *
FROM ts_data_nullable
WHERE isNull(value)
    AND id < 5;

SELECT timeSeriesResampleToGridWithStalenessIf(15, 125, 10, 10)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesChangesToGrid(15, 125, 10, 20)(arrayResize(timestamps, arrayMin([length(timestamps), length(values)]) AS min_len), arrayResize(values, min_len))
FROM ts_data;

SELECT timeSeriesChangesToGrid(15, 125, 10, 20)(timestamp, value)
FROM ts_data_nullable;

SELECT timeSeriesChangesToGridIf(15, 125, 10, 20)(timestamp, value, id < 5)
FROM ts_data_nullable;

SELECT timeSeriesResetsToGrid(15, 125, 10, 20)(arrayResize(timestamps, arrayMin([length(timestamps), length(values)]) AS min_len), arrayResize(values, min_len))
FROM ts_data;

SELECT timeSeriesResetsToGrid(15, 125, 10, 20)(timestamp, value)
FROM ts_data_nullable;

SELECT timeSeriesResetsToGridIf(15, 125, 10, 20)(timestamp, value, id < 5)
FROM ts_data_nullable;

SELECT timeSeriesChangesToGrid(15, 125, 10, 20)([10, 20, 30]::Array(UInt32), [1.0, 2.0, NULL]);

SELECT timeSeriesChangesToGrid(15, 125, 10, 20)([10, NULL, 30]::Array(Nullable(UInt32)), [1.0, 2.0, 3.0]);

SELECT timeSeriesResetsToGrid(15, 125, 10, 20)([10, 20, 30]::Array(UInt32), [1.0, 2.0, NULL]);

SELECT timeSeriesResetsToGrid(15, 125, 10, 20)([10, NULL, 30]::Array(Nullable(UInt32)), [1.0, 2.0, 3.0]);

SELECT timeSeriesChangesToGrid(100, 140, 15, 40)([89, 101, 109]::Array(UInt32), [89, 101, 99]::Array(Float32));

SELECT timeSeriesResetsToGrid(100, 140, 15, 40)([89, 101, 109]::Array(UInt32), [89, 101, 99]::Array(Float32));

SELECT timeSeriesChangesToGrid(120, 120, 0, 40)([89, 101, 109]::Array(UInt32), [89, 101, 99]::Array(Float32));

SELECT timeSeriesResetsToGrid(120, 120, 0, 40)([89, 101, 109]::Array(UInt32), [89, 101, 99]::Array(Float32));

SELECT timeSeriesChangesToGrid(100, 150, 10, 30)(toDateTime(105), [1., 2., 3.]);

SELECT timeSeriesChangesToGrid(100, 150, 10, 30)([1, 2, 3]::Array(UInt32), 1.);

SELECT timeSeriesResetsToGrid(100, 150, 10, 30)(toDateTime(105), [1., 2., 3.]);

SELECT timeSeriesResetsToGrid(100, 150, 10, 30)([1, 2, 3]::Array(UInt32), 1.);