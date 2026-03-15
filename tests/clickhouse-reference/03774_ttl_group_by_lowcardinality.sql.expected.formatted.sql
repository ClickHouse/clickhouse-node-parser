CREATE TABLE ttl_group_by__fuzz_13
(
    d Date,
    i LowCardinality(Float32),
    v LowCardinality(Nullable(UInt64))
)
ENGINE = MergeTree
ORDER BY (toStartOfMonth(d), i % 10)
TTL d + toIntervalYear(10),
    d + toIntervalYear(40)
SETTINGS allow_suspicious_low_cardinality_types = 1;

SELECT
    d,
    v
FROM ttl_group_by__fuzz_13
ORDER BY
    d ASC,
    v ASC;