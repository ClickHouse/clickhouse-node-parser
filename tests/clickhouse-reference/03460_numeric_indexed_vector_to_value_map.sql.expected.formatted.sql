CREATE TABLE uin_value_details_int32_int8
(
    ds Date,
    uin UInt32,
    value Int8
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details_int32_int8 (ds, uin, value);

INSERT INTO uin_value_details_int32_int8 (ds, uin, value);

CREATE TABLE uin_value_details_int32_int64
(
    ds Date,
    uin UInt32,
    value Int64
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details_int32_int64 (ds, uin, value);

INSERT INTO uin_value_details_int32_int64 (ds, uin, value);

CREATE TABLE uin_value_details_int32_float64
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details_int32_float64 (ds, uin, value);

INSERT INTO uin_value_details_int32_float64 (ds, uin, value);