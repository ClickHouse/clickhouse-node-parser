CREATE TABLE test_array_bloom (
    id UInt16,
    ts DateTime,
    data Array(String),
    INDEX test_bloom data TYPE bloom_filter GRANULARITY 1
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(ts)
ORDER BY id;
SELECT id FROM test_array_bloom WHERE has(data, 'ccc');
SELECT id FROM test_array_bloom ARRAY JOIN data WHERE data IN ('aaa') ORDER BY id;
