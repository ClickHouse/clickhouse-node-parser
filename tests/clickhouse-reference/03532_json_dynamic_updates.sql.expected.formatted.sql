SELECT DISTINCT arrayJoin(JSONDynamicPaths(json))
FROM test_updates
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(json))
FROM test_updates
ORDER BY `all` ASC;

SELECT
    dynamicType(json.a),
    isDynamicElementInSharedData(json.a),
    count()
FROM test_updates
GROUP BY ALL
ORDER BY `all` ASC;

SELECT
    dynamicType(dynamic),
    isDynamicElementInSharedData(dynamic),
    count()
FROM test_updates
GROUP BY ALL
ORDER BY `all` ASC;

SELECT
    json,
    json.a,
    dynamic
FROM test_updates
WHERE id IN (49999, 50000)
ORDER BY id ASC;

SELECT
    json,
    dynamic
FROM test_updates
FORMAT Null;