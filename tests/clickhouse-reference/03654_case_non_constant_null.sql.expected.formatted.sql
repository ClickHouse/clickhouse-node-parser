DROP TABLE IF EXISTS test1;

CREATE TABLE test1
(
    a Int,
    b Int,
    c int,
    d int
)
ENGINE = MergeTree()
PRIMARY KEY a;

INSERT INTO test1;

SELECT caseWithExpression(a + b, c, 'c', d, 'd', NULL)
FROM test1;

DROP TABLE test1;