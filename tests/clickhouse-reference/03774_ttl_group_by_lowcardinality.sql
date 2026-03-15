CREATE TABLE ttl_group_by__fuzz_13
(
    d Date,
    i LowCardinality(Float32),
    v LowCardinality(Nullable(UInt64))
)
ENGINE = MergeTree
ORDER BY (toStartOfMonth(d), i % 10)
TTL d + toIntervalYear(10) GROUP BY toStartOfMonth(d), i % 10 SET d = any(toStartOfMonth(d)), i = any(i % 10), v = sum(v), d + toIntervalYear(40) GROUP BY toStartOfMonth(d) SET d = any(toStartOfMonth(d)), v = sum(v)
SETTINGS allow_suspicious_low_cardinality_types = 1;
SELECT d, v FROM ttl_group_by__fuzz_13 ORDER BY d, v;
