SELECT timeSeriesDerivToGrid(10, 120, 10, 10)(timestamps, values)
FROM ts_data;

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 10, 60)(timestamps, values)
FROM ts_data;

SELECT timeSeriesDerivToGrid(10, 120, 10, 60)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesDerivToGridIf(10, 120, 10, 60)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesDerivToGridIf(10, 120, 10, 60)(timestamps, values, toNullable(length(timestamps) = length(values)))
FROM ts_data;

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 60, 60)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesPredictLinearToGridIf(10, 120, 10, 60, 60)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesPredictLinearToGridIf(10, 120, 10, 60, 60)(timestamps, values, toNullable(length(timestamps) = length(values)))
FROM ts_data;

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 60, 60.5)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesPredictLinearToGridIf(10, 120, 10, 60, 60.5)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesPredictLinearToGridIf(10, 120, 10, 60, 60.5)(timestamps, values, toNullable(length(timestamps) = length(values)))
FROM ts_data;

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 60, -60)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesPredictLinearToGridIf(10, 120, 10, 60, -60)(timestamps, values, length(timestamps) = length(values))
FROM ts_data;

SELECT timeSeriesPredictLinearToGridIf(10, 120, 10, 60, -60)(timestamps, values, toNullable(length(timestamps) = length(values)))
FROM ts_data;

SELECT timeSeriesDerivToGrid(10, 120, 10, 61)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 61, 60)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 61, 60.5)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT timeSeriesPredictLinearToGrid(10, 120, 10, 61, -60)(timestamps, values)
FROM ts_data
WHERE length(timestamps) = length(values);

SELECT *
FROM ts_data_nullable
WHERE isNull(value)
    AND id < 5;

SELECT timeSeriesResampleToGridWithStaleness(15, 125, 10, 10)(arrayResize(timestamps, arrayMin([length(timestamps), length(values)]) AS min_len), arrayResize(values, min_len))
FROM ts_data;

SELECT timeSeriesResampleToGridWithStaleness(15, 125, 10, 10)(timestamp, value)
FROM ts_data_nullable;

SELECT timeSeriesResampleToGridWithStalenessIf(15, 125, 10, 10)(timestamp, value, id < 5)
FROM ts_data_nullable;

SELECT timeSeriesResampleToGridWithStaleness(15, 125, 10, 10)([10, 20, 30]::Array(UInt32), [1.0, 2.0, NULL]);

SELECT timeSeriesResampleToGridWithStaleness(15, 125, 10, 10)([10, NULL, 30]::Array(Nullable(UInt32)), [1.0, 2.0, 3.0]);

SELECT timeSeriesDerivToGrid(100, 120, 15, 20)([89, 101, 109]::Array(UInt32), [89, 101, 109]::Array(Float32));

SELECT timeSeriesPredictLinearToGrid(100, 120, 15, 20, 60)([89, 101, 109]::Array(UInt32), [89, 101, 109]::Array(Float32));

SELECT timeSeriesDerivToGrid(100, 150, 10, 30)([1, 2, 3]::Array(UInt32), 1.);

SELECT timeSeriesPredictLinearToGrid(100, 150, 10, 30, 60)([1, 2, 3]::Array(UInt32), 1.);