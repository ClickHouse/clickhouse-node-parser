-- Tags: memory-engine
create table test_memory (number UInt64) engine=Memory;
insert into test_memory select 42;
select * from test_memory;
create table test_merge_tree (number UInt64) engine=MergeTree order by number;
insert into test_merge_tree select 42;
select * from test_merge_tree;
create table test_join (number UInt64) engine=Join(ALL, LEFT, number);
insert into test_join select 42;
select * from test_join;
