create table tab (x UInt32) engine = MergeTree order by tuple();
insert into tab select number from numbers(10);
set alter_sync = 0;
select x, y from tab order by x;
