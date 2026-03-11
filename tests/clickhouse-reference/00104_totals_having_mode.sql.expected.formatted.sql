SELECT
    number,
    count()
FROM (
        SELECT *
        FROM `system`.numbers
        LIMIT 100000
    )
GROUP BY number
WITH TOTALS
HAVING number % 3 = 0
ORDER BY number ASC
LIMIT 1;