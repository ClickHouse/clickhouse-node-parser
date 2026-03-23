DROP TABLE IF EXISTS test_left;

DROP TABLE IF EXISTS test_right;

CREATE TABLE test_left
(
    a Int64,
    b String,
    c LowCardinality(String)
)
ENGINE = MergeTree()
ORDER BY a;

CREATE TABLE test_right
(
    a Int64,
    b String,
    c LowCardinality(String)
)
ENGINE = MergeTree()
ORDER BY a;

INSERT INTO test_left SELECT
    number % 10000,
    number % 10000,
    number % 10000
FROM numbers(100000);

INSERT INTO test_right SELECT
    number % 10,
    number % 10,
    number % 10
FROM numbers(10000);

SET allow_experimental_join_right_table_sorting = true;

SELECT
    MAX(test_right.a),
    count()
FROM
    test_left
INNER JOIN test_right
    ON test_left.b = test_right.b;

SELECT
    MAX(test_right.a),
    count()
FROM
    test_left
LEFT JOIN test_right
    ON test_left.b = test_right.b;

DROP TABLE test_left;

DROP TABLE test_right;