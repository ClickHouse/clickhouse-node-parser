CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt8,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;