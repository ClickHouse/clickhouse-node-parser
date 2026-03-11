SELECT
    k,
    count()
FROM (
        SELECT number % 5 AS k
        FROM `system`.numbers
        LIMIT 100
    )
GROUP BY k
WITH TOTALS
ORDER BY k ASC
FORMAT Vertical;