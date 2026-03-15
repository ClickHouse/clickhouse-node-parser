CREATE TABLE test
(
    id UInt64,
    json JSON
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE test2
(
    json JSON
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM test2
FORMAT Null;