CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;
insert into uin_value_details (ds, uin, value) select '2023-12-20', number, number * number from numbers(1000);
insert into uin_value_details (ds, uin, value) select '2023-12-21', number, number from numbers(1000);
insert into uin_value_details (ds, uin, value) select '2023-12-22', number, number * number from numbers(5000);
insert into uin_value_details (ds, uin, value) select '2023-12-23', number, number from numbers(5000);
insert into uin_value_details (ds, uin, value) select '2023-12-26', number, number * number from numbers(30000);
insert into uin_value_details (ds, uin, value) select '2023-12-27', number, number from numbers(30000);
insert into uin_value_details (ds, uin, value) select '2023-12-28', number * 3, number * 3 * number * 3 from numbers(30000);
insert into uin_value_details (ds, uin, value) select '2023-12-29', number * 3, number * 3 from numbers(30000);
CREATE TABLE numeric_indexed_vector
(
    ds Date,
    vector AggregateFunction(groupNumericIndexedVector, UInt32, Float64)
)
ENGINE = MergeTree()
ORDER BY ds;
insert into numeric_indexed_vector (ds) values ('2023-12-26');
