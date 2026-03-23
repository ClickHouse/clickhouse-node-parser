create table src (x UInt64) engine=MergeTree order by tuple();
insert into src select 0 from numbers(1000000);
create table dst (x UInt64) engine=CoalescingMergeTree order by tuple();
insert into dst select * from src;
create table dst (x UInt64) engine=SummingMergeTree order by tuple();
