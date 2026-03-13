SELECT accurateCastOrNull(-1, 'UInt8');

SELECT accurateCastOrNull(5, 'UInt8');

SELECT accurateCastOrNull(257, 'UInt8');

SELECT accurateCastOrNull(-1, 'UInt16');

SELECT accurateCastOrNull(5, 'UInt16');

SELECT accurateCastOrNull(65536, 'UInt16');

SELECT accurateCastOrNull(-1, 'UInt32');

SELECT accurateCastOrNull(5, 'UInt32');

SELECT accurateCastOrNull(4294967296, 'UInt32');

SELECT accurateCastOrNull(-1, 'UInt64');

SELECT accurateCastOrNull(5, 'UInt64');

SELECT accurateCastOrNull(-1, 'UInt256');

SELECT accurateCastOrNull(5, 'UInt256');

SELECT accurateCastOrNull(-129, 'Int8');

SELECT accurateCastOrNull(5, 'Int8');

SELECT accurateCastOrNull(128, 'Int8');

SELECT accurateCastOrNull(10, 'Decimal32(9)');

SELECT accurateCastOrNull(1, 'Decimal32(9)');

SELECT accurateCastOrNull(-10, 'Decimal32(9)');

SELECT accurateCastOrNull('123', 'FixedString(2)');

SELECT accurateCastOrNull(inf, 'Int64');

SELECT accurateCastOrNull(inf, 'Int128');

SELECT accurateCastOrNull(inf, 'Int256');

SELECT accurateCastOrNull(nan, 'Int64');

SELECT accurateCastOrNull(nan, 'Int128');

SELECT accurateCastOrNull(nan, 'Int256');

SELECT accurateCastOrNull(inf, 'UInt64');

SELECT accurateCastOrNull(inf, 'UInt256');

SELECT accurateCastOrNull(nan, 'UInt64');

SELECT accurateCastOrNull(nan, 'UInt256');

SELECT accurateCastOrNull(number + 127, 'Int8') AS x
FROM numbers(2)
ORDER BY x ASC;

SELECT accurateCastOrNull(-1, 'DateTime');

SELECT accurateCastOrNull(5000000000, 'DateTime');

SELECT accurateCastOrNull('1xxx', 'DateTime');

SELECT toString(accurateCastOrNull('2023-05-30 14:38:20', 'DateTime'), timezone());

SELECT toString(accurateCastOrNull(19, 'DateTime'), 'UTC');

SELECT toString(accurateCastOrNull(70000, 'DateTime'), 'UTC');

-- need fixed timezone in these two lines
SELECT toString(accurateCastOrNull('1965-05-30 14:38:20', 'DateTime'), timezone())
SETTINGS session_timezone = 'UTC';

SELECT toString(accurateCastOrNull('2223-05-30 14:38:20', 'DateTime'), timezone())
SETTINGS session_timezone = 'UTC';

SELECT accurateCastOrNull(-1, 'Date');

SELECT accurateCastOrNull(5000000000, 'Date');

SELECT accurateCastOrNull('1xxx', 'Date');

SELECT accurateCastOrNull('2023-05-30', 'Date');

SELECT accurateCastOrNull('2180-01-01', 'Date');

SELECT accurateCastOrNull(19, 'Date');

SELECT accurateCastOrNull('test', 'Bool');

SELECT accurateCastOrNull('truex', 'Bool');

SELECT accurateCastOrNull('xfalse', 'Bool');

SELECT accurateCastOrNull('true', 'Bool');

SELECT accurateCastOrNull('false', 'Bool');

SELECT accurateCastOrNull('1', 'Bool');

SELECT accurateCastOrNull('0', 'Bool');

SELECT accurateCastOrNull(1, 'Bool');

SELECT accurateCastOrNull(0, 'Bool');

SELECT accurateCastOrNull('test', 'IPv4');

SELECT accurateCastOrNull('2001:db8::1', 'IPv4');

SELECT accurateCastOrNull('::ffff:192.0.2.1', 'IPv4');

SELECT accurateCastOrNull('192.0.2.1', 'IPv4');

SELECT accurateCastOrNull('192.0.2.1x', 'IPv4');

SELECT accurateCastOrNull('test', 'IPv6');

SELECT accurateCastOrNull('192.0.2.1', 'IPv6');

SELECT accurateCastOrNull('2001:db8::1', 'IPv6');

SELECT accurateCastOrNull('2001:db8::1x', 'IPv6');