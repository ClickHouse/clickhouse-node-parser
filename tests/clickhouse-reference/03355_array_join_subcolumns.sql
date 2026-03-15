-- Tags: no-parallel-replicas

set enable_analyzer=1;
create table test (arr Array(UInt64), t Tuple(a Array(UInt32), b Array(UInt32))) engine=Memory;
select t.a from test array join arr;
select t.a from test array join t.b;
