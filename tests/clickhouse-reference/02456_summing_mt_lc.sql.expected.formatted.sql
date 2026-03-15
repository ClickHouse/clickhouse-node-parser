SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE t_summing_lc
(
    key UInt32,
    val LowCardinality(UInt32),
    date DateTime
)
ENGINE = SummingMergeTree(val)
ORDER BY key
PARTITION BY date;

SELECT *
FROM t_summing_lc
ORDER BY key ASC;