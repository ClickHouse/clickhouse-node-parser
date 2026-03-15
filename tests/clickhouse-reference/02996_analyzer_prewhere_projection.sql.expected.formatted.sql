SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE t__fuzz_0
(
    i LowCardinality(Int32),
    j Int32,
    k Int32,
    PROJECTION p (    SELECT *
    ORDER BY j ASC)
)
ENGINE = MergeTree
ORDER BY i
SETTINGS index_granularity = 1;

SELECT *
FROM t__fuzz_0
PREWHERE 7
    AND (i < 2147483647)
    AND (j IN (2147483646, -2, 1))
SETTINGS enable_analyzer = true;