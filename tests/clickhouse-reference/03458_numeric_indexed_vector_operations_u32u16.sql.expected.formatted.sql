CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value UInt16
)
ENGINE = MergeTree()
ORDER BY ds;