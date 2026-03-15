CREATE TABLE test1
(
    a Int,
    b Int,
    c int,
    d int
)
ENGINE = MergeTree()
PRIMARY KEY a;

SELECT caseWithExpression(a + b, c, 'c', d, 'd', NULL)
FROM test1;