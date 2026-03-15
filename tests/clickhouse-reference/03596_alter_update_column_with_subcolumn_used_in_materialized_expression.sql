create table test (t Tuple(a UInt32), a UInt32 materialized t.a) engine=MergeTree() order by tuple();
select t, a from test;
create table test (t Tuple(a UInt32), a UInt32 materialized t.a + 42) engine=MergeTree() order by tuple();
create table test (t Tuple(a UInt32), a UInt32 materialized t.a) engine=MergeTree() order by a;
create table test (json JSON, a UInt32 materialized json.a::UInt32) engine=MergeTree() order by tuple();
select json, a from test;
create table test (json JSON, a UInt32 materialized json.a::UInt32 + 42) engine=MergeTree() order by tuple();
create table test (json JSON, a UInt32 materialized json.a::UInt32) engine=MergeTree() order by a;
