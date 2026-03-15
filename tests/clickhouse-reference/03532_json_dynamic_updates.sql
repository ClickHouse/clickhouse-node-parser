-- Tags: long

set mutations_sync=1;
create table test_updates (id UInt64, json JSON, dynamic Dynamic) engine=MergeTree order by tuple() settings min_rows_for_wide_part=10000000, min_bytes_for_wide_part=1000000000, index_granularity = 8192, index_granularity_bytes = '10Mi';
select distinct arrayJoin(JSONDynamicPaths(json)) from test_updates order by all;
select distinct arrayJoin(JSONSharedDataPaths(json)) from test_updates order by all;
select dynamicType(json.a), isDynamicElementInSharedData(json.a), count() from test_updates group by all order by all;
select dynamicType(dynamic), isDynamicElementInSharedData(dynamic), count() from test_updates group by all order by all;
select json, json.a, dynamic from test_updates where id in (49999, 50000) order by id;
select json, dynamic from test_updates format Null;
create table test_updates (id UInt64, json JSON, dynamic Dynamic) engine=MergeTree order by tuple() settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1, index_granularity = 8192, index_granularity_bytes = '10Mi';
