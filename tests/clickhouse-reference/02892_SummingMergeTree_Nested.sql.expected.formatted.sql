CREATE TABLE nested_smt
(
    date date,
    val UInt64,
    counters_Map Nested(id UInt8, count Int32)
)
ENGINE = SummingMergeTree()
ORDER BY (date);

-- { echo }
SELECT *
FROM nested_smt
ORDER BY val ASC;

SELECT *
FROM nested_smt FINAL;

SELECT *
FROM nested_smt;