CREATE DATABASE test_01383;

CREATE TABLE test_01383.fact
(
    id1 Int64,
    id2 Int64,
    value Int64
)
ENGINE = MergeTree()
ORDER BY id1;

CREATE TABLE test_01383.dimension
(
    id1 Int64,
    name String
)
ENGINE = MergeTree()
ORDER BY id1;

INSERT INTO test_01383.fact;

INSERT INTO test_01383.dimension;

SELECT
    f.id1 AS ID,
    d.name AS Name,
    sum(f.value)
FROM
    remote('127.0.0.{1,2,3}', test_01383.fact) AS f
LEFT JOIN test_01383.dimension AS d
    ON f.id1 = d.id1
WHERE f.id1 = f.id2
GROUP BY
    ID,
    Name
ORDER BY ID ASC;