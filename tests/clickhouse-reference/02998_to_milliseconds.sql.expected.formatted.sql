SELECT toMillisecond();

SELECT toMillisecond('string');

SELECT toMillisecond(toDate('2024-02-28'));

SELECT toMillisecond(toDate32('2024-02-28'));

SELECT
    toDateTime('2023-04-21 10:20:30') AS dt,
    toMillisecond(dt),
    toMillisecond(materialize(dt));

SELECT
    toDateTime64('2023-04-21 10:20:30', 0) AS dt64,
    toMillisecond(dt64),
    toMillisecond(materialize(dt64));

SELECT
    toDateTime64('2023-04-21 10:20:30.123', 3) AS dt64,
    toMillisecond(dt64),
    toMillisecond(materialize(dt64));

SELECT
    toDateTime64('2023-04-21 10:20:30.123456', 6) AS dt64,
    toMillisecond(dt64),
    toMillisecond(materialize(dt64));

SELECT
    toDateTime64('2023-04-21 10:20:30.123456789', 9) AS dt64,
    toMillisecond(dt64),
    toMillisecond(materialize(dt64));

SELECT MILLISECOND(toDateTime64('2023-04-21 10:20:30.123456', 2));

SELECT
    toNullable(toDateTime('2023-04-21 10:20:30')) AS dt,
    toMillisecond(dt);

SELECT
    toLowCardinality(toDateTime('2023-04-21 10:20:30')) AS dt,
    toMillisecond(dt);