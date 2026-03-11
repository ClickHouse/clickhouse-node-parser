SELECT
    'year',
    dateDiff('year', toDate32('1969-12-25'), toDate32('1970-01-05'));

SELECT
    'year',
    dateDiff('year', toDateTime64('1969-12-25 10:00:00.000', 3), toDateTime64('1970-01-05 10:00:00.000', 3));

SELECT
    'quarter',
    dateDiff('quarter', toDate32('1969-12-25'), toDate32('1970-01-05'));

SELECT
    'quarter',
    dateDiff('quarter', toDateTime64('1969-12-25 10:00:00.000', 3), toDateTime64('1970-01-05 10:00:00.000', 3));

SELECT
    'month',
    dateDiff('month', toDate32('1969-12-25'), toDate32('1970-01-05'));

SELECT
    'month',
    dateDiff('month', toDateTime64('1969-12-25 10:00:00.000', 3), toDateTime64('1970-01-05 10:00:00.000', 3));

SELECT
    'week',
    dateDiff('week', toDate32('1969-12-25'), toDate32('1970-01-05'));

SELECT
    'week',
    dateDiff('week', toDateTime64('1969-12-25 10:00:00.000', 3), toDateTime64('1970-01-05 10:00:00.000', 3));

SELECT
    'day',
    dateDiff('day', toDate32('1969-12-25'), toDate32('1970-01-05'));

SELECT
    'day',
    dateDiff('day', toDateTime64('1969-12-25 10:00:00.000', 3), toDateTime64('1970-01-05 10:00:00.000', 3));

SELECT
    'minute',
    dateDiff('minute', toDate32('1969-12-31'), toDate32('1970-01-01'));

SELECT
    'second',
    dateDiff('second', toDate32('1969-12-31'), toDate32('1970-01-01'));