SELECT json
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT json.b
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr2
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr2,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr4
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr4,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr99
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr99,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.arr,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr1,
    json.arr
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.b,
    json.c,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json.`arr[]`.arr1,
    json
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.b,
    json.c,
    json.arr,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json.`arr[]`.arr1,
    json.arr,
    json
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT json.`^a`
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.`^a`
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`,
    json
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.`arr[]`.arr1,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json.`arr[]`.arr1
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json,
    json.`arr[]`.arr1,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_wide_advanced
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json.`arr[]`.arr1,
    json
FROM test_wide_advanced
SETTINGS max_block_size = 3;