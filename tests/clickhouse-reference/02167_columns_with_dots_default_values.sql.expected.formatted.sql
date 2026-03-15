CREATE TABLE test_nested_default
(
    id String,
    `with_dot.str` String,
    `with_dot.array` Array(String)
)
ENGINE = MergeTree()
ORDER BY id;

SELECT *
FROM test_nested_default;