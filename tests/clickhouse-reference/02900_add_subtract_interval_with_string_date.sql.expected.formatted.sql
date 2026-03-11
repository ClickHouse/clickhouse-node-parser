SELECT '-- const date, const delta';

SELECT
    addYears('2023-10-22', 1),
    addYears('2023-10-22 12:34:56.123', 1);

SELECT
    addQuarters('2023-10-22', 1),
    addQuarters('2023-10-22 12:34:56.123', 1);

SELECT
    addMonths('2023-10-22', 1),
    addMonths('2023-10-22 12:34:56.123', 1);

SELECT
    addWeeks('2023-10-22', 1),
    addWeeks('2023-10-22 12:34:56.123', 1);

SELECT
    addDays('2023-10-22', 1),
    addDays('2023-10-22 12:34:56.123', 1);

SELECT
    addHours('2023-10-22', 1),
    addHours('2023-10-22 12:34:56.123', 1);

SELECT
    addMinutes('2023-10-22', 1),
    addMinutes('2023-10-22 12:34:56.123', 1);

SELECT
    addSeconds('2023-10-22', 1),
    addSeconds('2023-10-22 12:34:56.123', 1);

SELECT
    addMilliseconds('2023-10-22', 1),
    addMilliseconds('2023-10-22 12:34:56.123', 1);

SELECT
    addMicroseconds('2023-10-22', 1),
    addMicroseconds('2023-10-22 12:34:56.123', 1);

SELECT
    addNanoseconds('2023-10-22', 1),
    addNanoseconds('2023-10-22 12:34:56.123', 1);

SELECT
    subtractYears('2023-10-22', 1),
    subtractYears('2023-10-22 12:34:56.123', 1);

SELECT
    subtractQuarters('2023-10-22', 1),
    subtractQuarters('2023-10-22 12:34:56.123', 1);

SELECT
    subtractMonths('2023-10-22', 1),
    subtractMonths('2023-10-22 12:34:56.123', 1);

SELECT
    subtractWeeks('2023-10-22', 1),
    subtractWeeks('2023-10-22 12:34:56.123', 1);

SELECT
    subtractDays('2023-10-22', 1),
    subtractDays('2023-10-22 12:34:56.123', 1);

SELECT
    subtractHours('2023-10-22', 1),
    subtractHours('2023-10-22 12:34:56.123', 1);

SELECT
    subtractMinutes('2023-10-22', 1),
    subtractMinutes('2023-10-22 12:34:56.123', 1);

SELECT
    subtractSeconds('2023-10-22', 1),
    subtractSeconds('2023-10-22 12:34:56.123', 1);

SELECT
    subtractMilliseconds('2023-10-22', 1),
    subtractMilliseconds('2023-10-22 12:34:56.123', 1);

SELECT
    subtractMicroseconds('2023-10-22', 1),
    subtractMicroseconds('2023-10-22 12:34:56.123', 1);

SELECT
    subtractNanoseconds('2023-10-22', 1),
    subtractNanoseconds('2023-10-22 12:34:56.123', 1);

