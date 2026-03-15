CREATE TABLE test_nested
(
    id String,
    `with_dot.str` String,
    `with_dot.array` Array(Int32)
)
ENGINE = MergeTree()
ORDER BY id;

SELECT *
FROM test_nested;