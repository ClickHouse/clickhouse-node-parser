SELECT '---';

SELECT negate(toIntervalSecond(1));

SELECT addTupleOfIntervals('2022-10-11'::Date, tuple(toIntervalDay(1)));

SELECT subtractTupleOfIntervals('2022-10-11'::Date, tuple(toIntervalDay(1)));

SELECT addInterval(tuple(toIntervalSecond(1)), toIntervalSecond(1));

SELECT subtractInterval(tuple(toIntervalSecond(1)), toIntervalSecond(1));

SELECT addTupleOfIntervals('2022-10-11'::Date, (INTERVAL 1 DAY, INTERVAL 1 MONTH));

SELECT subtractTupleOfIntervals('2022-10-11'::Date, (INTERVAL 1 DAY, INTERVAL 1 MONTH));

SELECT addInterval((INTERVAL 1 DAY, INTERVAL 1 SECOND), toIntervalSecond(1));

SELECT subtractInterval(tuple(toIntervalDay(1), toIntervalSecond(1)), toIntervalSecond(1));

SELECT addInterval(tuple(), toIntervalMonth(1));

SELECT subtractInterval(tuple(), toIntervalSecond(1));

SELECT '2022-10-11'::Date + tuple(toIntervalDay(1));

SELECT '2022-10-11'::Date - tuple(toIntervalDay(1));

SELECT tuple(toIntervalDay(1)) + '2022-10-11'::Date;

SELECT tuple(toIntervalDay(1)) - '2022-10-11'::Date; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

WITH tuple(toIntervalSecond(1)) + toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH tuple(toIntervalSecond(1)) - toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH toIntervalSecond(1) + tuple(toIntervalSecond(1)) AS expr

SELECT
    expr,
    toTypeName(expr); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

WITH toIntervalSecond(1) - tuple(toIntervalSecond(1)) AS expr

SELECT
    expr,
    toTypeName(expr); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

WITH toIntervalSecond(1) + toIntervalSecond(1) + toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH toIntervalHour(1) + toIntervalSecond(1) + toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH toIntervalSecond(1) + toIntervalHour(1) + toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH toIntervalSecond(1) + toIntervalSecond(1) + toIntervalHour(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH negate(toIntervalSecond(1)) - toIntervalSecond(1) - toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH negate(toIntervalHour(1)) - toIntervalSecond(1) - toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH negate(toIntervalSecond(1)) - toIntervalHour(1) - toIntervalSecond(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH negate(toIntervalSecond(1)) - toIntervalSecond(1) - toIntervalHour(1) AS expr

SELECT
    expr,
    toTypeName(expr);

WITH '2022-01-30'::Date + toIntervalMonth(1) + toIntervalDay(1) AS e1,

'2022-01-30'::Date + ((toIntervalMonth(1) + toIntervalDay(1))) AS e2,

'2022-01-30'::Date + (INTERVAL 1 MONTH, INTERVAL 1 DAY) AS e3,

'2022-01-30'::Date + tuple(toIntervalMonth(1), toIntervalDay(1)) AS e4

SELECT
    e1 == e2
    AND e2 == e3
    AND e3 == e4,
    e1;

WITH '2022-01-30'::Date + toIntervalDay(1) + toIntervalMonth(1) AS e1,

'2022-01-30'::Date + ((toIntervalDay(1) + toIntervalMonth(1))) AS e2,

'2022-01-30'::Date + (INTERVAL 1 DAY, INTERVAL 1 MONTH) AS e3,

'2022-01-30'::Date + tuple(toIntervalDay(1), toIntervalMonth(1)) AS e4

SELECT
    e1 == e2
    AND e2 == e3
    AND e3 == e4,
    e1;

WITH '2022-10-11'::Date + toIntervalSecond(-1) + toIntervalMinute(2) + toIntervalMonth(-3) + toIntervalYear(1) AS e1,

'2022-10-11'::Date + ((toIntervalSecond(-1) + toIntervalMinute(2) + toIntervalMonth(-3) + toIntervalYear(1))) AS e2,

'2022-10-11'::Date + (INTERVAL -1 SECOND, INTERVAL 2 MINUTE, INTERVAL -3 MONTH, INTERVAL 1 YEAR) AS e3,

'2022-10-11'::Date + tuple(toIntervalSecond(-1), toIntervalMinute(2), toIntervalMonth(-3), toIntervalYear(1)) AS e4

SELECT
    e1 == e2
    AND e2 == e3
    AND e3 == e4,
    e1;

WITH '2022-10-11'::DateTime - toIntervalQuarter(1) - toIntervalWeek(-3) - toIntervalYear(1) - toIntervalHour(1) AS e1,

'2022-10-11'::DateTime + ((negate(toIntervalQuarter(1)) - toIntervalWeek(-3) - toIntervalYear(1) - toIntervalHour(1))) AS e2,

'2022-10-11'::DateTime - (INTERVAL 1 QUARTER, INTERVAL -3 WEEK, INTERVAL 1 YEAR, INTERVAL 1 HOUR) AS e3,

'2022-10-11'::DateTime - tuple(toIntervalQuarter(1), toIntervalWeek(-3), toIntervalYear(1), toIntervalHour(1)) AS e4

SELECT
    e1 == e2
    AND e2 == e3
    AND e3 == e4,
    e1;

WITH '2022-10-11'::DateTime64 - toIntervalYear(1) - toIntervalMonth(4) - toIntervalSecond(1) AS e1,

'2022-10-11'::DateTime64 + ((negate(toIntervalYear(1)) - toIntervalMonth(4) - toIntervalSecond(1))) AS e2,

'2022-10-11'::DateTime64 - (INTERVAL 1 YEAR, INTERVAL 4 MONTH, INTERVAL 1 SECOND) AS e3,

'2022-10-11'::DateTime64 - tuple(toIntervalYear(1), toIntervalMonth(4), toIntervalSecond(1)) AS e4

SELECT
    e1 == e2
    AND e2 == e3
    AND e3 == e4,
    e1;