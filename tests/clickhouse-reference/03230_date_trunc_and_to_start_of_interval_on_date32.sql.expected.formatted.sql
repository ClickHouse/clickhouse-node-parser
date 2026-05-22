-- { echoOn }
SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalYear(1));

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalQuarter(1));

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalMonth(1));

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalWeek(1));

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalDay(1));

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalHour(1)); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalMinute(1)); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalSecond(1)); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalMillisecond(1)); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalMicrosecond(1)); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toStartOfInterval(toDate32('2022-09-16'), toIntervalNanosecond(1)); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT date_trunc('YEAR', toDate32('2022-09-16'));

SELECT date_trunc('QUARTER', toDate32('2022-09-16'));

SELECT date_trunc('MONTH', toDate32('2022-09-16'));

SELECT date_trunc('WEEK', toDate32('2022-09-16'));

SELECT date_trunc('DAY', toDate32('2022-09-16'));

SELECT date_trunc('HOUR', toDate32('2022-09-16')); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT date_trunc('MINUTE', toDate32('2022-09-16')); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT date_trunc('SECOND', toDate32('2022-09-16')); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT date_trunc('MILLISECOND', toDate32('2022-09-16')); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT date_trunc('MICROSECOND', toDate32('2022-09-16')); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT date_trunc('NANOSECOND', toDate32('2022-09-16')); -- {  serverError ILLEGAL_TYPE_OF_ARGUMENT }