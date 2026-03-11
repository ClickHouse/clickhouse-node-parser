select distinct arrayJoin(JSONDynamicPaths(t.json)) from test;
select distinct arrayJoin(JSONSharedDataPaths(t.json)) from test;