SELECT
    addYears(materialize('2023-10-22'), 1),
    addYears(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addQuarters(materialize('2023-10-22'), 1),
    addQuarters(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addMonths(materialize('2023-10-22'), 1),
    addMonths(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addWeeks(materialize('2023-10-22'), 1),
    addWeeks(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addDays(materialize('2023-10-22'), 1),
    addDays(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addHours(materialize('2023-10-22'), 1),
    addHours(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addMinutes(materialize('2023-10-22'), 1),
    addMinutes(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addSeconds(materialize('2023-10-22'), 1),
    addSeconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addMilliseconds(materialize('2023-10-22'), 1),
    addMilliseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addMicroseconds(materialize('2023-10-22'), 1),
    addMicroseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addNanoseconds(materialize('2023-10-22'), 1),
    addNanoseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractYears(materialize('2023-10-22'), 1),
    subtractYears(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractQuarters(materialize('2023-10-22'), 1),
    subtractQuarters(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractMonths(materialize('2023-10-22'), 1),
    subtractMonths(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractWeeks(materialize('2023-10-22'), 1),
    subtractWeeks(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractDays(materialize('2023-10-22'), 1),
    subtractDays(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractHours(materialize('2023-10-22'), 1),
    subtractHours(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractMinutes(materialize('2023-10-22'), 1),
    subtractMinutes(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractSeconds(materialize('2023-10-22'), 1),
    subtractSeconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractMilliseconds(materialize('2023-10-22'), 1),
    subtractMilliseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractMicroseconds(materialize('2023-10-22'), 1),
    subtractMicroseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    subtractNanoseconds(materialize('2023-10-22'), 1),
    subtractNanoseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    addYears('2023-10-22', materialize(1)),
    addYears('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addQuarters('2023-10-22', materialize(1)),
    addQuarters('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addMonths('2023-10-22', materialize(1)),
    addMonths('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addWeeks('2023-10-22', materialize(1)),
    addWeeks('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addDays('2023-10-22', materialize(1)),
    addDays('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addHours('2023-10-22', materialize(1)),
    addHours('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addMinutes('2023-10-22', materialize(1)),
    addMinutes('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addSeconds('2023-10-22', materialize(1)),
    addSeconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addMilliseconds('2023-10-22', materialize(1)),
    addMilliseconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addMicroseconds('2023-10-22', materialize(1)),
    addMicroseconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addNanoseconds('2023-10-22', materialize(1)),
    addNanoseconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractYears('2023-10-22', materialize(1)),
    subtractYears('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractQuarters('2023-10-22', materialize(1)),
    subtractQuarters('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractMonths('2023-10-22', materialize(1)),
    subtractMonths('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractWeeks('2023-10-22', materialize(1)),
    subtractWeeks('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractDays('2023-10-22', materialize(1)),
    subtractDays('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractHours('2023-10-22', materialize(1)),
    subtractHours('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractMinutes('2023-10-22', materialize(1)),
    subtractMinutes('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractSeconds('2023-10-22', materialize(1)),
    subtractSeconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractMilliseconds('2023-10-22', materialize(1)),
    subtractMilliseconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractMicroseconds('2023-10-22', materialize(1)),
    subtractMicroseconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    subtractNanoseconds('2023-10-22', materialize(1)),
    subtractNanoseconds('2023-10-22 12:34:56.123', materialize(1));

SELECT
    addYears(materialize('2023-10-22'), materialize(1)),
    addYears(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addQuarters(materialize('2023-10-22'), materialize(1)),
    addQuarters(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addMonths(materialize('2023-10-22'), materialize(1)),
    addMonths(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addWeeks(materialize('2023-10-22'), materialize(1)),
    addWeeks(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addDays(materialize('2023-10-22'), materialize(1)),
    addDays(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addHours(materialize('2023-10-22'), materialize(1)),
    addHours(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addMinutes(materialize('2023-10-22'), materialize(1)),
    addMinutes(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addSeconds(materialize('2023-10-22'), materialize(1)),
    addSeconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addMilliseconds(materialize('2023-10-22'), materialize(1)),
    addMilliseconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addMicroseconds(materialize('2023-10-22'), materialize(1)),
    addMicroseconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    addNanoseconds(materialize('2023-10-22'), materialize(1)),
    addNanoseconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractYears(materialize('2023-10-22'), materialize(1)),
    subtractYears(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractQuarters(materialize('2023-10-22'), materialize(1)),
    subtractQuarters(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractMonths(materialize('2023-10-22'), materialize(1)),
    subtractMonths(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractWeeks(materialize('2023-10-22'), materialize(1)),
    subtractWeeks(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractDays(materialize('2023-10-22'), materialize(1)),
    subtractDays(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractHours(materialize('2023-10-22'), materialize(1)),
    subtractHours(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractMinutes(materialize('2023-10-22'), materialize(1)),
    subtractMinutes(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractSeconds(materialize('2023-10-22'), materialize(1)),
    subtractSeconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractMilliseconds(materialize('2023-10-22'), materialize(1)),
    subtractMilliseconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractMicroseconds(materialize('2023-10-22'), materialize(1)),
    subtractMicroseconds(materialize('2023-10-22 12:34:56.123'), materialize(1));

SELECT
    subtractNanoseconds(materialize('2023-10-22'), materialize(1)),
    subtractNanoseconds(materialize('2023-10-22 12:34:56.123'), 1);

SELECT
    '2023-10-23' + toIntervalYear(1),
    '2023-10-23 12:34:56.123' + toIntervalYear(1);

SELECT
    '2023-10-23' + toIntervalQuarter(1),
    '2023-10-23 12:34:56.123' + toIntervalQuarter(1);

SELECT
    '2023-10-23' + toIntervalMonth(1),
    '2023-10-23 12:34:56.123' + toIntervalMonth(1);

SELECT
    '2023-10-23' + toIntervalWeek(1),
    '2023-10-23 12:34:56.123' + toIntervalWeek(1);

SELECT
    '2023-10-23' + toIntervalDay(1),
    '2023-10-23 12:34:56.123' + toIntervalDay(1);

SELECT
    '2023-10-23' + toIntervalHour(1),
    '2023-10-23 12:34:56.123' + toIntervalHour(1);

SELECT
    '2023-10-23' + toIntervalMinute(1),
    '2023-10-23 12:34:56.123' + toIntervalMinute(1);

SELECT
    '2023-10-23' + toIntervalSecond(1),
    '2023-10-23 12:34:56.123' + toIntervalSecond(1);

SELECT
    '2023-10-23' + toIntervalMillisecond(1),
    '2023-10-23 12:34:56.123' + toIntervalMillisecond(1);

SELECT
    '2023-10-23' + toIntervalMicrosecond(1),
    '2023-10-23 12:34:56.123' + toIntervalMicrosecond(1);

SELECT
    '2023-10-23' + toIntervalNanosecond(1),
    '2023-10-23 12:34:56.123' + toIntervalNanosecond(1);

SELECT
    '2023-10-23' - toIntervalYear(1),
    '2023-10-23 12:34:56.123' - toIntervalYear(1);

SELECT
    '2023-10-23' - toIntervalQuarter(1),
    '2023-10-23 12:34:56.123' - toIntervalQuarter(1);

SELECT
    '2023-10-23' - toIntervalMonth(1),
    '2023-10-23 12:34:56.123' - toIntervalMonth(1);

SELECT
    '2023-10-23' - toIntervalWeek(1),
    '2023-10-23 12:34:56.123' - toIntervalWeek(1);

SELECT
    '2023-10-23' - toIntervalDay(1),
    '2023-10-23 12:34:56.123' - toIntervalDay(1);

SELECT
    '2023-10-23' - toIntervalHour(1),
    '2023-10-23 12:34:56.123' - toIntervalHour(1);

SELECT
    '2023-10-23' - toIntervalMinute(1),
    '2023-10-23 12:34:56.123' - toIntervalMinute(1);

SELECT
    '2023-10-23' - toIntervalSecond(1),
    '2023-10-23 12:34:56.123' - toIntervalSecond(1);

SELECT
    '2023-10-23' - toIntervalMillisecond(1),
    '2023-10-23 12:34:56.123' - toIntervalMillisecond(1);

SELECT
    '2023-10-23' - toIntervalMicrosecond(1),
    '2023-10-23 12:34:56.123' - toIntervalMicrosecond(1);

SELECT
    '2023-10-23' - toIntervalNanosecond(1),
    '2023-10-23 12:34:56.123' - toIntervalNanosecond(1);