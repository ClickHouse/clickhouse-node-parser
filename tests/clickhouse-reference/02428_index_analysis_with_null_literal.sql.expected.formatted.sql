-- From https://github.com/ClickHouse/ClickHouse/issues/41814
SYSTEM drop  table if exists test;

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

INSERT INTO test SELECT
    number,
    number,
    '2022-01-01 00:00:00'
FROM numbers(1000000);

SELECT count()
FROM test
WHERE a = (
        SELECT toUInt64(1)
        WHERE 1 = 2
    )
SETTINGS
    enable_early_constant_folding = 0,
    force_primary_key = 1;

SYSTEM drop  table test;

-- From https://github.com/ClickHouse/ClickHouse/issues/34063
SYSTEM drop  table if exists test_null_filter;

CREATE TABLE test_null_filter
(
    key UInt64,
    value UInt32
)
ENGINE = MergeTree
ORDER BY key
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO test_null_filter SELECT
    number,
    number
FROM numbers(10000000);

SELECT count()
FROM test_null_filter
WHERE key = NULL
    AND value > 0
SETTINGS force_primary_key = 1;

SYSTEM drop  table test_null_filter;