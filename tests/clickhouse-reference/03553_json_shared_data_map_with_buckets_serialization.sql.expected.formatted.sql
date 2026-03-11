SELECT json
FROM test_compact_map_with_buckets;

SELECT json.b
FROM test_compact_map_with_buckets;

SELECT json.arr
FROM test_compact_map_with_buckets;

SELECT
    json.b,
    json.c
FROM test_compact_map_with_buckets;

SELECT
    json.b,
    json.c,
    json.arr
FROM test_compact_map_with_buckets;

SELECT
    json,
    json.b,
    json.c
FROM test_compact_map_with_buckets;

SELECT
    json,
    json.b,
    json.c,
    json.arr
FROM test_compact_map_with_buckets;

SELECT
    json.b,
    json.c,
    json
FROM test_compact_map_with_buckets;

SELECT
    json.b,
    json.c,
    json.arr,
    json
FROM test_compact_map_with_buckets;

SELECT json.`^a`
FROM test_compact_map_with_buckets;

SELECT
    json,
    json.`^a`
FROM test_compact_map_with_buckets;

SELECT
    json.`^a`,
    json.a.a1
FROM test_compact_map_with_buckets;

SELECT
    json.a.a1,
    json.`^a`
FROM test_compact_map_with_buckets;

SELECT
    json.`^a`,
    json.a.a1,
    json.arr
FROM test_compact_map_with_buckets;

SELECT
    json.a.a1,
    json.arr,
    json.`^a`
FROM test_compact_map_with_buckets;

SELECT json.data
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.b
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.`^a`
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data.`^a`,
    json.data
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_compact_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_compact_map_with_buckets_tuple;

SELECT json
FROM test_wide_map_with_buckets;

SELECT json.b
FROM test_wide_map_with_buckets;

SELECT json.arr
FROM test_wide_map_with_buckets;

SELECT
    json.b,
    json.c
FROM test_wide_map_with_buckets;

SELECT
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map_with_buckets;

SELECT
    json,
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map_with_buckets;

SELECT
    json.b,
    json.c,
    json.arr,
    json
FROM test_wide_map_with_buckets;

SELECT json.`^a`
FROM test_wide_map_with_buckets;

SELECT
    json,
    json.`^a`
FROM test_wide_map_with_buckets;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map_with_buckets;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map_with_buckets;

SELECT
    json.`^a`,
    json.a.a1,
    json.arr
FROM test_wide_map_with_buckets;

SELECT
    json.a.a1,
    json.arr,
    json.`^a`
FROM test_wide_map_with_buckets;

SELECT json
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT json.b
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT json.arr
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.b,
    json.c
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json,
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.b,
    json.c,
    json.arr,
    json
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT json.`^a`
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json,
    json.`^a`
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT
    json.`^a`,
    json.a.a1,
    json.arr
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT 'select json.a.a1, json.arr, json.^a'
LIMIT 3;

SELECT
    json.a.a1,
    json.arr,
    json.`^a`
FROM test_wide_map_with_buckets
LIMIT 3;

SELECT json
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT json.b
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT json.arr
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json,
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.b,
    json.c,
    json.arr,
    json
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT json.`^a`
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json,
    json.`^a`
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.`^a`,
    json.a.a1,
    json.arr
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT
    json.a.a1,
    json.arr,
    json.`^a`
FROM test_wide_map_with_buckets
SETTINGS max_block_size = 3;

SELECT json.data
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.b
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_map_with_buckets_tuple;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_map_with_buckets_tuple;

SELECT json.data
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.b
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_map_with_buckets_tuple
LIMIT 3;

SELECT json.data
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.b
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_map_with_buckets_tuple
SETTINGS max_block_size = 3;