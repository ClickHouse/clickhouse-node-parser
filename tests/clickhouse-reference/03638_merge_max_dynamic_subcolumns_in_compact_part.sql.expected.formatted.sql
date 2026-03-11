SELECT
    JSONDynamicPaths(json),
    JSONSharedDataPaths(json)
FROM test;

SELECT
    JSONDynamicPaths(json),
    JSONSharedDataPaths(json)
FROM test
LIMIT 1;