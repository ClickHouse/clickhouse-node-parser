SELECT parseDateTime64BestEffort();

SELECT parseDateTime64BestEffort(123);

SELECT parseDateTime64BestEffort('foo');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', 'bar');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', 3, 4);

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', 3, 'baz');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', materialize(3), 4);

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', 3, materialize('UTC'));

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184012345678910111213141516171819Z', 3, 'UTC');

SELECT parseDateTime64BestEffortOrNull('2020-05-14T03:37:03.253184Z', 3, 'UTC');

SELECT parseDateTime64BestEffortOrNull('foo', 3, 'UTC');

SELECT parseDateTime64BestEffortOrZero('2020-05-14T03:37:03.253184Z', 3, 'UTC');

SELECT parseDateTime64BestEffortOrZero('bar', 3, 'UTC');

SELECT parseDateTime64BestEffort(materialize('2020-05-14T03:37:03.253184Z'), 3, 'UTC');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', 3, 'UTC');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184Z', 3, 'Europe/Minsk');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03.253184', 3, 'UTC');

SELECT parseDateTime64BestEffort('2020-05-14T03:37:03', 3, 'UTC');

SELECT parseDateTime64BestEffort('2020-05-14 03:37:03', 3, 'UTC');

SELECT parseDateTime64BestEffort('1640649600123', 3, 'UTC');

SELECT parseDateTime64BestEffort('1640649600123', 1, 'UTC');

SELECT parseDateTime64BestEffort('1640649600123', 6, 'UTC');