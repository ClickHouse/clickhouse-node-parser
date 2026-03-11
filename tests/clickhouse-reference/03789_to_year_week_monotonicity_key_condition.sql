SELECT * FROM t
WHERE toYearWeek(s) = toYearWeek('2020-01-2 00:00:00');
SELECT * FROM t
WHERE toWeek(d) = toWeek(toDate32('2020-12-31'));
SELECT * FROM t
WHERE toWeek(s) = toWeek('2020-02-3 00:00:00');
SELECT count()
FROM t
WHERE toWeek(dt) = toWeek(toDateTime('2020-01-15 00:00:00')) SETTINGS force_primary_key = 1, max_rows_to_read = 169;
