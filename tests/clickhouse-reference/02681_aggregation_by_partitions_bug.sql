-- Tags: no-random-merge-tree-settings

set max_threads = 16;
create table t(a UInt32) engine=MergeTree order by tuple() partition by a % 16;
set allow_aggregate_partitions_independently=1, force_aggregate_partitions_independently=1;
select count(distinct a) from t;
