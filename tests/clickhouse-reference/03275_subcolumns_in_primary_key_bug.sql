DROP TABLE IF EXISTS test1;
CREATE TABLE test1
(
    `t` Tuple(a Boolean)
)
ENGINE = MergeTree
ORDER BY t.a;
INSERT INTO test1 FORMAT Values (tuple(true)), (tuple(false));
SELECT * FROM test1;
