select JSONAllPaths(arrayJoin(json.a[])) from test;
select JSONDynamicPaths(arrayJoin(json.a[])) from test;
select JSONSharedDataPaths(arrayJoin(json.a[])) from test;
