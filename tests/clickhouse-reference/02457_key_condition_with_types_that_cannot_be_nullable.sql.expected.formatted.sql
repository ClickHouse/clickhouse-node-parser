CREATE TABLE test
(
    Printer LowCardinality(String),
    IntervalStart DateTime
)
ENGINE = MergeTree
ORDER BY (Printer, IntervalStart)
PARTITION BY (hiveHash(Printer), toYear(IntervalStart));

SELECT Printer
FROM test
WHERE Printer = 'printer1';