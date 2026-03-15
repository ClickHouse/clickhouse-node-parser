SET allow_suspicious_low_cardinality_types = true;

CREATE TABLE test_tuple_filter__fuzz_2
(
    id Nullable(UInt32),
    value LowCardinality(String),
    log_date LowCardinality(Date)
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY log_date
SETTINGS allow_nullable_key = 1;

SELECT (tuple(log_date) = tuple('2021-01-01'), log_date)
FROM test_tuple_filter__fuzz_2
ORDER BY log_date ASC;