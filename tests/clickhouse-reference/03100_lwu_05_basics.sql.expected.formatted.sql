SET enable_lightweight_update = 1;

CREATE TABLE t_lightweight
(
    d Date,
    e Enum8('foo' = 1, 'bar' = 2)
)
ENGINE = MergeTree
ORDER BY d
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SELECT e
FROM t_lightweight
ORDER BY d ASC;

SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_lightweight'
ORDER BY name ASC;