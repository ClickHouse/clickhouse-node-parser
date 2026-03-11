SELECT count()
FROM dst;

SELECT
    count(),
    key
FROM dst
WHERE `step` = 30
GROUP BY key
ORDER BY key ASC
LIMIT 5;