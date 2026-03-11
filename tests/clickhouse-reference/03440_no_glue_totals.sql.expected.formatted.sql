SELECT
    number,
    count()
FROM numbers(5)
GROUP BY number
WITH TOTALS
ORDER BY number ASC
FORMAT PrettyCompact;