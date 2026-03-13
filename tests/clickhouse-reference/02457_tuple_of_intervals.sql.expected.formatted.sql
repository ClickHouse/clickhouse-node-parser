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