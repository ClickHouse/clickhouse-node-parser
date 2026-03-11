SELECT count()
FROM with_fill_date__fuzz_0
ORDER BY
    count(),
    count() IGNORE NULLS,
    max(d)
WITH FILL STEP toIntervalDay(10)
;
SELECT count()
FROM with_fill_date__fuzz_0
ORDER BY
    any(d32) RESPECT NULLS,
    any_respect_nulls(d32),
    max(d)
WITH FILL STEP toIntervalDay(10)
;
SELECT count()
FROM with_fill_date__fuzz_0
ORDER BY
    any(d32),
    any(d32) IGNORE NULLS,
    any(d32) RESPECT NULLS,
    any_respect_nulls(d32) IGNORE NULLS,
    any_respect_nulls(d32),
    sum(d33),
    sum(d33) IGNORE NULLS,
    max(d)
WITH FILL STEP toIntervalDay(10)
;
