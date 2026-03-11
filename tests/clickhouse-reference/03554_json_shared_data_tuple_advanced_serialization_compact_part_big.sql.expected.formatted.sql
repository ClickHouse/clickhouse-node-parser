SELECT json.data
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data.`^a`,
    json.data
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_compact_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_compact_advanced_tuple
FORMAT Null;