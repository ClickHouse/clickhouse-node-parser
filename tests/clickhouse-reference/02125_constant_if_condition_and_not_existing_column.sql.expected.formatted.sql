-- this queries does not have to pass, but they works historically
-- let's support this while can, see #31687
CREATE TABLE test
(
    x String
)
ENGINE = StripeLog;

SELECT if(0, y, 42)
FROM test;

SELECT if(1, 42, y)
FROM test;

SELECT if(toUInt8(0), y, 42)
FROM test;

SELECT if(toUInt8(1), 42, y)
FROM test;

SELECT if(toUInt8(toUInt8(0)), y, 42)
FROM test;

SELECT if(cast(cast(0, 'UInt8'), 'UInt8'), y, 42)
FROM test;