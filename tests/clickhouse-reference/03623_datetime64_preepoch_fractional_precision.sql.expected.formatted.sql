SELECT parseDateTime64BestEffort('1969-01-01 00:00:00.468', 3, 'UTC');

SELECT parseDateTime64BestEffort('1969-07-20 20:17:40.123456', 6, 'UTC');

SELECT parseDateTime64BestEffort('1950-01-01 00:00:00.500', 3, 'UTC');

SELECT parseDateTime64BestEffort('1969-12-31 23:59:59.999', 3, 'UTC');

SELECT parseDateTime64BestEffort('1970-01-01 00:00:00.000', 3, 'UTC');

SELECT makeDateTime64(1969, 1, 1, 0, 0, 0, 468, 3);

SELECT makeDateTime64(1969, 12, 31, 23, 59, 59, 999, 3);

SELECT makeDateTime64(1969, 6, 15, 12, 0, 0, 500000, 6);

SELECT changeYear('2024-01-01 00:00:00.462'::DateTime64, 1969);

SELECT changeMonth('1969-06-15 12:30:45.123'::DateTime64, 1);

SELECT changeDay('1969-12-01 08:15:22.789'::DateTime64, 31);

SELECT length(toString(now64(3))) > 0;

SELECT ULIDStringToDateTime('01ARZ3NDEKTSV4RRFFQ69G5FAV', 'UTC');

SELECT length(toString(generateUUIDv7())) = 36;

SELECT CAST(-123.456 AS Decimal64(3));

SELECT CAST(-1969.123 AS Decimal64(3));

SELECT CAST(1234.567 AS Decimal32(3));

SELECT parseDateTime64BestEffort('1969-01-01 00:00:00.500', 3, 'UTC') + toIntervalSecond(1);