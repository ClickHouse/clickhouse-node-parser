SELECT 'dt64 < const dt'
FROM dt64test
WHERE dt64_column < toDateTime('2020-01-13 13:37:00');

SELECT 'dt64 < dt'
FROM dt64test
WHERE dt64_column < materialize(toDateTime('2020-01-13 13:37:00'));

SELECT 'dt < const dt64'
FROM dt64test
WHERE dt_column < toDateTime64('2020-01-13 13:37:00', 3);

SELECT 'dt < dt64'
FROM dt64test
WHERE dt_column < materialize(toDateTime64('2020-01-13 13:37:00', 3));

SELECT 'dt64 <= const dt'
FROM dt64test
WHERE dt64_column <= toDateTime('2020-01-13 13:37:00');

SELECT 'dt64 <= dt'
FROM dt64test
WHERE dt64_column <= materialize(toDateTime('2020-01-13 13:37:00'));

SELECT 'dt <= const dt64'
FROM dt64test
WHERE dt_column <= toDateTime64('2020-01-13 13:37:00', 3);

SELECT 'dt <= dt64'
FROM dt64test
WHERE dt_column <= materialize(toDateTime64('2020-01-13 13:37:00', 3));

SELECT 'dt64 = const dt'
FROM dt64test
WHERE dt64_column = toDateTime('2020-01-13 13:37:00');

SELECT 'dt64 = dt'
FROM dt64test
WHERE dt64_column = materialize(toDateTime('2020-01-13 13:37:00'));

SELECT 'dt = const dt64'
FROM dt64test
WHERE dt_column = toDateTime64('2020-01-13 13:37:00', 3);

SELECT 'dt = dt64'
FROM dt64test
WHERE dt_column = materialize(toDateTime64('2020-01-13 13:37:00', 3));

SELECT 'dt64 >= const dt'
FROM dt64test
WHERE dt64_column >= toDateTime('2020-01-13 13:37:00');

SELECT 'dt64 >= dt'
FROM dt64test
WHERE dt64_column >= materialize(toDateTime('2020-01-13 13:37:00'));

SELECT 'dt >= const dt64'
FROM dt64test
WHERE dt_column >= toDateTime64('2020-01-13 13:37:00', 3);

SELECT 'dt >= dt64'
FROM dt64test
WHERE dt_column >= materialize(toDateTime64('2020-01-13 13:37:00', 3));

SELECT 'dt64 > const dt'
FROM dt64test
WHERE dt64_column > toDateTime('2020-01-13 13:37:00');

SELECT 'dt64 > dt'
FROM dt64test
WHERE dt64_column > materialize(toDateTime('2020-01-13 13:37:00'));

SELECT 'dt > const dt64'
FROM dt64test
WHERE dt_column > toDateTime64('2020-01-13 13:37:00', 3);

SELECT 'dt > dt64'
FROM dt64test
WHERE dt_column > materialize(toDateTime64('2020-01-13 13:37:00', 3));

SELECT 'dt64 != const dt'
FROM dt64test
WHERE dt64_column != toDateTime('2020-01-13 13:37:00');

SELECT 'dt64 != dt'
FROM dt64test
WHERE dt64_column != materialize(toDateTime('2020-01-13 13:37:00'));

SELECT 'dt != const dt64'
FROM dt64test
WHERE dt_column != toDateTime64('2020-01-13 13:37:00', 3);

SELECT 'dt != dt64'
FROM dt64test
WHERE dt_column != materialize(toDateTime64('2020-01-13 13:37:00', 3));