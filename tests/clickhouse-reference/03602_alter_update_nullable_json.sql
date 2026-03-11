select distinct arrayJoin(JSONDynamicPaths(assumeNotNull(json))) from test;
select distinct arrayJoin(JSONSharedDataPaths(assumeNotNull(json))) from test;
