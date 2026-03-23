SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    x UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test (x);

SYSTEM DROP  TABLE test;

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