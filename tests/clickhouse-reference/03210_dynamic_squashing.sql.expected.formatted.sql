SELECT DISTINCT
    dynamicType(d) AS type,
    isDynamicElementInSharedData(d) AS flag
FROM test
ORDER BY type ASC;