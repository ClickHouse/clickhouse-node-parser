CREATE TABLE uin_value_details_int32_int8
(
    ds Date,
    uin UInt32,
    value Int8
)
ENGINE = MergeTree()
ORDER BY ds;

CREATE TABLE uin_value_details_int32_int64
(
    ds Date,
    uin UInt32,
    value Int64
)
ENGINE = MergeTree()
ORDER BY ds;

CREATE TABLE uin_value_details_int32_float64
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;