SELECT estimateCompressionRatio('lz4', 8192)(some_column, other_column)
FROM test_table_for_estimate_compression_ratio;

SELECT estimateCompressionRatio('lz4', 8192, 2025)(some_column)
FROM test_table_for_estimate_compression_ratio;

SELECT estimateCompressionRatio('zstd', 'lz4')(some_column)
FROM test_table_for_estimate_compression_ratio;

SELECT estimateCompressionRatio('zstd', 8192)(some_column)
FROM test_table_for_estimate_compression_ratio;

SELECT estimateCompressionRatio(8192, 'zstd')(some_column)
FROM test_table_for_estimate_compression_ratio;

SELECT estimateCompressionRatio(0)(some_column)
FROM test_table_for_estimate_compression_ratio;

SELECT estimateCompressionRatio(0)(0);