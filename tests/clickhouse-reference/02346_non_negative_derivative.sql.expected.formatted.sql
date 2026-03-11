SELECT (
        SELECT
            ts,
            metric,
            nonNegativeDerivative(metric, ts) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
        FROM nnd
        LIMIT 5, 1
    ) = (
        SELECT
            ts,
            metric,
            nonNegativeDerivative(metric, ts, toIntervalSecond(1)) OVER (PARTITION BY metric ORDER BY ts ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
        FROM nnd
        LIMIT 5, 1
    );

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalNanosecond(3)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalMicrosecond(4)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalMillisecond(5)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalSecond(6)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 1 PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalMinute(7)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 2 FOLLOWING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalHour(8)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalDay(9)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalWeek(10)) OVER (PARTITION BY id > 3 ORDER BY ts ASC, metric ASC ROWS BETWEEN 1 PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalMonth(11)) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalQuarter(12)) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalYear(13)) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, 1, toIntervalNanosecond(3)) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative('string not datetime', ts, toIntervalNanosecond(3)) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric, ts, toIntervalNanosecond(3), id) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;

SELECT
    ts,
    metric,
    nonNegativeDerivative(metric) OVER (PARTITION BY metric ORDER BY ts ASC, metric ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING) AS deriv
FROM nnd;