SELECT DISTINCT
    dynamicType(json.b) AS type,
    isDynamicElementInSharedData(json.b)
FROM test
ORDER BY type ASC;