SELECT toTime('12:34:56', 'UTC');

SELECT toTime(toDateTime('2023-01-01 12:34:56'), 'UTC');

SELECT toTime(toDateTime64('2023-01-01 12:34:56.789', 3), 'UTC');

SELECT toTime(45296, 'UTC');

SELECT toTime(now(), 'UTC');

SELECT toTime64('12:34:56.789', 3, 'UTC');

SELECT toTime64(toDateTime('2023-01-01 12:34:56'), 3, 'UTC');

SELECT toTime64(toDateTime64('2023-01-01 12:34:56.789', 3), 3, 'UTC');

SELECT toTime64(45296789, 3, 'UTC');

SELECT toTime64(now(), 3, 'UTC');

SELECT toTimeOrNull('12:34:56', 'UTC');

SELECT toTime64OrNull('12:34:56.789', 3, 'UTC');

SELECT toTimeOrZero('12:34:56', 'UTC');

SELECT toTime64OrZero('12:34:56.789', 3, 'UTC');

SELECT toTime(['12:34:56', '01:23:45'], 'UTC');

SELECT toTime64(['12:34:56.789', '01:23:45.678'], 3, 'UTC');

SELECT toTime('12:34:56', 'Europe/Moscow');

SELECT toTime64('12:34:56.789', 3, 'Europe/Moscow');

SELECT toTime('12:34:56', '+03:00');

SELECT toTime64('12:34:56.789', 3, '+03:00');