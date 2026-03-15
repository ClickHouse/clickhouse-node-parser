CREATE TABLE mutation_table
(
    id int,
    price Nullable(Int32)
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY id;

SELECT *
FROM mutation_table;

CREATE TABLE mutation_table
(
    dt Nullable(Date),
    name Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM mutation_table
ORDER BY
    dt ASC,
    name ASC;