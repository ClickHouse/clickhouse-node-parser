SELECT isIPAddressInRange('127.0.0.1', '127.0.0.0/8');
SELECT isIPAddressInRange('128.0.0.1', '127.0.0.0/8');
SELECT isIPAddressInRange('ffff::1', 'ffff::/16');
SELECT isIPAddressInRange('fffe::1', 'ffff::/16');
CREATE TABLE test_data (cidr String) ENGINE = Memory;
SELECT sum(isIPAddressInRange('0.0.0.0', cidr)) == 1 FROM test_data;
SELECT sum(isIPAddressInRange('127.0.0.0', cidr)) == 1 FROM test_data;
SELECT sum(isIPAddressInRange('128.0.0.0', cidr)) == 2 FROM test_data;
SELECT sum(isIPAddressInRange('255.0.0.0', cidr)) == 9 FROM test_data;
SELECT sum(isIPAddressInRange('255.0.0.1', cidr)) == 9 FROM test_data;
SELECT sum(isIPAddressInRange('255.0.0.255', cidr)) == 9 FROM test_data;
SELECT sum(isIPAddressInRange('255.255.255.255', cidr)) == 33 FROM test_data;
SELECT sum(isIPAddressInRange('255.255.255.254', cidr)) == 32 FROM test_data;
SELECT isIPAddressInRange('127.0.0.1', 'ffff::/16');
SELECT isIPAddressInRange('127.0.0.1', '::127.0.0.1/128');
SELECT isIPAddressInRange('::1', '127.0.0.0/8');
SELECT isIPAddressInRange('::127.0.0.1', '127.0.0.1/32');
SELECT isIPAddressInRange('unparsable', '127.0.0.0/8'); -- { serverError CANNOT_PARSE_TEXT }
SELECT isIPAddressInRange('127.0.0.1', 'unparsable'); -- { serverError CANNOT_PARSE_TEXT }
SELECT isIPAddressInRange(100, '127.0.0.0/8'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT isIPAddressInRange(NULL, '127.0.0.0/8'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT isIPAddressInRange('127.0.0.1', 100); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT isIPAddressInRange(100, NULL); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
