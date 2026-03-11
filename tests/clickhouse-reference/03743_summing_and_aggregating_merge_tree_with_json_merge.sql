select distinct arrayJoin(JSONDynamicPaths(json)) from test;
select distinct arrayJoin(JSONSharedDataPaths(json)) from test;
