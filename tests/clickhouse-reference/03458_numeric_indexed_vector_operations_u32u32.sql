CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value UInt32
)
ENGINE = MergeTree()
ORDER BY ds;
