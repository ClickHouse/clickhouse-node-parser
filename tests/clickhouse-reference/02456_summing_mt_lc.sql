SET allow_suspicious_low_cardinality_types = 1;
CREATE TABLE t_summing_lc
(
    `key` UInt32,
    `val` LowCardinality(UInt32),
    `date` DateTime
)
ENGINE = SummingMergeTree(val)
PARTITION BY date
ORDER BY key;
SELECT * FROM t_summing_lc ORDER BY key;
