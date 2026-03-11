SELECT
    a,
    count()
FROM low_null_float
GROUP BY a
ORDER BY
    count() DESC,
    a ASC
LIMIT 10;