CREATE TABLE test
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, ratio_of_defaults_for_sparse_serialization = 0.0, max_suspicious_broken_parts = 0, max_suspicious_broken_parts_bytes = 0;

SELECT *
FROM test;