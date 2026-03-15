create table tab (x UInt32) engine = MergeTree order by tuple();
set alter_sync = 0;
select x, y from tab order by x;
