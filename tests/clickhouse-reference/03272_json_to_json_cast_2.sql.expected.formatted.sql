SELECT
    json::JSON(max_dynamic_paths=3) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT
    json::JSON(max_dynamic_paths=2) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT
    json::JSON(max_dynamic_paths=1) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT
    json::JSON(max_dynamic_paths=0) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=3) AS json2
        FROM test
    )
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=2) AS json2
        FROM test
    )
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=1) AS json2
        FROM test
    )
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=0) AS json2
        FROM test
    )
ORDER BY `all` ASC;