SYSTEM DROP  TABLE IF EXISTS uin_value_details;

CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-20',
    number,
    number * number
FROM numbers(1000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-21',
    number,
    number
FROM numbers(1000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-22',
    number,
    number * number
FROM numbers(5000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-23',
    number,
    number
FROM numbers(5000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-26',
    number,
    number * number
FROM numbers(30000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-27',
    number,
    number
FROM numbers(30000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-28',
    number * 3,
    number * 3 * number * 3
FROM numbers(30000);

INSERT INTO uin_value_details (ds, uin, value) SELECT
    '2023-12-29',
    number * 3,
    number * 3
FROM numbers(30000);

SYSTEM DROP  TABLE IF EXISTS numeric_indexed_vector;

CREATE TABLE numeric_indexed_vector
(
    ds Date,
    vector AggregateFunction(groupNumericIndexedVector, UInt32, Float64)
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO numeric_indexed_vector (ds);