SET mutations_sync = 2;

CREATE TABLE t_block_number_mut
(
    n int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS enable_block_number_column = 1, min_bytes_for_wide_part = 0;

SELECT *
FROM t_block_number_mut;

CREATE TABLE t_block_number_mut
(
    n int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS enable_block_number_column = 1, min_bytes_for_wide_part = '1G';