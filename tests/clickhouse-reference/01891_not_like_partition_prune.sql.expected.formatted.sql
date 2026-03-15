CREATE TABLE test
(
    a String
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a;

SELECT *
FROM test
WHERE like(a, '1%1')
ORDER BY a ASC;

SELECT *
FROM test
WHERE notLike(a, '1%1')
ORDER BY a ASC;

SELECT *
FROM test
WHERE notLike(a, '1%2')
ORDER BY a ASC;