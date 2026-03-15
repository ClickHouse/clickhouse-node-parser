CREATE TABLE test
(
    x UInt32,
    y String
)
ENGINE = Memory;

SELECT count()
FROM test;