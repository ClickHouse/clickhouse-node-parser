SET any_join_distinct_right_table_keys = 1;

SET enable_optimize_predicate_expression = 0;

CREATE TABLE testJoinTable
(
    number UInt64,
    data String
)
ENGINE = Join(`ANY`, `INNER`, number)
SETTINGS any_join_distinct_right_table_keys = 1;

INSERT INTO testJoinTable;

SELECT *
FROM
    (
        SELECT *
        FROM numbers(10)
    ) AS js1
INNER JOIN testJoinTable
    USING (number); -- { serverError INCOMPATIBLE_TYPE_OF_JOIN }

SELECT *
FROM
    (
        SELECT *
        FROM numbers(10)
    ) AS js1
INNER JOIN (
        SELECT *
        FROM testJoinTable
    ) AS js2
    USING (number)
ORDER BY number ASC;

SELECT *
FROM
    (
        SELECT *
        FROM numbers(10)
    ) AS js1
INNER JOIN testJoinTable
    USING (number)
ORDER BY number ASC;

SELECT *
FROM testJoinTable
ORDER BY number ASC;

CREATE TABLE transaction
(
    id Int32,
    value Float64,
    master_id Int32
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE master
(
    id Int32,
    name String
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS any_join_distinct_right_table_keys = 1;

INSERT INTO master;

INSERT INTO transaction;

SELECT
    tx.id,
    tx.value,
    m.name
FROM
    transaction AS tx
LEFT JOIN master AS m
    ON m.id = tx.master_id
ORDER BY tx.id ASC;

CREATE TABLE tbl
(
    eventDate Date,
    id String
)
ENGINE = MergeTree()
ORDER BY eventDate
PARTITION BY tuple();

CREATE TABLE some_join
(
    id String,
    value String
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS any_join_distinct_right_table_keys = 1;

SELECT *
FROM
    tbl AS t
LEFT JOIN some_join
    USING (id)
ORDER BY id ASC;

SELECT *
FROM
    tbl AS t
LEFT JOIN some_join AS d
    USING (id)
ORDER BY id ASC;