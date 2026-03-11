SELECT CAST('1234' AS UInt32);

SELECT
    CAST('1234' AS lhs AS UInt32),
    lhs;

SELECT
    CAST('1234' AS lhs AS UInt32),
    lhs;

SELECT
    CAST(('1234' AS lhs) AS UInt32),
    lhs;

SELECT
    CAST((('1234' AS lhs)) AS rhs AS UInt32),
    rhs;

SELECT
    CAST((('1234' AS lhs)) AS rhs AS UInt32),
    rhs;

SELECT cast('1234', 'UInt32');

SELECT
    cast('1234' AS lhs, 'UInt32'),
    lhs;

SELECT
    cast('1234' AS lhs, 'UInt32'),
    lhs;

SELECT
    cast('1234', 'UInt32' AS rhs),
    rhs;

SELECT
    cast('1234', 'UInt32' AS rhs),
    rhs;

SELECT
    cast('1234' AS lhs, 'UInt32' AS rhs),
    lhs,
    rhs;

SELECT
    cast('1234' AS lhs, 'UInt32' AS rhs),
    lhs,
    rhs;

SELECT substring('1234', 2);

SELECT
    substring('1234' AS lhs, 2),
    lhs;

SELECT
    substring('1234' AS lhs, 2),
    lhs;

SELECT
    substring('1234', 2 AS rhs),
    rhs;

SELECT
    substring('1234', 2 AS rhs),
    rhs;

SELECT
    substring('1234' AS lhs, 2 AS rhs),
    lhs,
    rhs;

SELECT
    substring('1234' AS lhs, 2 AS rhs),
    lhs,
    rhs;

SELECT
    substring(('1234' AS lhs), (2 AS rhs)),
    lhs,
    rhs;

SELECT substring('1234', 2, 2);

SELECT
    substring('1234', 2, 2 AS lhs),
    lhs;

SELECT
    substring('1234', 2, 2 AS lhs),
    lhs;

SELECT
    substring('1234' AS arg_1, 2 AS arg_2, 3 AS arg_3),
    arg_1,
    arg_2,
    arg_3;

SELECT
    substring('1234' AS arg_1, 2 AS arg_2, 3 AS arg_3),
    arg_1,
    arg_2,
    arg_3;

SELECT
    trimLeft('abca' AS arg_2, 'a' AS arg_1),
    arg_1,
    arg_2;

SELECT
    trimLeft('abca' AS arg_2, 'a' AS arg_1),
    arg_1,
    arg_2;

SELECT
    trimLeft('abca' AS arg_2, 'a'),
    arg_2;

SELECT
    trimLeft('abca' AS arg_2, 'a'),
    arg_2;

SELECT
    trimLeft('abca', 'a' AS arg_1),
    arg_1;

SELECT
    trimLeft('abca', 'a' AS arg_1),
    arg_1;

SELECT trimLeft('abca', 'a');

SELECT
    trimRight('abca' AS arg_2, 'a' AS arg_1),
    arg_1,
    arg_2;

SELECT
    trimRight('abca' AS arg_2, 'a' AS arg_1),
    arg_1,
    arg_2;

SELECT
    trimBoth('abca' AS arg_2, 'a' AS arg_1),
    arg_1,
    arg_2;

SELECT
    trimBoth('abca' AS arg_2, 'a' AS arg_1),
    arg_1,
    arg_2;

SELECT trimLeft('abc', concat(''));

SELECT trimLeft('abc', concat('a', 'b'));

SELECT
    toDayOfMonth(toDate('2019-05-05') AS arg_1),
    arg_1;

SELECT
    toDayOfMonth(toDate('2019-05-05') AS arg_1),
    arg_1;

SELECT
    extract('1234' AS arg_1, '123' AS arg_2),
    arg_1,
    arg_2;

SELECT
    extract('1234' AS arg_1, '123' AS arg_2),
    arg_1,
    arg_2;

SELECT
    position(('1234' AS arg_2), ('123' AS arg_1)),
    arg_1,
    arg_2;

SELECT
    position('123' AS arg_1, '1234' AS arg_2),
    arg_1,
    arg_2;

SELECT
    position('123' AS arg_1, '1234' AS arg_2),
    arg_1,
    arg_2;

SELECT
    plus(toDate('2019-05-05') AS arg_2, toIntervalDay(1 AS arg_1)),
    arg_1,
    arg_2;

SELECT
    plus(toDate('2019-05-05') AS arg_2, toIntervalDay(1 AS arg_1)),
    arg_1,
    arg_2;

SELECT
    minus(toDate('2019-05-05') AS arg_2, toIntervalDay(1 AS arg_1)),
    arg_1,
    arg_2;

SELECT
    minus(toDate('2019-05-05') AS arg_2, toIntervalDay(1 AS arg_1)),
    arg_1,
    arg_2;

SELECT
    dateDiff('day', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2),
    arg_1,
    arg_2;

SELECT
    dateDiff('day', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2),
    arg_1,
    arg_2;

SELECT
    dateDiff('day', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2, 'UTC'),
    arg_1,
    arg_2;

SELECT
    dateDiff('day', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2, 'UTC'),
    arg_1,
    arg_2;

SELECT
    dateDiff('DAY', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2),
    arg_1,
    arg_2;

SELECT
    dateDiff('DAY', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2),
    arg_1,
    arg_2;

SELECT
    dateDiff('DAY', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2, 'UTC'),
    arg_1,
    arg_2;

SELECT
    dateDiff('DAY', toDate('2019-05-05') AS arg_1, toDate('2019-05-06') AS arg_2, 'UTC'),
    arg_1,
    arg_2;