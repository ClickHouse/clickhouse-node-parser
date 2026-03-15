CREATE TABLE mt_compact
(
    d Date,
    id UInt32,
    s String
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY d
SETTINGS min_bytes_for_wide_part = 10000000, index_granularity = 128;

SELECT sum(s)
FROM mt_compact;