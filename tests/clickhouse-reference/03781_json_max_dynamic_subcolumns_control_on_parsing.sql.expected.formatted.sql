SELECT DISTINCT (arrayJoin(JSONDynamicPaths(json))) AS path
FROM test
ORDER BY path ASC;