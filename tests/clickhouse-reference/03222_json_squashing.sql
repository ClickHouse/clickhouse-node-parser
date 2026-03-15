-- Tags: long

SET enable_json_type = 1;
set max_block_size = 1000;
create table test (json JSON) engine=MergeTree order by tuple();
select distinct arrayJoin(JSONAllPaths(json)) as path from test order by path;
select distinct arrayJoin(JSONDynamicPaths(json)) as path from test order by path;
select distinct arrayJoin(JSONSharedDataPaths(json)) as path from test order by path;
create table test (json JSON(max_dynamic_paths=2)) engine=MergeTree order by tuple();
create table test (json JSON(max_dynamic_paths=8)) engine=MergeTree order by tuple();
select distinct arrayJoin(JSONAllPaths(arrayJoin(json.a[]))) as path from test order by path;
select distinct arrayJoin(JSONDynamicPaths(arrayJoin(json.a[]))) as path from test order by path;
select distinct arrayJoin(JSONSharedDataPaths(arrayJoin(json.a[]))) as path from test order by path;
