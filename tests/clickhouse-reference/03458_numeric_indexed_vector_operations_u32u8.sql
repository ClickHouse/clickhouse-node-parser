CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value UInt8
)
ENGINE = MergeTree()
ORDER BY ds;
