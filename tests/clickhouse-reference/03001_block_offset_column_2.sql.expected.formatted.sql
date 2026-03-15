CREATE TABLE t_block_offset
(
    id UInt32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 3, enable_block_number_column = 0, enable_block_offset_column = 0;

SELECT
    _part,
    _block_number,
    _block_offset,
    _part_offset,
    id
FROM t_block_offset
ORDER BY
    _block_number ASC,
    _block_offset ASC;