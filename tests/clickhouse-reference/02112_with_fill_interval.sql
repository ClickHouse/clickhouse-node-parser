CREATE TABLE with_fill_date (d Date, d32 Date32) ENGINE = Memory;
SELECT d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 1 DAY LIMIT 5;
SELECT toStartOfWeek(d) as d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 1 WEEK LIMIT 5;
SELECT toStartOfMonth(d) as d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 1 MONTH LIMIT 5;
SELECT toStartOfMonth(d) as d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL
    FROM toDate('2020-01-01')
    TO toDate('2021-01-01')
    STEP INTERVAL 3 MONTH;
SELECT d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 1 HOUR LIMIT 5; -- { serverError INVALID_WITH_FILL_EXPRESSION }
SELECT d32, count() FROM with_fill_date GROUP BY d32 ORDER BY d32 WITH FILL STEP INTERVAL 1 DAY LIMIT 5;
SELECT toStartOfWeek(d32) as d32, count() FROM with_fill_date GROUP BY d32 ORDER BY d32 WITH FILL STEP INTERVAL 1 WEEK LIMIT 5;
SELECT toStartOfMonth(d32) as d32, count() FROM with_fill_date GROUP BY d32 ORDER BY d32 WITH FILL STEP INTERVAL 1 MONTH LIMIT 5;
SELECT toStartOfMonth(d32) as d32, count() FROM with_fill_date GROUP BY d32 ORDER BY d32 WITH FILL
    FROM toDate('2020-01-01')
    TO toDate('2021-01-01')
    STEP INTERVAL 3 MONTH;
CREATE TABLE with_fill_date (d DateTime('UTC'), d64 DateTime64(3, 'UTC')) ENGINE = Memory;
SELECT d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 15 MINUTE LIMIT 5;
SELECT toStartOfHour(d) as d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 6 HOUR LIMIT 5;
SELECT toStartOfDay(d) as d, count() FROM with_fill_date GROUP BY d ORDER BY d WITH FILL STEP INTERVAL 10 DAY LIMIT 5;
SELECT d64, count() FROM with_fill_date GROUP BY d64 ORDER BY d64 WITH FILL STEP INTERVAL 15 MINUTE LIMIT 5;
SELECT toStartOfHour(d64) as d64, count() FROM with_fill_date GROUP BY d64 ORDER BY d64 WITH FILL STEP INTERVAL 6 HOUR LIMIT 5;
SELECT toStartOfDay(d64) as d64, count() FROM with_fill_date GROUP BY d64 ORDER BY d64 WITH FILL STEP INTERVAL 10 DAY LIMIT 5;
SELECT number FROM numbers(100) ORDER BY number WITH FILL STEP INTERVAL 1 HOUR; -- { serverError INVALID_WITH_FILL_EXPRESSION }
CREATE TABLE with_fill_date (d Date, id UInt32) ENGINE = Memory;
SELECT toStartOfMonth(d) as d, id, count() FROM with_fill_date
GROUP BY d, id
ORDER BY
d WITH FILL
    FROM toDate('2020-01-01')
    TO toDate('2020-05-01')
    STEP INTERVAL 1 MONTH,
id WITH FILL FROM 1 TO 5;
SELECT d FROM (SELECT toDate(1) AS d)
ORDER BY d DESC WITH FILL FROM toDate(3) TO toDate(0) STEP INTERVAL -1 DAY;
