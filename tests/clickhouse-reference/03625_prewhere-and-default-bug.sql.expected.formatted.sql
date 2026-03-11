SELECT 1
FROM tab
WHERE d > toDateTime(toDate('2000-01-01'))
    AND p IN ('a')
    AND 1 = 1
GROUP BY
    d,
    t,
    p;