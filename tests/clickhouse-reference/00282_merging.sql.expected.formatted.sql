SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE IF NOT EXISTS merge
(
    d Date DEFAULT '2000-01-01',
    x UInt64
)
ENGINE = MergeTree(d, x, 5);

SELECT *
FROM merge
ORDER BY
    _part_index ASC,
    x ASC;

CREATE TABLE IF NOT EXISTS merge
(
    d Date DEFAULT '2000-01-01',
    x UInt64
)
ENGINE = MergeTree(d, x, 8192);

SET min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;

SET max_block_size = 8200;

SELECT
    count(),
    uniqExact(x),
    min(x),
    max(x),
    sum(x),
    sum(cityHash64(x))
FROM merge;

SET max_block_size = 10000;