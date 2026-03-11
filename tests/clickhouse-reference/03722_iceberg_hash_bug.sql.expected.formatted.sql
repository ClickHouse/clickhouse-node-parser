SELECT icebergHash(toDecimal64(1.23, 8))
FROM numbers(10);

SELECT icebergHash(toUUID('0e3bcf76-323d-4e5f-a4f6-65e4b948a4e1'))
FROM numbers(10);

SELECT icebergHash(toDateTime64('2025-11-18 17:48:12.123456789', 9, 'UTC'))
FROM numbers(10);