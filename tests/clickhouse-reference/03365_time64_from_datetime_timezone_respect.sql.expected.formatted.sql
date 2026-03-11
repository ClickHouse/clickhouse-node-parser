SELECT toTime64(toDateTime(1200000), 3);

SELECT toDateTime(1200000);

SELECT toTime64(reinterpret(toUInt64(12345), 'DateTime64(0)'), 3);

SELECT toTime(reinterpret(toUInt64(12345), 'DateTime64(0)'));

SELECT toDateTime64(12345, 0);

SELECT toTime64(toDateTime('2020-01-01 12:34:56', 'Europe/Moscow'), 3);

SELECT toTime(toDateTime('2020-01-01 12:34:56', 'Europe/Moscow'));

SELECT toTime64(toDateTime64('2020-01-01 12:34:56.789', 3, 'Europe/Moscow'), 3);

SELECT toTime(toDateTime64('2020-01-01 12:34:56.789', 3, 'Europe/Moscow'));

SELECT toTime64(toDateTime('2020-01-01 12:34:56'), 3);

SELECT toTime(toDateTime('2020-01-01 12:34:56'));

SELECT toTime64(toDateTime64('2020-01-01 12:34:56.789', 3), 3);

SELECT toTime(toDateTime64('2020-01-01 12:34:56.789', 3));