SELECT *
FROM (
        SELECT 1
        FROM remote('127.0.0.{2,3}', currentDatabase(), numbers_10_00223)
        WITH TOTALS
    )
WHERE 1
GROUP BY 1;