CREATE TABLE mutation_table
(
    id int,
    price Nullable(Int32)
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY id;

INSERT INTO mutation_table (id, price);

SELECT *
FROM mutation_table;

CREATE TABLE mutation_table
(
    dt Nullable(Date),
    name Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO mutation_table (name, dt);

INSERT INTO mutation_table (name, dt);

SELECT *
FROM mutation_table
ORDER BY
    dt ASC,
    name ASC;

INSERT INTO mutation_table (name, dt);

INSERT INTO mutation_table (name, dt);

INSERT INTO mutation_table (name, dt);