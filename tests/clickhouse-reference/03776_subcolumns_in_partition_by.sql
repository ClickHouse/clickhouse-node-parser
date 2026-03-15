-- Tags: no-parallel-replicas
-- Tag no-parallel-replicas: result of explain is different

set enable_analyzer=1;
create table test (json JSON(d Date)) engine=MergeTree order by tuple() partition by json.d;
select * from test order by json.d;
create table test (c0 Array(Nullable(Int)), c1 Int, c2 Int) ENGINE = MergeTree() partition by (c0.null) order by (c1);
select * from test order by all;
