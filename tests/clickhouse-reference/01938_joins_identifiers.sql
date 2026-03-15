create table "/t0" (a Int64, b Int64) engine = MergeTree() partition by a order by a;
create table "/t1" (a Int64, b Int64) engine = MergeTree() partition by a order by a;
select * from "/t0" join "/t1" using a;
