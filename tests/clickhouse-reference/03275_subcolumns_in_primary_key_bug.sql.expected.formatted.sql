CREATE TABLE test1
(
    t Tuple(a Boolean)
)
ENGINE = MergeTree
ORDER BY t.a;

INSERT INTO test1;

SELECT *
FROM test1;