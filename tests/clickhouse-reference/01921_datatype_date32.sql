create table t1(x1 Date32) engine Memory;
insert into t1 values ('1900-01-01'),('1899-01-01'),('2299-12-15'),('2300-12-31'),('2021-06-22');
select x1 from t1;
select '-------toYear---------';
select toYear(x1) from t1;
select toMonth(x1) from t1;
select toQuarter(x1) from t1;
select toDayOfMonth(x1) from t1;
select toDayOfWeek(x1) from t1;
select toDayOfYear(x1) from t1;
select toHour(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toMinute(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toSecond(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfDay(x1, 'Asia/Istanbul') from t1;
select toMonday(x1) from t1;
select toISOWeek(x1) from t1;
select toISOYear(x1) from t1;
select toWeek(x1) from t1;
select toYearWeek(x1) from t1;
select toStartOfWeek(x1) from t1;
select toLastDayOfWeek(x1) from t1;
select toStartOfMonth(x1) from t1;
select toStartOfQuarter(x1) from t1;
select toStartOfYear(x1) from t1;
select toStartOfSecond(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfMinute(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfFiveMinutes(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfTenMinutes(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfFifteenMinutes(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfHour(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toStartOfISOYear(x1) from t1;
select toRelativeYearNum(x1, 'Asia/Istanbul') from t1;
select toRelativeQuarterNum(x1, 'Asia/Istanbul') from t1;
select toRelativeMonthNum(x1, 'Asia/Istanbul') from t1;
select toRelativeWeekNum(x1, 'Asia/Istanbul') from t1;
select toRelativeDayNum(x1, 'Asia/Istanbul') from t1;
select toRelativeHourNum(x1, 'Asia/Istanbul') from t1;
select toRelativeMinuteNum(x1, 'Asia/Istanbul') from t1;
select toRelativeSecondNum(x1, 'Asia/Istanbul') from t1;
select toTimeWithFixedDate(x1) from t1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select toYYYYMM(x1) from t1;
select toYYYYMMDD(x1) from t1;
select toYYYYMMDDhhmmss(x1) from t1;
select addSeconds(x1, 3600) from t1;
select addMinutes(x1, 60) from t1;
select addHours(x1, 1) from t1;
select addDays(x1, 7) from t1;
select addWeeks(x1, 1) from t1;
select addMonths(x1, 1) from t1;
select addQuarters(x1, 1) from t1;
select addYears(x1, 1) from t1;
select subtractSeconds(x1, 3600) from t1;
select subtractMinutes(x1, 60) from t1;
select subtractHours(x1, 1) from t1;
select subtractDays(x1, 7) from t1;
select subtractWeeks(x1, 1) from t1;
select subtractMonths(x1, 1) from t1;
select subtractQuarters(x1, 1) from t1;
select subtractYears(x1, 1) from t1;
select toDate32('1900-01-01'), toDate32(toDate('2000-01-01'));
select toDate32OrZero('1899-01-01'), toDate32OrNull('1899-01-01');
select toDate32OrZero(''), toDate32OrNull('');
select (select toDate32OrZero(''));
select (select toDate32OrNull(''));
SELECT toString(T.d) dateStr
FROM
    (
    SELECT '1900-01-01'::Date32 d
    UNION ALL SELECT '1969-12-31'::Date32
    UNION ALL SELECT '1970-01-01'::Date32
    UNION ALL SELECT '2149-06-06'::Date32
    UNION ALL SELECT '2149-06-07'::Date32
    UNION ALL SELECT '2299-12-31'::Date32
    ) AS T
ORDER BY T.d
