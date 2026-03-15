create table tab (x UInt64) engine = MergeTree order by tuple();
select * from tab order by x;
