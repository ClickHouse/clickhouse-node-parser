CREATE TABLE test1
(
    `t` Tuple(a Boolean)
)
ENGINE = MergeTree
ORDER BY t.a;
SELECT * FROM test1;
