SELECT count()
FROM
    mt
LEFT JOIN (
        SELECT 1 AS x
    ) AS js2
    USING (x)
PREWHERE x IN (1)
WHERE y = today();