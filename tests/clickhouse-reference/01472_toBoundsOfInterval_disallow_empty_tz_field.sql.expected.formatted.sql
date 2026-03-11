SELECT toStartOfDay(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfDay(toDateTime('2017-12-31 03:45:00', 'UTC'), 'UTC');

SELECT toMonday(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toMonday(toDateTime('2017-12-31 00:00:00', 'UTC'), 'UTC');

SELECT toStartOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 0, '');

SELECT toStartOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 0, 'UTC');

SELECT toStartOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 1, '');

SELECT toStartOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 1, 'UTC');

SELECT toLastDayOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 0, '');

SELECT toLastDayOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 0, 'UTC');

SELECT toLastDayOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 1, '');

SELECT toLastDayOfWeek(toDateTime('2017-12-31 00:00:00', 'UTC'), 1, 'UTC');

SELECT toStartOfMonth(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfMonth(toDateTime('2017-12-31 00:00:00', 'UTC'), 'UTC');

SELECT toStartOfQuarter(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfQuarter(toDateTime('2017-12-31 00:00:00', 'UTC'), 'UTC');

SELECT toStartOfYear(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfYear(toDateTime('2017-12-31 00:00:00', 'UTC'), 'UTC');

SELECT toStartOfTenMinutes(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfTenMinutes(toDateTime('2017-12-31 05:12:30', 'UTC'), 'UTC');

SELECT toStartOfFifteenMinutes(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfFifteenMinutes(toDateTime('2017-12-31 01:17:00', 'UTC'), 'UTC');

SELECT toStartOfHour(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfHour(toDateTime('2017-12-31 01:59:00', 'UTC'), 'UTC');

SELECT toStartOfMinute(toDateTime('2017-12-31 00:00:00', 'UTC'), '');

SELECT toStartOfMinute(toDateTime('2017-12-31 00:01:30', 'UTC'), 'UTC');

SELECT toStartOfDay(today())
FORMAT Null;

SELECT toStartOfDay(yesterday())
FORMAT Null;