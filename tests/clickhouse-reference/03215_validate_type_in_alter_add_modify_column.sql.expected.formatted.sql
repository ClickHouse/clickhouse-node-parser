SET allow_suspicious_low_cardinality_types = 0;

SET allow_suspicious_fixed_string_types = 0;

CREATE TABLE test
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY id;