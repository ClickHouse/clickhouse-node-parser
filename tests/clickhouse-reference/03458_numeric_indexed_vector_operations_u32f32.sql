DROP TABLE IF EXISTS uin_value_details;
CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value Float32
)
ENGINE = MergeTree()
ORDER BY ds;
INSERT INTO uin_value_details (ds, uin, value) values ('2023-12-26', 10000001, 7.3), ('2023-12-26', 10000002, 8.3), ('2023-12-26', 10000003, 0), ('2023-12-26', 10000004, 0), ('2023-12-26', 20000005, 0), ('2023-12-26', 30000005, 100.6543782), ('2023-12-26', 50000005, 0);
INSERT INTO uin_value_details (ds, uin, value) values ('2023-12-27', 10000001, 7.3), ('2023-12-27', 10000002, -8.3), ('2023-12-27', 10000003, 30.5), ('2023-12-27', 10000004, -3.384), ('2023-12-27', 20000005, 0), ('2023-12-27', 40000005, 100.66666666), ('2023-12-27', 60000005, 0);
