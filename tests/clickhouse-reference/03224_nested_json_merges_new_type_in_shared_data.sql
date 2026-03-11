select distinct dynamicType(json.a) as type, isDynamicElementInSharedData(json.a) from test order by type;
select distinct JSONSharedDataPaths(arrayJoin(json.a[])) as path from test order by path;
select distinct JSONDynamicPaths(arrayJoin(json.a[])) as path from test order by path;
select distinct dynamicType(arrayJoin(json.a[].c)) as type, isDynamicElementInSharedData(arrayJoin(json.a[].c)) from test order by type;
select distinct dynamicType(arrayJoin(json.a[].d)) as type, isDynamicElementInSharedData(arrayJoin(json.a[].d)) from test order by type;
