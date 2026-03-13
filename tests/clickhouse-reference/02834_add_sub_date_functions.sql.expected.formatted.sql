SELECT ADDDATE(materialize('2022-05-07'::Date), toIntervalMinute(5));

SELECT addDate('2022-05-07'::Date, toIntervalMinute(5));

SELECT addDate('2022-05-07'::Date32, toIntervalMinute(5));

SELECT addDate('2022-05-07'::DateTime, toIntervalMinute(5));

SELECT addDate('2022-05-07'::DateTime64, toIntervalMinute(5));

SELECT addDate('2022-05-07', toIntervalMinute(5));

SELECT addDate('2022-05-07'::Date); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT addDate('2022-05-07'::Date, toIntervalMinute(5), 5); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT addDate('2022-05-07'::Date, 10); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT addDate(1.2, toIntervalMinute(5)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT '---';

SELECT SUBDATE(materialize('2022-05-07'::Date), toIntervalMinute(5));

SELECT subDate('2022-05-07'::Date, toIntervalMinute(5));

SELECT subDate('2022-05-07'::Date32, toIntervalMinute(5));

SELECT subDate('2022-05-07'::DateTime, toIntervalMinute(5));

SELECT subDate('2022-05-07'::DateTime64, toIntervalMinute(5));

SELECT subDate('2022-05-07'::String, toIntervalMinute(5));

SELECT subDate('2022-05-07'::Date); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT subDate('2022-05-07'::Date, toIntervalMinute(5), 5); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT subDate('2022-05-07'::Date, 10); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT subDate(1.2, toIntervalMinute(5)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }