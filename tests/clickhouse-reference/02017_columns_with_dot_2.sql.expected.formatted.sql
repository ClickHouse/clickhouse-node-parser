SYSTEM DROP  TABLE IF EXISTS test_nested;

CREATE TABLE test_nested
(
    id String,
    `with_dot.str` String,
    `with_dot.array` Array(Int32)
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO test_nested;

SELECT *
FROM test_nested;

SYSTEM DROP  TABLE test_nested;