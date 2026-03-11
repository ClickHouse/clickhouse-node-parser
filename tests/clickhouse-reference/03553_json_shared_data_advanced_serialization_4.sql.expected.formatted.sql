SELECT json.data
FROM test_wide_advanced_tuple;

SELECT
    json.data,
    json.data.b
FROM test_wide_advanced_tuple;

SELECT
    json.data.b,
    json.data
FROM test_wide_advanced_tuple;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_advanced_tuple;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_advanced_tuple;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_advanced_tuple;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_advanced_tuple;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_advanced_tuple;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple;

SELECT json.data
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.b
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple
LIMIT 3;

SELECT json.data
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.b
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple
SETTINGS max_block_size = 3;