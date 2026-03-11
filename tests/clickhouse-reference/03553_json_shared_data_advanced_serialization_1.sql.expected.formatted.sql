SELECT json
FROM test_compact_without_substreams_advanced;

SELECT json
FROM test_compact_advanced;

SELECT json.b
FROM test_compact_advanced;

SELECT
    json.b,
    json.c
FROM test_compact_advanced;

SELECT json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr2
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr2,
    json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr4
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr4,
    json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr99
FROM test_compact_advanced;

SELECT
    json.arr,
    json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr1,
    json.arr
FROM test_compact_advanced;

SELECT
    json,
    json.b,
    json.c
FROM test_compact_advanced;

SELECT
    json.b,
    json.c,
    json
FROM test_compact_advanced;

SELECT
    json,
    json.b,
    json.c,
    json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.b,
    json.c,
    json.`arr[]`.arr1,
    json
FROM test_compact_advanced;

SELECT
    json,
    json.b,
    json.c,
    json.arr,
    json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.b,
    json.c,
    json.`arr[]`.arr1,
    json.arr,
    json
FROM test_compact_advanced;

SELECT json.`^a`
FROM test_compact_advanced;

SELECT
    json,
    json.`^a`
FROM test_compact_advanced;

SELECT
    json.`^a`,
    json.a.a1
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.`^a`
FROM test_compact_advanced;

SELECT
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`
FROM test_compact_advanced;

SELECT
    json,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`,
    json
FROM test_compact_advanced;

SELECT
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`
FROM test_compact_advanced;

SELECT
    json,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json
FROM test_compact_advanced;

SELECT
    json.`arr[]`.arr1,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json.`arr[]`.arr1
FROM test_compact_advanced;

SELECT
    json,
    json.`arr[]`.arr1,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json.`arr[]`.arr1,
    json
FROM test_compact_advanced;

SELECT json.data
FROM test_compact_advanced_tuple;

SELECT
    json.data,
    json.data.b
FROM test_compact_advanced_tuple;

SELECT
    json.data.b,
    json.data
FROM test_compact_advanced_tuple;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_compact_advanced_tuple;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_compact_advanced_tuple;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_compact_advanced_tuple;

SELECT
    json.data,
    json.data.`^a`
FROM test_compact_advanced_tuple;

SELECT
    json.data.`^a`,
    json.data
FROM test_compact_advanced_tuple;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_compact_advanced_tuple;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_compact_advanced_tuple;