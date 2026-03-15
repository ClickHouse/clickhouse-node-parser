CREATE TABLE test
(
    x UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test
(
    x UInt8,
    y UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM test
ORDER BY y ASC;