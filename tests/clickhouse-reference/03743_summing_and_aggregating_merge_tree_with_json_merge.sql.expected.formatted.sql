SELECT DISTINCT arrayJoin(JSONDynamicPaths(json))
FROM test;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(json))
FROM test;