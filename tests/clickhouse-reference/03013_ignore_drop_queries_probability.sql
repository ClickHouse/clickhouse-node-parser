-- Tags: memory-engine
create table test_memory (number UInt64) engine=Memory;
select * from test_memory;
create table test_merge_tree (number UInt64) engine=MergeTree order by number;
select * from test_merge_tree;
create table test_join (number UInt64) engine=Join(ALL, LEFT, number);
select * from test_join;
