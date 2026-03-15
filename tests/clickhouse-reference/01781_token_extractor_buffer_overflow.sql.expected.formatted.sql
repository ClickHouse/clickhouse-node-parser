SET max_block_size = 10, min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0, max_threads = 20;

CREATE TABLE bloom_filter
(
    id UInt64,
    s String,
    INDEX tok_bf tuple(s, lower(s)) TYPE tokenbf_v1(512, 3, 0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8, index_granularity_bytes = '10Mi';

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'abc');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'abcabcabcabcabcabcabcab\0');