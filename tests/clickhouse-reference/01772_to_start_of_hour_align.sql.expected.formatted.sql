SELECT toStartOfInterval(toDateTime('2021-03-23 03:58:00'), toIntervalHour(11));

SELECT toStartOfInterval(toDateTime('2021-03-23 13:58:00'), toIntervalHour(11));

SELECT toStartOfInterval(toDateTime('2021-03-23 23:58:00'), toIntervalHour(11));

SELECT toStartOfHour(toDateTime('2021-03-23 13:58:00', 'Asia/Kolkata'));

SELECT toStartOfInterval(toDateTime('2021-03-23 13:58:00', 'Asia/Kolkata'), toIntervalHour(6));

SELECT toStartOfInterval(toDateTime('2021-03-23 13:58:00', 'Asia/Kolkata'), toIntervalHour(66));

SELECT
    toDateTime('2010-03-28 00:00:00', 'Europe/Moscow') + toIntervalMinute(15 * number) AS src,
    toStartOfInterval(src, toIntervalHour(2)) AS rounded,
    toUnixTimestamp(src) AS t
FROM numbers(20);

SELECT
    toDateTime('2010-10-31 00:00:00', 'Europe/Moscow') + toIntervalMinute(15 * number) AS src,
    toStartOfInterval(src, toIntervalHour(2)) AS rounded,
    toUnixTimestamp(src) AS t
FROM numbers(20);

SELECT
    toDateTime('2020-04-05 00:00:00', 'Australia/Lord_Howe') + toIntervalMinute(15 * number) AS src,
    toStartOfInterval(src, toIntervalHour(2)) AS rounded,
    toUnixTimestamp(src) AS t
FROM numbers(20);

SELECT
    toDateTime('2020-10-04 00:00:00', 'Australia/Lord_Howe') + toIntervalMinute(15 * number) AS src,
    toStartOfInterval(src, toIntervalHour(2)) AS rounded,
    toUnixTimestamp(src) AS t
FROM numbers(20);