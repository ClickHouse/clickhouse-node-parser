SELECT now() + CAST(toFixedString(materialize(toNullable('1')), 1), 'IPv6');

SELECT CAST('2000-01-01', 'Date32') - CAST(0, 'IPv4');

SELECT (t0.c0, t0.c0) * t0.c0
FROM t0;

SELECT materialize('1')::IPv6 + '2000-01-01 00:00:00'::DateTime;

SELECT toIPv4('127.0.0.1') + 0.1;

SELECT 0.1 + toIPv4('127.0.0.1');

SELECT toIPv6('127.0.0.1') + 0.1;

SELECT 0.1 + toIPv6('127.0.0.1');

SELECT toIPv4('127.0.0.1') + 0.1::Float32;

SELECT toIPv6('127.0.0.1') + 0.1::Float32;

SELECT toIPv4('127.0.0.1') + 0.1::BFloat16;

SELECT toIPv6('127.0.0.1') + 0.1::BFloat16;

SELECT toIPv4('127.0.0.1') + toIntervalSecond(1);

SELECT toIPv6('127.0.0.1') + toIntervalSecond(1);

SELECT toIPv4('127.0.0.1') + toDecimal32(0.1, 2);

SELECT toIPv6('127.0.0.1') + toDecimal32(0.1, 2);