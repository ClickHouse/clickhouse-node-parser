SELECT now() + 1::Int128;

SELECT now() + 1::Int256;

SELECT now() + 1::UInt128;

SELECT now() + 1::UInt256;

SELECT now() - 1::Int128;

SELECT now() - 1::Int256;

SELECT now() - 1::UInt128;

SELECT now() - 1::UInt256;

SELECT now() + toIntervalSecond(1::Int128) - now();

SELECT now() + toIntervalSecond(1::Int256) - now();

SELECT now() + toIntervalSecond(1::UInt128) - now();

SELECT now() + toIntervalSecond(1::UInt256) - now();

SELECT today() + toIntervalDay(1::Int128) - today();

SELECT today() + toIntervalDay(1::Int256) - today();

SELECT today() + toIntervalDay(1::UInt128) - today();

SELECT today() + toIntervalDay(1::UInt256) - today();