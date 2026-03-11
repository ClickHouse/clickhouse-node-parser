SELECT
    toInterval(5, 'nanosecond') AS `interval`,
    toDateTime64('2025-01-01 00:00:00', 9) + `interval` AS res;

SELECT
    toInterval(5, 'microsecond') AS `interval`,
    toDateTime64('2025-01-01 00:00:00', 9) + `interval` AS res;

SELECT
    toInterval(5, 'millisecond') AS `interval`,
    toDateTime64('2025-01-01 00:00:00', 9) + `interval` AS res;

SELECT
    toInterval(5, 'second') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Minute') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Hour') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Day') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Week') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Month') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Quarter') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT
    toInterval(5, 'Year') AS `interval`,
    toDateTime('2025-01-01 00:00:00') + `interval` AS res;

SELECT toDateTime('2025-01-01 00:00:00') + toInterval(5, 'Year') AS res;

SELECT toDateTime('2025-01-01 00:00:00') + toInterval(number, 'second')
FROM numbers(5);

SELECT toDateTime('2025-01-01 00:00:00') + toInterval(NULL, 'second');

SELECT toDateTime('2025-01-01 00:00:01') + toInterval(-1, 'second');

SELECT toDateTime('2025-01-01 00:00:00') + toInterval(0, 'second');

SELECT toDateTime('2025-01-01 00:00:00') + toInterval(1.5, 'second');

SELECT toDateTime('2025-01-01 00:00:00') + toInterval('5', 'second');

SELECT toInterval();

SELECT toInterval('');

SELECT toInterval('second');

SELECT toInterval(5, 'second', 10);

SELECT toInterval(10, 5);

SELECT toInterval(5, '');

SELECT toInterval(5, 'invalid kind');