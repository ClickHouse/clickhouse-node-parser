CREATE TABLE test_nested
(
    `id` String,
    `with_dot.str` String,
    `with_dot.array` Array(Int32)
)
ENGINE = MergeTree()
ORDER BY id;
INSERT INTO test_nested VALUES('123', 'asd', [1,2]);
SELECT * FROM test_nested;
