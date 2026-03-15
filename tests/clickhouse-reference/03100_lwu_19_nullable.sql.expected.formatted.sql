SET enable_lightweight_update = 1;

CREATE TABLE mutation_table
(
    id int,
    price Nullable(Int32)
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SELECT *
FROM mutation_table;

CREATE TABLE mutation_table
(
    dt Nullable(Date),
    name Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SELECT *
FROM mutation_table
ORDER BY
    dt ASC,
    name ASC;