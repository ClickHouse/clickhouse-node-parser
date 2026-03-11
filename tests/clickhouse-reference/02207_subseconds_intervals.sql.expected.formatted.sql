SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123456789', 9), toIntervalNanosecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.1234567', 7), toIntervalNanosecond(1));

SELECT toStartOfInterval(a, toIntervalNanosecond(1))
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456789', 9) AS a
    );

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123456789', 9), toIntervalNanosecond(1));

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.1234567', 7), toIntervalNanosecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123456789', 9), toIntervalNanosecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.1234567', 7), toIntervalNanosecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123456', 6), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.1234', 4), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.12345678', 8), toIntervalMicrosecond(1));

SELECT toStartOfInterval(a, toIntervalMicrosecond(1))
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.12345678', 8) AS a
    );

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123456', 6), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.1234', 4), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.12345678', 8), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123456', 6), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.1234', 4), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.12345678', 8), toIntervalMicrosecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123', 3), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.12', 2), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123456', 6), toIntervalMillisecond(1));

SELECT toStartOfInterval(a, toIntervalMillisecond(1))
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456', 6) AS a
    );

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123', 3), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.12', 2), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123456', 6), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123', 3), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.12', 2), toIntervalMillisecond(1));

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123456', 6), toIntervalMillisecond(1));

SELECT addNanoseconds(toDateTime64('1980-12-12 12:12:12.123456789', 9), 1);

SELECT addNanoseconds(toDateTime64('1980-12-12 12:12:12.1234567', 7), 1);

SELECT addNanoseconds(a, 1)
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456789', 9) AS a
    );

SELECT addNanoseconds(toDateTime64('1930-12-12 12:12:12.123456789', 9), 1);

SELECT addNanoseconds(toDateTime64('1930-12-12 12:12:12.1234567', 7), 1);

SELECT addNanoseconds(toDateTime64('2220-12-12 12:12:12.123456789', 9), 1);

SELECT addNanoseconds(toDateTime64('2220-12-12 12:12:12.1234567', 7), 1);

SELECT addMicroseconds(toDateTime64('1980-12-12 12:12:12.123456', 6), 1);

SELECT addMicroseconds(toDateTime64('1980-12-12 12:12:12.1234', 4), 1);

SELECT addMicroseconds(toDateTime64('1980-12-12 12:12:12.12345678', 8), 1);

SELECT addMicroseconds(a, 1)
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456', 6) AS a
    );

SELECT addMicroseconds(toDateTime64('1930-12-12 12:12:12.123456', 6), 1);

SELECT addMicroseconds(toDateTime64('1930-12-12 12:12:12.1234', 4), 1);

SELECT addMicroseconds(toDateTime64('1930-12-12 12:12:12.12345678', 8), 1);

SELECT addMicroseconds(toDateTime64('2220-12-12 12:12:12.123456', 6), 1);

SELECT addMicroseconds(toDateTime64('2220-12-12 12:12:12.1234', 4), 1);

SELECT addMicroseconds(toDateTime64('2220-12-12 12:12:12.12345678', 8), 1);

SELECT addMilliseconds(toDateTime64('1980-12-12 12:12:12.123', 3), 1);

SELECT addMilliseconds(toDateTime64('1980-12-12 12:12:12.12', 2), 1);

SELECT addMilliseconds(toDateTime64('1980-12-12 12:12:12.123456', 6), 1);

SELECT addMilliseconds(a, 1)
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123', 3) AS a
    );

SELECT addMilliseconds(toDateTime64('1930-12-12 12:12:12.123', 3), 1);

SELECT addMilliseconds(toDateTime64('1930-12-12 12:12:12.12', 2), 1);

SELECT addMilliseconds(toDateTime64('1930-12-12 12:12:12.123456', 6), 1);

SELECT addMilliseconds(toDateTime64('2220-12-12 12:12:12.123', 3), 1);

SELECT addMilliseconds(toDateTime64('2220-12-12 12:12:12.12', 2), 1);

SELECT addMilliseconds(toDateTime64('2220-12-12 12:12:12.123456', 6), 1);

SELECT subtractNanoseconds(toDateTime64('2023-01-01 00:00:00.0000000', 7, 'UTC'), 1);

SELECT subtractNanoseconds(toDateTime64('2023-01-01 00:00:00.0000000', 7, 'UTC'), 100);

SELECT subtractNanoseconds(toDateTime64('2023-01-01 00:00:00.0000000', 7, 'UTC'), -1);

SELECT subtractNanoseconds(toDateTime64('2023-01-01 00:00:00.0000000', 7, 'UTC'), -100);

SELECT subtractMicroseconds(toDateTime64('2023-01-01 00:00:00.0000', 4, 'UTC'), 1);

SELECT subtractMicroseconds(toDateTime64('2023-01-01 00:00:00.0000', 4, 'UTC'), 100);

SELECT subtractMicroseconds(toDateTime64('2023-01-01 00:00:00.0000', 4, 'UTC'), -1);

SELECT subtractMicroseconds(toDateTime64('2023-01-01 00:00:00.0000', 4, 'UTC'), -100);

SELECT subtractMilliseconds(toDateTime64('2023-01-01 00:00:00.0', 1, 'UTC'), 1);

SELECT subtractMilliseconds(toDateTime64('2023-01-01 00:00:00.0', 1, 'UTC'), 100);

SELECT subtractMilliseconds(toDateTime64('2023-01-01 00:00:00.0', 1, 'UTC'), -1);

SELECT subtractMilliseconds(toDateTime64('2023-01-01 00:00:00.0', 1, 'UTC'), -100);