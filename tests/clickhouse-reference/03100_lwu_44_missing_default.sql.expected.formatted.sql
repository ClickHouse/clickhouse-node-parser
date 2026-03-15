CREATE TABLE t_lwu_defaults
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x
SETTINGS enable_block_offset_column = 1, enable_block_number_column = 1;

CREATE TABLE t_mutation_defaults
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x;

SELECT
    intDiv(z, 100) AS a,
    COUNT() AS b
FROM t_lwu_defaults
GROUP BY a
ORDER BY a ASC
LIMIT 10;

SELECT
    intDiv(z, 100) AS a,
    COUNT() AS b
FROM t_mutation_defaults
GROUP BY a
ORDER BY a ASC
LIMIT 10;