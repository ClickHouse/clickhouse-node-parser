set enable_analyzer=1;
create table test (a Array(UInt64)) engine=MergeTree order by tuple();
select * from test;
