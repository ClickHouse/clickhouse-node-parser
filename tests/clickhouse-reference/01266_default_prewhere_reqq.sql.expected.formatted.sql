CREATE TABLE t1
(
    date Date,
    s1 String,
    s2 String
)
ENGINE = MergeTree()
ORDER BY (date, s1)
PARTITION BY toYYYYMMDD(date)
SETTINGS index_granularity = 8192;

SELECT
    ignore(date),
    s3
FROM t1
WHERE s2 = 'bbb';