SELECT accurateCast(-1, 'UInt8');

SELECT accurateCast(5, 'UInt8');

SELECT accurateCast(257, 'UInt8');

SELECT accurateCast(-1, 'UInt16');

SELECT accurateCast(5, 'UInt16');

SELECT accurateCast(65536, 'UInt16');

SELECT accurateCast(-1, 'UInt32');

SELECT accurateCast(5, 'UInt32');

SELECT accurateCast(4294967296, 'UInt32');

SELECT accurateCast(-1, 'UInt64');

SELECT accurateCast(5, 'UInt64');

SELECT accurateCast(-1, 'UInt256');

SELECT accurateCast(5, 'UInt256');

SELECT accurateCast(-129, 'Int8');

SELECT accurateCast(5, 'Int8');

SELECT accurateCast(128, 'Int8');

SELECT accurateCast('-1', 'UInt8');

SELECT accurateCast('5', 'UInt8');

SELECT accurateCast('257', 'UInt8');

SELECT accurateCast('-1', 'UInt16');

SELECT accurateCast('5', 'UInt16');

SELECT accurateCast('65536', 'UInt16');

SELECT accurateCast('-1', 'UInt32');

SELECT accurateCast('5', 'UInt32');

SELECT accurateCast('4294967296', 'UInt32');

SELECT accurateCast('-1', 'UInt64');

SELECT accurateCast('5', 'UInt64');

SELECT accurateCast('-129', 'Int8');

SELECT accurateCast('5', 'Int8');

SELECT accurateCast('128', 'Int8');

SELECT accurateCast(10, 'Decimal32(9)');

SELECT accurateCast(1, 'Decimal32(9)');

SELECT accurateCast(-10, 'Decimal32(9)');

SELECT accurateCast('123', 'FixedString(2)');

SELECT accurateCast('12', 'FixedString(2)');

SELECT accurateCast(-1, 'DateTime');

SELECT accurateCast(0xFFFFFFFF + 1, 'DateTime');

SELECT accurateCast('1xxx', 'DateTime');

SELECT accurateCast('2023-05-30 14:38:20', 'DateTime');

SELECT toString(accurateCast(19, 'DateTime'), 'UTC');

SELECT accurateCast(-1, 'Date');

SELECT accurateCast(0xFFFFFFFF + 1, 'Date');

SELECT accurateCast('1xxx', 'Date');

SELECT accurateCast('2023-05-30', 'Date');

SELECT accurateCast(19, 'Date');

SELECT accurateCast('test', 'Nullable(Bool)');

SELECT accurateCast('test', 'Bool');

SELECT accurateCast('truex', 'Bool');

SELECT accurateCast('xfalse', 'Bool');

SELECT accurateCast('true', 'Bool');

SELECT accurateCast('false', 'Bool');

SELECT accurateCast('1', 'Bool');

SELECT accurateCast('0', 'Bool');

SELECT accurateCast(1, 'Bool');

SELECT accurateCast(0, 'Bool');

SELECT accurateCast('test', 'Nullable(IPv4)');

SELECT accurateCast('test', 'IPv4');

SELECT accurateCast('2001:db8::1', 'IPv4');

SELECT accurateCast('::ffff:192.0.2.1', 'IPv4');

SELECT accurateCast('192.0.2.1', 'IPv4');

SELECT accurateCast('192.0.2.1x', 'IPv4');

SELECT accurateCast('test', 'Nullable(IPv6)');

SELECT accurateCast('test', 'IPv6');

SELECT accurateCast('192.0.2.1', 'IPv6');

SELECT accurateCast('2001:db8::1', 'IPv6');

SELECT accurateCast('2001:db8::1x', 'IPv6');