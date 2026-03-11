SELECT json
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT json.b
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json,
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c,
    json.arr,
    json
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json,
    json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1,
    json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.a.a1,
    json.arr,
    json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;