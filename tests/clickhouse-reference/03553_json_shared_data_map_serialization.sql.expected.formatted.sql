SELECT json
FROM test_compact_map;

SELECT json.b
FROM test_compact_map;

SELECT
    json.b,
    json.c
FROM test_compact_map;

SELECT
    json,
    json.b,
    json.c
FROM test_compact_map;

SELECT
    json.b,
    json.c,
    json
FROM test_compact_map;

SELECT json.`^a`
FROM test_compact_map;

SELECT
    json,
    json.`^a`
FROM test_compact_map;

SELECT
    json.`^a`,
    json.a.a1
FROM test_compact_map;

SELECT
    json.a.a1,
    json.`^a`
FROM test_compact_map;

SELECT json.data
FROM test_compact_map_tuple;

SELECT
    json.data,
    json.data.b
FROM test_compact_map_tuple;

SELECT
    json.data.b,
    json.data
FROM test_compact_map_tuple;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_compact_map_tuple;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_compact_map_tuple;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_compact_map_tuple;

SELECT
    json.data,
    json.data.`^a`
FROM test_compact_map_tuple;

SELECT
    json.data.`^a`,
    json.data
FROM test_compact_map_tuple;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_compact_map_tuple;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_compact_map_tuple;

SELECT json
FROM test_wide_map;

SELECT json.b
FROM test_wide_map;

SELECT
    json.b,
    json.c
FROM test_wide_map;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map;

SELECT json.`^a`
FROM test_wide_map;

SELECT
    json,
    json.`^a`
FROM test_wide_map;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map;

SELECT json
FROM test_wide_map
LIMIT 3;

SELECT json.b
FROM test_wide_map
LIMIT 3;

SELECT
    json.b,
    json.c
FROM test_wide_map
LIMIT 3;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map
LIMIT 3;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map
LIMIT 3;

SELECT json.`^a`
FROM test_wide_map
LIMIT 3;

SELECT
    json,
    json.`^a`
FROM test_wide_map
LIMIT 3;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map
LIMIT 3;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map
LIMIT 3;

SELECT json
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT json.b
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT json.`^a`
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT
    json,
    json.`^a`
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map
SETTINGS max_block_size = 3;

SELECT json.data
FROM test_wide_map_tuple;

SELECT
    json.data,
    json.data.b
FROM test_wide_map_tuple;

SELECT
    json.data.b,
    json.data
FROM test_wide_map_tuple;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_map_tuple;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_map_tuple;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_map_tuple;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_map_tuple;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_map_tuple;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_map_tuple;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_map_tuple;

SELECT json.data
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.b
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_map_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_map_tuple
LIMIT 3;

SELECT json.data
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.b
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_map_tuple
SETTINGS max_block_size = 3;