CREATE TABLE test
(
    a UInt64,
    m UInt64,
    d DateTime
)
ENGINE = MergeTree
ORDER BY (a, m, d)
PARTITION BY toYYYYMM(d)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT count()
FROM test
WHERE a = (
        SELECT toUInt64(1)
        WHERE 1 = 2
    )
SETTINGS
    enable_early_constant_folding = 0,
    force_primary_key = 1;

CREATE TABLE test_null_filter
(
    key UInt64,
    value UInt32
)
ENGINE = MergeTree
ORDER BY key
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT count()
FROM test_null_filter
WHERE key = NULL
    AND value > 0
SETTINGS force_primary_key = 1;