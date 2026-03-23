CREATE TABLE t
(
    d Date,
    s LowCardinality(FixedString(3)),
    c UInt32
)
ENGINE = SummingMergeTree()
ORDER BY (d, s)
PARTITION BY d;

INSERT INTO t (d, s, c);

INSERT INTO t (d, s, c);

SELECT *
FROM t;

DROP TABLE t;