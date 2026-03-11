select distinct(arrayJoin(JSONDynamicPaths(json))) as path from test order by path;
