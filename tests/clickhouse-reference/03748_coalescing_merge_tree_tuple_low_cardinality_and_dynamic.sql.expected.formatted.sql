SELECT DISTINCT arrayJoin(JSONDynamicPaths(t.json))
FROM test;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(t.json))
FROM test;