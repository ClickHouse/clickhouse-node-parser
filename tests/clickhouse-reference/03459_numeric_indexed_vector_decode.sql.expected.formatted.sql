CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;

CREATE TABLE numeric_indexed_vector
(
    ds Date,
    vector AggregateFunction(groupNumericIndexedVector, UInt32, Float64)
)
ENGINE = MergeTree()
ORDER BY ds;