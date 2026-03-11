SELECT
    toDateTime('2020-01-01 00:00:00', 'UTC') AS t,
    t + 1,
    toDate(t) + 1,
    t + toIntervalSecond(1),
    t + toIntervalDay(1),
    toTypeName(t + 1),
    toDateTime64(t, 3, 'UTC') + 1 AS dt64,
    toTypeName(dt64);