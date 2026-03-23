drop table if exists tab;
create table tab (x UInt32, y UInt32) engine = MergeTree order by x;
insert into tab select number, number from numbers(10);
insert into tab select number, number from numbers(20);
set mutations_sync=2;
