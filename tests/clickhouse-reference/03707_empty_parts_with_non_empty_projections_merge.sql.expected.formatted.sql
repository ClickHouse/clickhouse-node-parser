CREATE TABLE mt1
(
    time DateTime,
    PROJECTION proj (    SELECT min(time))
)
ENGINE = MergeTree
ORDER BY tuple()
TTL time + toIntervalSecond(1)
SETTINGS remove_empty_parts = 0, merge_with_ttl_timeout = 0, deduplicate_merge_projection_mode = 'ignore';

INSERT INTO mt1 SELECT number
FROM numbers(4)
SETTINGS
    max_block_size = 1,
    min_insert_block_size_bytes = 1;