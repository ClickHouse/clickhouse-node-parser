SELECT *
FROM t0 FINAL;

SELECT count()
FROM t0 FINAL
WHERE ((isNull(t0.c0)) = true);