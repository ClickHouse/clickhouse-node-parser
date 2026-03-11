SELECT CAST(1 AS UInt8);

SELECT CAST([] AS Array(UInt8));

SELECT CAST(1, 'UInt8');

SELECT substring('Hello, world', 8);

SELECT substring('Hello, world', 8, 5);

SELECT SUBSTRING('Hello, world', 8);

SELECT SUBSTRING('Hello, world', 8, 5);

SELECT trimLeft('abcdef', 'abc');

SELECT trimRight('abcdef', 'def');

SELECT trimBoth('abcdef', 'af');

SELECT TRIM(' abcdef ');

SELECT LTRIM(' abcdef ');

SELECT RTRIM(' abcdef ');

SELECT toYear(toDate('2022-01-01'));

SELECT EXTRACT('Hello, world', '^\\w+');

SELECT position('Hello', 'll');

SELECT POSITION('Hello', 'll');

SELECT plus(toDate('2022-01-01'), toIntervalYear(1));

SELECT plus(toIntervalYear(1), toDate('2022-01-01'));

SELECT plus(toDate('2022-01-01'), toIntervalYear(1));

SELECT plus(toIntervalYear(1), toDate('2022-01-01'));

SELECT plus(toDate('2022-01-01'), toIntervalYear(1));

SELECT plus(toIntervalYear(1), toDate('2022-01-01'));

SELECT plus(toDate('2022-01-01'), toIntervalYear(1));

SELECT plus(toIntervalYear(1), toDate('2022-01-01'));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT minus(toDate('2022-01-01'), toIntervalYear(1));

SELECT dateDiff('year', toDate('2021-01-01'), toDate('2022-01-01'));

SELECT dateDiff('year', toDate('2021-01-01'), toDate('2022-01-01'));

SELECT EXISTS((
        SELECT 1
    ));