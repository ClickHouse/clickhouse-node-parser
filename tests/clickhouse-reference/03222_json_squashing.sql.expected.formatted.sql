SELECT DISTINCT arrayJoin(JSONAllPaths(json)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONDynamicPaths(json)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(json)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(arrayJoin(json.`a[]`))) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONDynamicPaths(arrayJoin(json.`a[]`))) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(arrayJoin(json.`a[]`))) AS path
FROM test
ORDER BY path ASC;