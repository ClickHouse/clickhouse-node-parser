-- Tags: long

CREATE TABLE test_gcd(test_col UInt32 CODEC(GCD, LZ4))
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = 1024;
CREATE TABLE test_gcd2(test_col UInt32 CODEC(GCD, LZ4))
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = 1024, min_bytes_for_wide_part = 0, max_compress_block_size = 1024, min_compress_block_size = 1024;
