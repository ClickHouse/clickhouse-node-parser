SET session_timezone='Europe/Amsterdam';
CREATE TABLE with_fill_staleness (a DateTime, b DateTime, c UInt64) ENGINE = MergeTree ORDER BY a;
INSERT INTO with_fill_staleness
SELECT
    toDateTime('2016-06-15 23:00:00') + number AS a, a as b, number as c
FROM numbers(30)
WHERE (number % 5) == 0;
SELECT a, c, 'original' as original FROM with_fill_staleness ORDER BY a ASC WITH FILL INTERPOLATE (c);
SELECT a, c, 'original' as original FROM with_fill_staleness ORDER BY a ASC WITH FILL STALENESS INTERVAL 1 SECOND INTERPOLATE (c);
SELECT a, c, 'original' as original FROM with_fill_staleness ORDER BY a ASC WITH FILL STALENESS INTERVAL 3 SECOND INTERPOLATE (c);
SELECT a, c, 'original' as original FROM with_fill_staleness ORDER BY a DESC WITH FILL STALENESS INTERVAL -2 SECOND INTERPOLATE (c);
SELECT a, c, 'original' as original FROM with_fill_staleness ORDER BY a ASC WITH FILL TO toDateTime('2016-06-15 23:00:40') STEP 3 STALENESS INTERVAL 7 SECOND INTERPOLATE (c);
SELECT a, b, c, 'original' as original FROM with_fill_staleness ORDER BY a ASC WITH FILL STALENESS INTERVAL 2 SECOND, b ASC WITH FILL FROM 0 TO 3 INTERPOLATE (c);
SELECT a, b, c, 'original' as original FROM with_fill_staleness ORDER BY a ASC WITH FILL STALENESS INTERVAL 2 SECOND, b ASC WITH FILL TO toDateTime('2016-06-15 23:01:00') STEP 2 STALENESS 5 INTERPOLATE (c);
