SELECT count()
FROM m3;

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN
        SELECT count()
        FROM m3
    )
WHERE like(`explain`, '%ReadFromPreparedSource (Optimized trivial count)%');

SELECT count(*)
FROM m3;

SELECT count(a)
FROM m3;

SELECT count(b)
FROM m3;

SELECT count() + 1
FROM m3;

SELECT count()
FROM replacing_m3;

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN
        SELECT count()
        FROM replacing_m3
    )
WHERE like(`explain`, '%ReadFromPreparedSource (Optimized trivial count)%');

SELECT count(*)
FROM replacing_m3;

SELECT count(a)
FROM replacing_m3;

SELECT count(b)
FROM replacing_m3;

SELECT count()
FROM replacing_m3 FINAL;

SELECT count(a)
FROM replacing_m3 FINAL;

SELECT count(b)
FROM replacing_m3 FINAL;