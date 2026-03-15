CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value Int32
)
ENGINE = MergeTree()
ORDER BY ds;