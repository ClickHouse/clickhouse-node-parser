SELECT ADDDATE(materialize('2022-05-07'::Date), toIntervalMinute(5));

SELECT addDate('2022-05-07'::Date, toIntervalMinute(5));

SELECT addDate('2022-05-07'::Date32, toIntervalMinute(5));

SELECT addDate('2022-05-07'::DateTime, toIntervalMinute(5));

SELECT addDate('2022-05-07'::DateTime64, toIntervalMinute(5));

SELECT addDate('2022-05-07', toIntervalMinute(5));

SELECT addDate('2022-05-07'::Date);

SELECT addDate('2022-05-07'::Date, toIntervalMinute(5), 5);

SELECT addDate('2022-05-07'::Date, 10);

SELECT addDate(1.2, toIntervalMinute(5));

SELECT '---';

SELECT SUBDATE(materialize('2022-05-07'::Date), toIntervalMinute(5));

SELECT subDate('2022-05-07'::Date, toIntervalMinute(5));

SELECT subDate('2022-05-07'::Date32, toIntervalMinute(5));

SELECT subDate('2022-05-07'::DateTime, toIntervalMinute(5));

SELECT subDate('2022-05-07'::DateTime64, toIntervalMinute(5));

SELECT subDate('2022-05-07'::String, toIntervalMinute(5));

SELECT subDate('2022-05-07'::Date);

SELECT subDate('2022-05-07'::Date, toIntervalMinute(5), 5);

SELECT subDate('2022-05-07'::Date, 10);

SELECT subDate(1.2, toIntervalMinute(5));