SELECT runningConcurrency(begin, end) FROM runningConcurrency_test;
-- Constant columns are currently not supported.
SELECT runningConcurrency(toDate(arrayJoin([1, 2])), toDate('2000-01-01')); -- { serverError ILLEGAL_COLUMN }
-- Unsupported data types
SELECT runningConcurrency('strings are', 'not supported'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT runningConcurrency(NULL, NULL); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT runningConcurrency(CAST(NULL, 'Nullable(DateTime)'), CAST(NULL, 'Nullable(DateTime)')); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
-- Mismatching data types
SELECT runningConcurrency(toDate('2000-01-01'), toDateTime('2000-01-01 00:00:00')); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
-- begin > end
SELECT runningConcurrency(toDate('2000-01-02'), toDate('2000-01-01')); -- { serverError INCORRECT_DATA }
