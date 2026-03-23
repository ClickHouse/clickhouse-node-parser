drop table if exists test;
create table test (id UInt32, t Tuple(a UInt32)) engine=MergeTree order by t.a;
insert into test select 1, tuple(1);
drop table test;
create table test (id UInt32, json JSON) engine=MergeTree order by json.a::Int64;
insert into test select 1, '{"a" : 42}';
