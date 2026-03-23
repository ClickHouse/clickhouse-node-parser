SET enable_analyzer = 1;

CREATE TABLE test
(
    id UInt32,
    value LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE test2
(
    id UInt32,
    value LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test;

INSERT INTO test2;

SELECT *
FROM
    test
FULL JOIN test2
    ON isNull(test.value)
    AND isNull(test2.value)
    OR test.value == test2.value
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    test
FULL JOIN test2
    ON test.value == test2.value
ORDER BY `ALL` ASC
SETTINGS join_use_nulls = 1;