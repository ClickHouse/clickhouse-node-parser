-- Tags: no-fasttest
SELECT formatRow('ORC', number, toDate(number))
FROM numbers(5); -- { serverError BAD_ARGUMENTS }

SELECT formatRow('Parquet', number, toDate(number))
FROM numbers(5); -- { serverError BAD_ARGUMENTS }

SELECT formatRow('Arrow', number, toDate(number))
FROM numbers(5); -- { serverError BAD_ARGUMENTS }

SELECT formatRow('Native', number, toDate(number))
FROM numbers(5); -- { serverError BAD_ARGUMENTS }