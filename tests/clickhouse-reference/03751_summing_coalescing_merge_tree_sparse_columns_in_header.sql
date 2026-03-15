create table src (x UInt64) engine=MergeTree order by tuple();
create table dst (x UInt64) engine=CoalescingMergeTree order by tuple();
create table dst (x UInt64) engine=SummingMergeTree order by tuple();
