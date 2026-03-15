CREATE TABLE test
(
    x UInt32,
    y UInt32,
    z UInt32
)
ENGINE = Memory();

SELECT *
FROM test;