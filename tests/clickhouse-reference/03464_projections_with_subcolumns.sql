-- Tags: long

set enable_analyzer=1;
set mutations_sync=1;
set parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;
create table test (
    a UInt32,
    json JSON(a UInt32),
    t Tuple(a UInt32, b UInt32),
    projection p1 (select json order by json.a),
    projection p2 (select t order by t.a),
    projection p3 (select json order by json.c[].d.:Int64),
) engine=MergeTree order by tuple() settings index_granularity=1;
select trimLeft(*) from (explain indexes=1 select json from test where json.a = 1) where explain like '%ReadFromMergeTree%';
select json from test where json.a = 1;
select trimLeft(*) from (explain indexes=1 select t from test where t.a = 1) where explain like '%ReadFromMergeTree%';
select t from test where t.a = 1;
select trimLeft(*) from (explain indexes=1 select json from test where json.c[].d.:Int64 = [1]) where explain like '%ReadFromMergeTree%';
select json from test where json.c[].d.:Int64 = [1];
select '------------------------------------------------------------------';
create table test (
    a UInt32,
    json JSON(a UInt32),
    t Tuple(a UInt32, b UInt32),
) engine=MergeTree order by tuple() settings index_granularity=1;
