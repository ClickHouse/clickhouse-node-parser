SELECT
    d1,
    dynamicType(d1),
    isDynamicElementInSharedData(d1)
FROM test
ORDER BY d1 ASC;

SELECT
    d1,
    dynamicType(d1),
    isDynamicElementInSharedData(d1)
FROM test
ORDER BY d1 ASC;

SELECT
    d2,
    dynamicType(d2),
    isDynamicElementInSharedData(d2)
FROM test
ORDER BY d2 ASC;

SELECT
    d2,
    dynamicType(d2),
    isDynamicElementInSharedData(d2)
FROM test
ORDER BY d2 ASC;

SELECT
    d1,
    d2,
    dynamicType(d1),
    isDynamicElementInSharedData(d1),
    dynamicType(d2),
    isDynamicElementInSharedData(d2)
FROM test
ORDER BY
    d1 ASC,
    d2 ASC;

SELECT
    d1,
    d2,
    dynamicType(d1),
    isDynamicElementInSharedData(d1),
    dynamicType(d2),
    isDynamicElementInSharedData(d2)
FROM test
ORDER BY
    d1 ASC,
    d2 ASC;

SELECT
    d1,
    d2,
    dynamicType(d1),
    isDynamicElementInSharedData(d1),
    dynamicType(d2),
    isDynamicElementInSharedData(d2)
FROM test
ORDER BY
    d2 ASC,
    d1 ASC;

SELECT
    d1,
    d2,
    dynamicType(d1),
    isDynamicElementInSharedData(d1),
    dynamicType(d2),
    isDynamicElementInSharedData(d2)
FROM test
ORDER BY
    d2 ASC,
    d1 ASC;