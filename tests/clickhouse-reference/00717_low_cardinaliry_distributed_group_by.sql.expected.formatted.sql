SELECT
    a,
    count()
FROM dist_00717
GROUP BY a
ORDER BY
    a ASC,
    count() ASC
LIMIT 10;