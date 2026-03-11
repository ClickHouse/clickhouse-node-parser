SELECT DISTINCT arrayJoin(JSONDynamicPaths(assumeNotNull(json)))
FROM test;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(assumeNotNull(json)))
FROM test;