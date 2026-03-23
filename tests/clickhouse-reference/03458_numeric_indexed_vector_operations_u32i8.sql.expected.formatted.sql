CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value Int8
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details (ds, uin, value);

INSERT INTO uin_value_details (ds, uin, value);