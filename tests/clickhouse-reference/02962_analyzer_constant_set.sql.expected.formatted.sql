CREATE TABLE test_parallel_index
(
    z UInt64,
    INDEX i z TYPE set(8)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test_parallel_index SELECT number
FROM numbers(10);

SELECT sum(z)
FROM test_parallel_index
WHERE z = 2
    OR z = 7
    OR z = 13
    OR z = 17
    OR z = 19
    OR z = 23;