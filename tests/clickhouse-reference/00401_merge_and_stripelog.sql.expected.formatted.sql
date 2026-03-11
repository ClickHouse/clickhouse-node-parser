SELECT
    x,
    count()
FROM merge_00401
GROUP BY x
ORDER BY x ASC;