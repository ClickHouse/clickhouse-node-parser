CREATE TABLE test
(
    json JSON(e Enum('a' = 1, 'b' = 2))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT json
FROM test;

SELECT json.e
FROM test;