SELECT
    intDiv(number, 2) AS k,
    count(),
    argMax(toString(number), number)
FROM (
        SELECT number
        FROM `system`.numbers
        LIMIT 500000
    )
GROUP BY k
WITH TOTALS
ORDER BY k ASC
LIMIT 10;