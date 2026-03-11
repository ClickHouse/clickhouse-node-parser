SELECT
    intDiv(number, 2) AS k,
    count(),
    argMax(toString(number), number)
FROM (
        SELECT *
        FROM remote('127.0.0.{2,3}', currentDatabase(), numbers500k)
        ORDER BY number ASC
    )
GROUP BY k
WITH TOTALS
ORDER BY k ASC
LIMIT 10;