create table test_array_joins
(
    id UInt64 default rowNumberInAllBlocks() + 1,
    arr_1 Array(String),
    arr_2 Array(String),
    arr_3 Array(String),
    arr_4 Array(String)
) engine = MergeTree order by id;
create view v4test_array_joins as SELECT * from test_array_joins where id != 10;
select * from v4test_array_joins array join columns('^arr') where match(arr_4,'a') and id < 100 order by id format Null settings optimize_read_in_order = 0;
