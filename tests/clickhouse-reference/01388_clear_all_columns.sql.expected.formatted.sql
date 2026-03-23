CREATE TABLE test
(
    x UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test (x);

CREATE TABLE test
(
    x UInt8,
    y UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test (x, y);

INSERT INTO test (x, y, z);

SELECT *
FROM test
ORDER BY y ASC;