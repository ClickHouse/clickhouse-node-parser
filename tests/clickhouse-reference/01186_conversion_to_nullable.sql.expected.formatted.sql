SELECT toUInt8(x)
FROM values('x Nullable(String)', '42', NULL, '0', '', '256');

SELECT toInt64(x)
FROM values('x Nullable(String)', '42', NULL, '0', '', '256');

SELECT toDate(x)
FROM values('x Nullable(String)', '2020-12-24', NULL, '0000-00-00', '', '9999-01-01');

SELECT toDateTime(x, 'Asia/Istanbul')
FROM values('x Nullable(String)', '2020-12-24 01:02:03', NULL, '0000-00-00 00:00:00', '');

SELECT toDateTime64(x, 2, 'Asia/Istanbul')
FROM values('x Nullable(String)', '2020-12-24 01:02:03', NULL, '0000-00-00 00:00:00', '');

SELECT toUnixTimestamp(x, 'Asia/Istanbul')
FROM values('x Nullable(String)', '2000-01-01 13:12:12', NULL, '');

SELECT toDecimal32(x, 2)
FROM values('x Nullable(String)', '42', NULL, '3.14159');

SELECT toDecimal64(x, 8)
FROM values('x Nullable(String)', '42', NULL, '3.14159');

SELECT toString(x)
FROM values('x Nullable(String)', '42', NULL, 'test');

SELECT toFixedString(x, 8)
FROM values('x Nullable(String)', '42', NULL, 'test');