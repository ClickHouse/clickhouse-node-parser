create table a (x UInt64) engine MergeTree order by x;
select * from a where -x = -42;
create table a (x UInt128) engine MergeTree order by x;
create table a (x UInt256) engine MergeTree order by x;
