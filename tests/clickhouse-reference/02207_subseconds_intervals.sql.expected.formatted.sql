SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123456789', 9), toIntervalNanosecond(1)); -- In normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.1234567', 7), toIntervalNanosecond(1)); -- In normal range, source scale less than result

SELECT toStartOfInterval(a, toIntervalNanosecond(1))
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456789', 9) AS a
    ); -- Non-constant argument

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123456789', 9), toIntervalNanosecond(1)); -- Below normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.1234567', 7), toIntervalNanosecond(1)); -- Below normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123456789', 9), toIntervalNanosecond(1)); -- Above normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.1234567', 7), toIntervalNanosecond(1)); -- Above normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123456', 6), toIntervalMicrosecond(1)); -- In normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.1234', 4), toIntervalMicrosecond(1)); -- In normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.12345678', 8), toIntervalMicrosecond(1)); -- In normal range, source scale greater than result

SELECT toStartOfInterval(a, toIntervalMicrosecond(1))
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.12345678', 8) AS a
    ); -- Non-constant argument

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123456', 6), toIntervalMicrosecond(1)); -- Below normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.1234', 4), toIntervalMicrosecond(1)); -- Below normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.12345678', 8), toIntervalMicrosecond(1)); -- Below normal range, source scale greater than result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123456', 6), toIntervalMicrosecond(1)); -- Above normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.1234', 4), toIntervalMicrosecond(1)); -- Above normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.12345678', 8), toIntervalMicrosecond(1)); -- Above normal range, source scale greater than result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123', 3), toIntervalMillisecond(1)); -- In normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.12', 2), toIntervalMillisecond(1)); -- In normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('1980-12-12 12:12:12.123456', 6), toIntervalMillisecond(1)); -- In normal range, source scale greater than result

SELECT toStartOfInterval(a, toIntervalMillisecond(1))
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456', 6) AS a
    ); -- Non-constant argument

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123', 3), toIntervalMillisecond(1)); -- Below normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.12', 2), toIntervalMillisecond(1)); -- Below normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('1930-12-12 12:12:12.123456', 6), toIntervalMillisecond(1)); -- Below normal range, source scale greater than result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123', 3), toIntervalMillisecond(1)); -- Above normal range, source scale matches result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.12', 2), toIntervalMillisecond(1)); -- Above normal range, source scale less than result

SELECT toStartOfInterval(toDateTime64('2220-12-12 12:12:12.123456', 6), toIntervalMillisecond(1)); -- Above normal range, source scale greater than result

SELECT addNanoseconds(toDateTime64('1980-12-12 12:12:12.123456789', 9), 1); -- In normal range, source scale matches result

SELECT addNanoseconds(toDateTime64('1980-12-12 12:12:12.1234567', 7), 1); -- In normal range, source scale less than result

SELECT addNanoseconds(a, 1)
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456789', 9) AS a
    ); -- Non-constant argument

SELECT addNanoseconds(toDateTime64('1930-12-12 12:12:12.123456789', 9), 1); -- Below normal range, source scale matches result

SELECT addNanoseconds(toDateTime64('1930-12-12 12:12:12.1234567', 7), 1); -- Below normal range, source scale less than result

SELECT addNanoseconds(toDateTime64('2220-12-12 12:12:12.123456789', 9), 1); -- Above normal range, source scale matches result

SELECT addNanoseconds(toDateTime64('2220-12-12 12:12:12.1234567', 7), 1); -- Above normal range, source scale less than result

SELECT addMicroseconds(toDateTime64('1980-12-12 12:12:12.123456', 6), 1); -- In normal range, source scale matches result

SELECT addMicroseconds(toDateTime64('1980-12-12 12:12:12.1234', 4), 1); -- In normal range, source scale less than result

SELECT addMicroseconds(toDateTime64('1980-12-12 12:12:12.12345678', 8), 1); -- In normal range, source scale greater than result

SELECT addMicroseconds(a, 1)
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123456', 6) AS a
    ); -- Non-constant argument

SELECT addMicroseconds(toDateTime64('1930-12-12 12:12:12.123456', 6), 1); -- Below normal range, source scale matches result

SELECT addMicroseconds(toDateTime64('1930-12-12 12:12:12.1234', 4), 1); -- Below normal range, source scale less than result

SELECT addMicroseconds(toDateTime64('1930-12-12 12:12:12.12345678', 8), 1); -- Below normal range, source scale greater than result

SELECT addMicroseconds(toDateTime64('2220-12-12 12:12:12.123456', 6), 1); -- Above normal range, source scale matches result

SELECT addMicroseconds(toDateTime64('2220-12-12 12:12:12.1234', 4), 1); -- Above normal range, source scale less than result

SELECT addMicroseconds(toDateTime64('2220-12-12 12:12:12.12345678', 8), 1); -- Above normal range, source scale greater than result

SELECT addMilliseconds(toDateTime64('1980-12-12 12:12:12.123', 3), 1); -- In normal range, source scale matches result

SELECT addMilliseconds(toDateTime64('1980-12-12 12:12:12.12', 2), 1); -- In normal range, source scale less than result

SELECT addMilliseconds(toDateTime64('1980-12-12 12:12:12.123456', 6), 1); -- In normal range, source scale greater than result

SELECT addMilliseconds(a, 1)
FROM (
        SELECT toDateTime64('1980-12-12 12:12:12.123', 3) AS a
    ); -- Non-constant argument

SELECT addMilliseconds(toDateTime64('1930-12-12 12:12:12.123', 3), 1); -- Below normal range, source scale matches result

SELECT addMilliseconds(toDateTime64('1930-12-12 12:12:12.12', 2), 1); -- Below normal range, source scale less than result

SELECT addMilliseconds(toDateTime64('1930-12-12 12:12:12.123456', 6), 1); -- Below normal range, source scale greater than result

SELECT addMilliseconds(toDateTime64('2220-12-12 12:12:12.123', 3), 1); -- Above normal range, source scale matches result

SELECT addMilliseconds(toDateTime64('2220-12-12 12:12:12.12', 2), 1); -- Above normal range, source scale less than result

SELECT addMilliseconds(toDateTime64('2220-12-12 12:12:12.123456', 6), 1); -- Above normal range, source scale greater than result

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