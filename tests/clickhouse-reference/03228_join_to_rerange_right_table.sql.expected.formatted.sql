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