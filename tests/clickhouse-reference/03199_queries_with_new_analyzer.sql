SET enable_analyzer=1;
SELECT *, ngramMinHash(*) AS minhash, mortonEncode(untuple(ngramMinHash(*))) AS z
FROM (SELECT toString(number) FROM numbers(10))
ORDER BY z LIMIT 100;
CREATE TABLE test (
    idx UInt64,
    coverage Array(UInt64),
    test_name String
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE seq (
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();
