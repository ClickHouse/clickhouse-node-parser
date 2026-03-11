SELECT
    x,
    count()
FROM ma_dist
GROUP BY x
ORDER BY x ASC;

SELECT arrayFilter(y -> y = x, [x]) AS f
FROM ma_dist
ORDER BY f ASC;