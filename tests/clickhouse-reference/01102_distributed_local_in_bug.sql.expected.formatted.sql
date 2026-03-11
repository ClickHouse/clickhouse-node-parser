SELECT 0
FROM hits_layer AS hl
PREWHERE WatchID IN (
        SELECT 0
        FROM visits_layer AS vl
    )
WHERE 0;