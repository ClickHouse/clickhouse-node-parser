SELECT runningConcurrency(begin, `end`)
FROM runningConcurrency_test;

SELECT runningConcurrency(toDate(arrayJoin([1, 2])), toDate('2000-01-01'));

SELECT runningConcurrency('strings are', 'not supported');

SELECT runningConcurrency(NULL, NULL);

SELECT runningConcurrency(CAST(NULL, 'Nullable(DateTime)'), CAST(NULL, 'Nullable(DateTime)'));

SELECT runningConcurrency(toDate('2000-01-01'), toDateTime('2000-01-01 00:00:00'));

SELECT runningConcurrency(toDate('2000-01-02'), toDate('2000-01-01'));