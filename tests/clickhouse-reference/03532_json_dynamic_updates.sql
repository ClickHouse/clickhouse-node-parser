select distinct arrayJoin(JSONDynamicPaths(json)) from test_updates order by all;
select distinct arrayJoin(JSONSharedDataPaths(json)) from test_updates order by all;
select dynamicType(json.a), isDynamicElementInSharedData(json.a), count() from test_updates group by all order by all;
select dynamicType(dynamic), isDynamicElementInSharedData(dynamic), count() from test_updates group by all order by all;
select json, json.a, dynamic from test_updates where id in (49999, 50000) order by id;
select json, dynamic from test_updates format Null;
