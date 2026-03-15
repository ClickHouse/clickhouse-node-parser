CREATE TABLE test
(
    x Nullable(UInt32)
)
ENGINE = Memory;

SELECT getSubcolumn(x, 'null')
FROM test;