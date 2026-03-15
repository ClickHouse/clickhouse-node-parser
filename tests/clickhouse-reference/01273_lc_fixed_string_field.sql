CREATE TABLE t
(
    `d` Date,
    `s` LowCardinality(FixedString(3)),
    `c` UInt32
)
ENGINE = SummingMergeTree()
PARTITION BY d
ORDER BY (d, s);
SELECT * FROM t;
