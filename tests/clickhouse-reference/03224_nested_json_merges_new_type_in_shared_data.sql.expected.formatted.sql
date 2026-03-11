SELECT DISTINCT
    dynamicType(json.a) AS type,
    isDynamicElementInSharedData(json.a)
FROM test
ORDER BY type ASC;

SELECT DISTINCT JSONSharedDataPaths(arrayJoin(json.`a[]`)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT JSONDynamicPaths(arrayJoin(json.`a[]`)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT
    dynamicType(arrayJoin(json.`a[]`.c)) AS type,
    isDynamicElementInSharedData(arrayJoin(json.`a[]`.c))
FROM test
ORDER BY type ASC;

SELECT DISTINCT
    dynamicType(arrayJoin(json.`a[]`.d)) AS type,
    isDynamicElementInSharedData(arrayJoin(json.`a[]`.d))
FROM test
ORDER BY type ASC;