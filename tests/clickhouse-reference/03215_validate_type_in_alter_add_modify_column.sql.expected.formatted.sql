SET allow_suspicious_low_cardinality_types = 0;

SET allow_suspicious_fixed_string_types = 0;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY id;

SYSTEM drop  table test;