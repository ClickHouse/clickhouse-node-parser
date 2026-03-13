SELECT toStartOfDay(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toStartOfDay(toDateTime(1412106600), 'Europe/Paris');

SELECT toStartOfDay(toDateTime(1412106600), 'Europe/London');

SELECT toStartOfDay(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toStartOfDay(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toStartOfDay(toDate(16343), 'Asia/Istanbul');

SELECT toStartOfDay(toDate(16343), 'Europe/Paris');

SELECT toStartOfDay(toDate(16343), 'Europe/London');

SELECT toStartOfDay(toDate(16343), 'Asia/Tokyo');

SELECT toStartOfDay(toDate(16343), 'Pacific/Pitcairn');

SELECT toMonday(toDateTime(1419800400), 'Asia/Istanbul');

SELECT toMonday(toDateTime(1419800400), 'Europe/Paris');

SELECT toMonday(toDateTime(1419800400), 'Europe/London');

SELECT toMonday(toDateTime(1419800400), 'Asia/Tokyo');

SELECT toMonday(toDateTime(1419800400), 'Pacific/Pitcairn');

SELECT toMonday(toDate(16433), 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toMonday(toDate(16433));

SELECT toStartOfWeek(toDateTime(1419800400), 0, 'Asia/Istanbul');

SELECT toStartOfWeek(toDateTime(1419800400), 0, 'Europe/Paris');

SELECT toStartOfWeek(toDateTime(1419800400), 0, 'Europe/London');

SELECT toStartOfWeek(toDateTime(1419800400), 0, 'Asia/Tokyo');

SELECT toStartOfWeek(toDateTime(1419800400), 0, 'Pacific/Pitcairn');

SELECT toStartOfWeek(toDate(16433), 0, 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfWeek(toDate(16433), 0);

SELECT toStartOfWeek(toDateTime(1419800400), 1, 'Asia/Istanbul');

SELECT toStartOfWeek(toDateTime(1419800400), 1, 'Europe/Paris');

SELECT toStartOfWeek(toDateTime(1419800400), 1, 'Europe/London');

SELECT toStartOfWeek(toDateTime(1419800400), 1, 'Asia/Tokyo');

SELECT toStartOfWeek(toDateTime(1419800400), 1, 'Pacific/Pitcairn');

SELECT toStartOfWeek(toDate(16433), 1, 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfWeek(toDate(16433), 1);

SELECT toLastDayOfWeek(toDateTime(1419800400), 0, 'Asia/Istanbul');

SELECT toLastDayOfWeek(toDateTime(1419800400), 0, 'Europe/Paris');

SELECT toLastDayOfWeek(toDateTime(1419800400), 0, 'Europe/London');

SELECT toLastDayOfWeek(toDateTime(1419800400), 0, 'Asia/Tokyo');

SELECT toLastDayOfWeek(toDateTime(1419800400), 0, 'Pacific/Pitcairn');

SELECT toLastDayOfWeek(toDate(16433), 0, 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toLastDayOfWeek(toDate(16433), 0);

SELECT toLastDayOfWeek(toDateTime(1419800400), 1, 'Asia/Istanbul');

SELECT toLastDayOfWeek(toDateTime(1419800400), 1, 'Europe/Paris');

SELECT toLastDayOfWeek(toDateTime(1419800400), 1, 'Europe/London');

SELECT toLastDayOfWeek(toDateTime(1419800400), 1, 'Asia/Tokyo');

SELECT toLastDayOfWeek(toDateTime(1419800400), 1, 'Pacific/Pitcairn');

SELECT toLastDayOfWeek(toDate(16433), 1, 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toLastDayOfWeek(toDate(16433), 1);

SELECT toStartOfMonth(toDateTime(1419800400), 'Asia/Istanbul');

SELECT toStartOfMonth(toDateTime(1419800400), 'Europe/Paris');

SELECT toStartOfMonth(toDateTime(1419800400), 'Europe/London');

SELECT toStartOfMonth(toDateTime(1419800400), 'Asia/Tokyo');

SELECT toStartOfMonth(toDateTime(1419800400), 'Pacific/Pitcairn');

SELECT toStartOfMonth(toDate(16433), 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfMonth(toDate(16433));

SELECT toStartOfQuarter(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toStartOfQuarter(toDateTime(1412106600), 'Europe/Paris');

SELECT toStartOfQuarter(toDateTime(1412106600), 'Europe/London');

SELECT toStartOfQuarter(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toStartOfQuarter(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toStartOfQuarter(toDate(16343), 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfQuarter(toDate(16343));

SELECT toStartOfYear(toDateTime(1419800400), 'Asia/Istanbul');

SELECT toStartOfYear(toDateTime(1419800400), 'Europe/Paris');

SELECT toStartOfYear(toDateTime(1419800400), 'Europe/London');

SELECT toStartOfYear(toDateTime(1419800400), 'Asia/Tokyo');

SELECT toStartOfYear(toDateTime(1419800400), 'Pacific/Pitcairn');

SELECT toStartOfYear(toDate(16433), 'Asia/Istanbul'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfYear(toDate(16433));

SELECT
    toString(toTimeWithFixedDate(toDateTime(1420102800), 'Asia/Istanbul'), 'Asia/Istanbul'),
    toString(toTimeWithFixedDate(toDateTime(1428310800), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT
    toString(toTimeWithFixedDate(toDateTime(1420102800), 'Europe/Paris'), 'Europe/Paris'),
    toString(toTimeWithFixedDate(toDateTime(1428310800), 'Europe/Paris'), 'Europe/Paris');

SELECT
    toString(toTimeWithFixedDate(toDateTime(1420102800), 'Europe/London'), 'Europe/London'),
    toString(toTimeWithFixedDate(toDateTime(1428310800), 'Europe/London'), 'Europe/London');

SELECT
    toString(toTimeWithFixedDate(toDateTime(1420102800), 'Asia/Tokyo'), 'Asia/Tokyo'),
    toString(toTimeWithFixedDate(toDateTime(1428310800), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT
    toString(toTimeWithFixedDate(toDateTime(1420102800), 'Pacific/Pitcairn'), 'Pacific/Pitcairn'),
    toString(toTimeWithFixedDate(toDateTime(1428310800), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT toYear(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toYear(toDateTime(1412106600), 'Europe/Paris');

SELECT toYear(toDateTime(1412106600), 'Europe/London');

SELECT toYear(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toYear(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toMonth(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toMonth(toDateTime(1412106600), 'Europe/Paris');

SELECT toMonth(toDateTime(1412106600), 'Europe/London');

SELECT toMonth(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toMonth(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toDayOfMonth(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toDayOfMonth(toDateTime(1412106600), 'Europe/Paris');

SELECT toDayOfMonth(toDateTime(1412106600), 'Europe/London');

SELECT toDayOfMonth(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toDayOfMonth(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toDayOfWeek(toDateTime(1412106600), 0, 'Asia/Istanbul');

SELECT toDayOfWeek(toDateTime(1412106600), 0, 'Europe/Paris');

SELECT toDayOfWeek(toDateTime(1412106600), 0, 'Europe/London');

SELECT toDayOfWeek(toDateTime(1412106600), 0, 'Asia/Tokyo');

SELECT toDayOfWeek(toDateTime(1412106600), 0, 'Pacific/Pitcairn');

SELECT toHour(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toHour(toDateTime(1412106600), 'Europe/Paris');

SELECT toHour(toDateTime(1412106600), 'Europe/London');

SELECT toHour(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toHour(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toMinute(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toMinute(toDateTime(1412106600), 'Europe/Paris');

SELECT toMinute(toDateTime(1412106600), 'Europe/London');

SELECT toMinute(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toMinute(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toSecond(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toSecond(toDateTime(1412106600), 'Europe/Paris');

SELECT toSecond(toDateTime(1412106600), 'Europe/London');

SELECT toSecond(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toSecond(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toString(toStartOfMinute(toDateTime(1549483055), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfMinute(toDateTime(1549483055), 'Europe/Paris'), 'Europe/Paris');

SELECT toString(toStartOfMinute(toDateTime(1549483055), 'Europe/London'), 'Europe/London');

SELECT toString(toStartOfMinute(toDateTime(1549483055), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT toString(toStartOfMinute(toDateTime(1549483055), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT toString(toStartOfFiveMinutes(toDateTime(1549483055), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfFiveMinutes(toDateTime(1549483055), 'Europe/Paris'), 'Europe/Paris');

SELECT toString(toStartOfFiveMinutes(toDateTime(1549483055), 'Europe/London'), 'Europe/London');

SELECT toString(toStartOfFiveMinutes(toDateTime(1549483055), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT toString(toStartOfFiveMinutes(toDateTime(1549483055), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT toString(toStartOfTenMinutes(toDateTime(1549483055), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfTenMinutes(toDateTime(1549483055), 'Europe/Paris'), 'Europe/Paris');

SELECT toString(toStartOfTenMinutes(toDateTime(1549483055), 'Europe/London'), 'Europe/London');

SELECT toString(toStartOfTenMinutes(toDateTime(1549483055), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT toString(toStartOfTenMinutes(toDateTime(1549483055), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT toString(toStartOfFifteenMinutes(toDateTime(1549483055), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfFifteenMinutes(toDateTime(1549483055), 'Europe/Paris'), 'Europe/Paris');

SELECT toString(toStartOfFifteenMinutes(toDateTime(1549483055), 'Europe/London'), 'Europe/London');

SELECT toString(toStartOfFifteenMinutes(toDateTime(1549483055), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT toString(toStartOfFifteenMinutes(toDateTime(1549483055), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT toString(toStartOfHour(toDateTime(1549483055), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfHour(toDateTime(1549483055), 'Europe/Paris'), 'Europe/Paris');

SELECT toString(toStartOfHour(toDateTime(1549483055), 'Europe/London'), 'Europe/London');

SELECT toString(toStartOfHour(toDateTime(1549483055), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT toString(toStartOfHour(toDateTime(1549483055), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalYear(1), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalYear(2), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalYear(5), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalQuarter(1), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalQuarter(2), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalQuarter(3), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalMonth(1), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalMonth(2), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalMonth(5), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalWeek(1), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalWeek(2), 'Asia/Istanbul');

SELECT toStartOfInterval(toDateTime(1549483055), toIntervalWeek(6), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalDay(1), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalDay(2), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalDay(5), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalHour(1), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalHour(2), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalHour(6), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalHour(24), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalMinute(1), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalMinute(2), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalMinute(5), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalMinute(20), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalMinute(90), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalSecond(1), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalSecond(2), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDateTime(1549483055), toIntervalSecond(5), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toStartOfInterval(toDate(17933), toIntervalYear(1));

SELECT toStartOfInterval(toDate(17933), toIntervalYear(2));

SELECT toStartOfInterval(toDate(17933), toIntervalYear(5));

SELECT toStartOfInterval(toDate(17933), toIntervalQuarter(1));

SELECT toStartOfInterval(toDate(17933), toIntervalQuarter(2));

SELECT toStartOfInterval(toDate(17933), toIntervalQuarter(3));

SELECT toStartOfInterval(toDate(17933), toIntervalMonth(1));

SELECT toStartOfInterval(toDate(17933), toIntervalMonth(2));

SELECT toStartOfInterval(toDate(17933), toIntervalMonth(5));

SELECT toStartOfInterval(toDate(17933), toIntervalWeek(1));

SELECT toStartOfInterval(toDate(17933), toIntervalWeek(2));

SELECT toStartOfInterval(toDate(17933), toIntervalWeek(6));

SELECT toString(toStartOfInterval(toDate(17933), toIntervalDay(1), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDate(17933), toIntervalDay(2), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toString(toStartOfInterval(toDate(17933), toIntervalDay(5), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toRelativeYearNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeYearNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeYearNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeYearNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeYearNum(toDateTime(1412106600), 'Europe/London') - toRelativeYearNum(toDateTime(0), 'Europe/London');

SELECT toRelativeYearNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeYearNum(toDateTime(0), 'Asia/Tokyo');

SELECT toRelativeYearNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeYearNum(toDateTime(0), 'Pacific/Pitcairn');

SELECT toRelativeMonthNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeMonthNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeMonthNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeMonthNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeMonthNum(toDateTime(1412106600), 'Europe/London') - toRelativeMonthNum(toDateTime(0), 'Europe/London');

SELECT toRelativeMonthNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeMonthNum(toDateTime(0), 'Asia/Tokyo');

SELECT toRelativeMonthNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeMonthNum(toDateTime(0), 'Pacific/Pitcairn');

SELECT toRelativeWeekNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeWeekNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeWeekNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeWeekNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeWeekNum(toDateTime(1412106600), 'Europe/London') - toRelativeWeekNum(toDateTime(0), 'Europe/London');

SELECT toRelativeWeekNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeWeekNum(toDateTime(0), 'Asia/Tokyo');

SELECT toRelativeWeekNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeWeekNum(toDateTime(0), 'Pacific/Pitcairn');

SELECT toRelativeDayNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeDayNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeDayNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeDayNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeDayNum(toDateTime(1412106600), 'Europe/London') - toRelativeDayNum(toDateTime(0), 'Europe/London');

SELECT toRelativeDayNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeDayNum(toDateTime(0), 'Asia/Tokyo');

-- NOTE: toRelativeDayNum(toDateTime(0), 'Pacific/Pitcairn') overflows from -1 to 65535
SELECT toUInt16(toRelativeDayNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeDayNum(toDateTime(0), 'Pacific/Pitcairn'));

SELECT toRelativeHourNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeHourNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeHourNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeHourNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeHourNum(toDateTime(1412106600), 'Europe/London') - toRelativeHourNum(toDateTime(0), 'Europe/London');

SELECT toRelativeHourNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeHourNum(toDateTime(0), 'Asia/Tokyo');

SELECT toRelativeHourNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeHourNum(toDateTime(0), 'Pacific/Pitcairn');

SELECT toRelativeMinuteNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeMinuteNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeMinuteNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeMinuteNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeMinuteNum(toDateTime(1412106600), 'Europe/London') - toRelativeMinuteNum(toDateTime(0), 'Europe/London');

SELECT toRelativeMinuteNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeMinuteNum(toDateTime(0), 'Asia/Tokyo');

SELECT toRelativeMinuteNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeMinuteNum(toDateTime(0), 'Pacific/Pitcairn');

SELECT toRelativeSecondNum(toDateTime(1412106600), 'Asia/Istanbul') - toRelativeSecondNum(toDateTime(0), 'Asia/Istanbul');

SELECT toRelativeSecondNum(toDateTime(1412106600), 'Europe/Paris') - toRelativeSecondNum(toDateTime(0), 'Europe/Paris');

SELECT toRelativeSecondNum(toDateTime(1412106600), 'Europe/London') - toRelativeSecondNum(toDateTime(0), 'Europe/London');

SELECT toRelativeSecondNum(toDateTime(1412106600), 'Asia/Tokyo') - toRelativeSecondNum(toDateTime(0), 'Asia/Tokyo');

SELECT toRelativeSecondNum(toDateTime(1412106600), 'Pacific/Pitcairn') - toRelativeSecondNum(toDateTime(0), 'Pacific/Pitcairn');

SELECT toDate(toDateTime(1412106600), 'Asia/Istanbul');

SELECT toDate(toDateTime(1412106600), 'Europe/Paris');

SELECT toDate(toDateTime(1412106600), 'Europe/London');

SELECT toDate(toDateTime(1412106600), 'Asia/Tokyo');

SELECT toDate(toDateTime(1412106600), 'Pacific/Pitcairn');

SELECT toDate(1412106600, 'Asia/Istanbul');

SELECT toDate(1412106600, 'Europe/Paris');

SELECT toDate(1412106600, 'Europe/London');

SELECT toDate(1412106600, 'Asia/Tokyo');

SELECT toDate(1412106600, 'Pacific/Pitcairn');

SELECT toDate(16343);

SELECT toString(toDateTime(1436956200), 'Asia/Istanbul');

SELECT toString(toDateTime(1436956200), 'Europe/Paris');

SELECT toString(toDateTime(1436956200), 'Europe/London');

SELECT toString(toDateTime(1436956200), 'Asia/Tokyo');

SELECT toString(toDateTime(1436956200), 'Pacific/Pitcairn');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Asia/Istanbul'), 'Asia/Istanbul');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Asia/Istanbul'), 'Europe/Paris');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Asia/Istanbul'), 'Europe/London');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Asia/Istanbul'), 'Asia/Tokyo');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Asia/Istanbul'), 'Pacific/Pitcairn');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Europe/Paris'), 'Europe/Paris');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Europe/London'), 'Europe/London');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Asia/Tokyo'), 'Asia/Tokyo');

SELECT toUnixTimestamp(toString(toDateTime(1426415400), 'Pacific/Pitcairn'), 'Pacific/Pitcairn');

SELECT date_trunc('year', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('year', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('year', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('quarter', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('quarter', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('quarter', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('month', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('month', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('month', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('week', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('week', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('week', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('day', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('day', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('day', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('hour', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('hour', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('hour', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('minute', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('minute', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('minute', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('second', toDateTime('2020-01-01 04:11:22', 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('second', toDateTime('2020-01-01 12:11:22', 'Europe/London'), 'Europe/London');

SELECT date_trunc('second', toDateTime('2020-01-01 20:11:22', 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('year', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('year', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('year', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('quarter', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('quarter', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('quarter', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('month', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('month', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('month', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('week', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('week', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('week', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('day', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('day', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('day', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('hour', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('hour', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('hour', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('minute', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('minute', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('minute', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('second', toDateTime64('2020-01-01 04:11:22.123', 3, 'Europe/London'), 'America/Vancouver');

SELECT date_trunc('second', toDateTime64('2020-01-01 12:11:22.123', 3, 'Europe/London'), 'Europe/London');

SELECT date_trunc('second', toDateTime64('2020-01-01 20:11:22.123', 3, 'Europe/London'), 'Asia/Tokyo');

SELECT date_trunc('year', toDate('2020-01-01', 'Europe/London'));

SELECT date_trunc('quarter', toDate('2020-01-01', 'Europe/London'));

SELECT date_trunc('month', toDate('2020-01-01', 'Europe/London'));

SELECT date_trunc('week', toDate('2020-01-01', 'Europe/London'));

SELECT date_trunc('day', toDate('2020-01-01', 'Europe/London'), 'America/Vancouver');