CREATE TABLE test_00688
(
    a UInt8
)
ENGINE = Memory;

SELECT multiIf(a = 1, 0, NULL)
FROM test_00688;