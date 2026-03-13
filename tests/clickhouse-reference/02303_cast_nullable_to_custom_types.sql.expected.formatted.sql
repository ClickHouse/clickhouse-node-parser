SELECT CAST(CAST(NULL, 'Nullable(String)'), 'Nullable(Bool)');

SELECT CAST(CAST(NULL, 'Nullable(String)'), 'Nullable(IPv4)');

SELECT CAST(CAST(NULL, 'Nullable(String)'), 'Nullable(IPv6)');

SELECT toBool(CAST(NULL, 'Nullable(String)'));

SELECT toIPv4(CAST(NULL, 'Nullable(String)'));

SELECT IPv4StringToNum(CAST(NULL, 'Nullable(String)'));

SELECT toIPv6(CAST(NULL, 'Nullable(String)'));

SELECT IPv6StringToNum(CAST(NULL, 'Nullable(String)'));

SELECT CAST(if(number % 2, 'true', NULL), 'Nullable(Bool)')
FROM numbers(2);

SELECT CAST(if(number % 2, '0.0.0.0', NULL), 'Nullable(IPv4)')
FROM numbers(2);

SELECT CAST(if(number % 2, '0000:0000:0000:0000:0000:0000:0000:0000', NULL), 'Nullable(IPv6)')
FROM numbers(2);

SELECT toBool(if(number % 2, 'true', NULL))
FROM numbers(2);

SELECT toIPv4(if(number % 2, '0.0.0.0', NULL))
FROM numbers(2);

SELECT toIPv4OrDefault(if(number % 2, '', NULL))
FROM numbers(2);

SELECT toIPv4OrNull(if(number % 2, '', NULL))
FROM numbers(2);

SELECT IPv4StringToNum(if(number % 2, '0.0.0.0', NULL))
FROM numbers(2);

SELECT toIPv6(if(number % 2, '0000:0000:0000:0000:0000:0000:0000:0000', NULL))
FROM numbers(2);

SELECT toIPv6OrDefault(if(number % 2, '', NULL))
FROM numbers(2);

SELECT toIPv6OrNull(if(number % 2, '', NULL))
FROM numbers(2);

SELECT IPv6StringToNum(if(number % 2, '0000:0000:0000:0000:0000:0000:0000:0000', NULL))
FROM numbers(2);

SELECT CAST(if(number % 2, 'truetrue', NULL), 'Nullable(Bool)')
FROM numbers(2); -- {serverError CANNOT_PARSE_BOOL}

SELECT CAST(if(number % 2, 'falsefalse', NULL), 'Nullable(Bool)')
FROM numbers(2); -- {serverError CANNOT_PARSE_BOOL}

SELECT accurateCastOrNull(if(number % 2, NULL, 'truex'), 'Bool')
FROM numbers(4);

SELECT accurateCastOrNull(if(number % 2, 'truex', NULL), 'Bool')
FROM numbers(4);