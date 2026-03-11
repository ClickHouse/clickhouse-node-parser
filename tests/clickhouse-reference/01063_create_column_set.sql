SELECT count()
FROM mt
ANY LEFT JOIN
(
    SELECT 1 AS x
) js2 USING (x)
PREWHERE x IN (1) WHERE y = today();
