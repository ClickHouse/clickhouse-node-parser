SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE lc_00800_2
(
    val LowCardinality(UInt64)
)
ENGINE = MergeTree
ORDER BY val;

SELECT DISTINCT (val)
FROM lc_00800_2
ORDER BY val ASC;