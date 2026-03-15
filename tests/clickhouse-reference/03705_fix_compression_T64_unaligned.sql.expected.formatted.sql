CREATE TABLE IF NOT EXISTS compression_estimate_example
(
    number UInt64
)
ENGINE = MergeTree()
ORDER BY number;

SELECT estimateCompressionRatio('DoubleDelta, T64, ZSTD')(number) AS estimate
FROM compression_estimate_example
FORMAT Null;