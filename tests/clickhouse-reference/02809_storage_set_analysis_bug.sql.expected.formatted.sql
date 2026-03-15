SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE null_in__fuzz_6
(
    dt LowCardinality(UInt16),
    idx Int32,
    i Nullable(Int256),
    s Int32
)
ENGINE = MergeTree
ORDER BY idx
PARTITION BY dt;

SET transform_null_in = 0;

CREATE TABLE test_set
(
    i Nullable(int)
)
ENGINE = Set();

SELECT count() = 1
FROM null_in__fuzz_6
PREWHERE 71
WHERE i IN (test_set); -- { serverError CANNOT_CONVERT_TYPE }