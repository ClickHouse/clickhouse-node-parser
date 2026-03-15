CREATE TABLE test
(
    report_date Date,
    sspid UInt64
)
ENGINE = MergeTree
ORDER BY report_date
PARTITION BY report_date;

SELECT *
FROM test
WHERE tuple(report_date) IN (tuple(toDate('2023-04-17')));