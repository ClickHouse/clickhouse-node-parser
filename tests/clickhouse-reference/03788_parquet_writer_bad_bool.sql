select x, reinterpret(x, 'UInt8') from file(currentDatabase() || '.parquet');
