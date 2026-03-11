select distinct arrayJoin(JSONAllPaths(json)) as path from test order by path;
select distinct arrayJoin(JSONDynamicPaths(json)) as path from test order by path;
select distinct arrayJoin(JSONSharedDataPaths(json)) as path from test order by path;
select distinct arrayJoin(JSONAllPaths(arrayJoin(json.a[]))) as path from test order by path;
select distinct arrayJoin(JSONDynamicPaths(arrayJoin(json.a[]))) as path from test order by path;
select distinct arrayJoin(JSONSharedDataPaths(arrayJoin(json.a[]))) as path from test order by path;
