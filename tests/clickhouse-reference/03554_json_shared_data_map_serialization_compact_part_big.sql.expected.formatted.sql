SELECT json
FROM test_compact_map
FORMAT Null;

SELECT json.b
FROM test_compact_map
FORMAT Null;

SELECT
    json.b,
    json.c
FROM test_compact_map
FORMAT Null;

SELECT
    json,
    json.b,
    json.c
FROM test_compact_map
FORMAT Null;

SELECT
    json.b,
    json.c,
    json
FROM test_compact_map
FORMAT Null;

SELECT json.`^a`
FROM test_compact_map
FORMAT Null;

SELECT
    json,
    json.`^a`
FROM test_compact_map
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1
FROM test_compact_map
FORMAT Null;

SELECT
    json.a.a1,
    json.`^a`
FROM test_compact_map
FORMAT Null;

SELECT json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.`^a`,
    json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_compact_map_tuple
FORMAT Null;