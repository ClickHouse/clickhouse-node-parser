SELECT JSONAllPaths(arrayJoin(json.`a[]`))
FROM test;

SELECT JSONDynamicPaths(arrayJoin(json.`a[]`))
FROM test;

SELECT JSONSharedDataPaths(arrayJoin(json.`a[]`))
FROM test;