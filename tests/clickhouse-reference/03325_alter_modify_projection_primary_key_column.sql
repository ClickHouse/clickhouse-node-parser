create table test (x UInt16, y UInt16, projection proj (select * order by x)) engine=MergeTree order by tuple() settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1;
insert into test select number, number from numbers(100000);
select * from test where x = 10;
create table test (x UInt16, y UInt16, projection proj (select * order by x)) engine=MergeTree order by tuple() settings min_rows_for_wide_part=1000000000, min_bytes_for_wide_part=10000000000;
