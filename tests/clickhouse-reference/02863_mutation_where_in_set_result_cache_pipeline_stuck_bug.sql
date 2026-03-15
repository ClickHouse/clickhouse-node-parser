create table tab (x UInt32, y UInt32) engine = MergeTree order by x;
set mutations_sync=2;
