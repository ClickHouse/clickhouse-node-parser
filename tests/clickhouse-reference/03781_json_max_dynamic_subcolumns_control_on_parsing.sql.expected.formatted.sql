CREATE TABLE test
(
    json JSON
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT DISTINCT (arrayJoin(JSONDynamicPaths(json))) AS path
FROM test
ORDER BY path ASC;