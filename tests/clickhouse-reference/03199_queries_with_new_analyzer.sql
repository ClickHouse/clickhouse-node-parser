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
INSERT INTO test VALUES (10, [0,1,2,3], 'xx'), (20, [3,4,5,6], 'xxx'), (90, [3,4,5,6,9], 'xxxx');
CREATE TABLE seq (
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();
INSERT INTO seq VALUES (0), (6), (7);
