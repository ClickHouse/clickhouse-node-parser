-- Tags: no-parallel-replicas
-- Tag no-parallel-replicas: result of explain is different
SET enable_analyzer = 1;

CREATE TABLE test
(
    json JSON(d Date)
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY json.d;

SELECT *
FROM test
ORDER BY json.d ASC;

CREATE TABLE test
(
    c0 Array(Nullable(Int)),
    c1 Int,
    c2 Int
)
ENGINE = MergeTree()
ORDER BY (c1)
PARTITION BY (c0.`null`);

SELECT *
FROM test
ORDER BY `all` ASC;