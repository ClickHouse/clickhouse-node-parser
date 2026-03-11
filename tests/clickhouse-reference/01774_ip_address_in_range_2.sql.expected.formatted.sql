SELECT isIPAddressInRange(CAST('127.0.0.1', 'Nullable(String)'), '127.0.0.0/8');

SELECT isIPAddressInRange(CAST('128.0.0.1', 'Nullable(String)'), '127.0.0.0/8');

SELECT isIPAddressInRange(CAST('ffff::1', 'Nullable(String)'), 'ffff::/16');

SELECT isIPAddressInRange(CAST('fffe::1', 'Nullable(String)'), 'ffff::/16');

SELECT isIPAddressInRange(toIPv4('127.0.0.1'), '127.0.0.0/8');

SELECT isIPAddressInRange(toIPv4('128.0.0.1'), '127.0.0.0/8');

SELECT isIPAddressInRange(toIPv6('ffff::1'), 'ffff::/16');

SELECT isIPAddressInRange(toIPv6('fffe::1'), 'ffff::/16');

SELECT isIPAddressInRange(CAST(toIPv4('127.0.0.1'), 'Nullable(IPv4)'), '127.0.0.0/8');

SELECT isIPAddressInRange(CAST(toIPv4('128.0.0.1'), 'Nullable(IPv4)'), '127.0.0.0/8');

SELECT isIPAddressInRange(CAST(toIPv6('ffff::1'), 'Nullable(IPv6)'), 'ffff::/16');

SELECT isIPAddressInRange(CAST(toIPv6('fffe::1'), 'Nullable(IPv6)'), 'ffff::/16');

SELECT sum(isIPAddressInRange(CAST(NULL, 'Nullable(String)'), cidr)) == 0
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('0.0.0.0'), cidr)) == 1
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('127.0.0.0'), cidr)) == 1
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('128.0.0.0'), cidr)) == 2
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('255.0.0.0'), cidr)) == 9
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('255.0.0.1'), cidr)) == 9
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('255.0.0.255'), cidr)) == 9
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('255.255.255.255'), cidr)) == 33
FROM test_data_2;

SELECT sum(isIPAddressInRange(toIPv4('255.255.255.254'), cidr)) == 32
FROM test_data_2;

SELECT sum(isIPAddressInRange(CAST(NULL, 'Nullable(IPv4)'), cidr)) == 0
FROM test_data_2;

SELECT isIPAddressInRange(toIPv4('127.0.0.1'), 'ffff::/16');

SELECT isIPAddressInRange(toIPv4('127.0.0.1'), '::127.0.0.1/128');

SELECT isIPAddressInRange(CAST(toIPv4('127.0.0.1'), 'Nullable(IPv4)'), 'ffff::/16');

SELECT isIPAddressInRange(CAST(toIPv4('127.0.0.1'), 'Nullable(IPv4)'), '::127.0.0.1/128');

SELECT isIPAddressInRange(CAST(NULL, 'Nullable(IPv4)'), '::127.0.0.1/128');

SELECT isIPAddressInRange(toIPv6('::1'), '127.0.0.0/8');

SELECT isIPAddressInRange(toIPv6('::127.0.0.1'), '127.0.0.1/32');

SELECT isIPAddressInRange(CAST(toIPv6('::1'), 'Nullable(IPv6)'), '127.0.0.0/8');

SELECT isIPAddressInRange(CAST(toIPv6('::127.0.0.1'), 'Nullable(IPv6)'), '127.0.0.1/32');

SELECT isIPAddressInRange(CAST(NULL, 'Nullable(IPv6)'), '127.0.0.1/32');