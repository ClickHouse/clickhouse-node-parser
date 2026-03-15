CREATE TABLE sums
(
    key LowCardinality(String),
    sumOfSums UInt64,
    sumsMap Nested(key LowCardinality(String), sum UInt64)
)
ENGINE = SummingMergeTree
PRIMARY KEY key;

SELECT *
FROM sums;