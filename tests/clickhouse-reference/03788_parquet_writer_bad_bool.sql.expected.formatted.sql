SELECT
    x,
    reinterpret(x, 'UInt8')
FROM file(concat(currentDatabase(), '.parquet'));