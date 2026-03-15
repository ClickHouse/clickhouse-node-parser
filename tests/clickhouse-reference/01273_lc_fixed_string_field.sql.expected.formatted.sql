CREATE TABLE t
(
    d Date,
    s LowCardinality(FixedString(3)),
    c UInt32
)
ENGINE = SummingMergeTree()
ORDER BY (d, s)
PARTITION BY d;

SELECT *
FROM t;