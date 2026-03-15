CREATE TABLE partial_sort_opt_bug
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1000;

SELECT x
FROM partial_sort_opt_bug
ORDER BY x ASC
LIMIT 2000
SETTINGS max_block_size = 4000;