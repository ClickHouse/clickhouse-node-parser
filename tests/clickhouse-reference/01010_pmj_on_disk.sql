SELECT n, j FROM (SELECT number as n FROM numbers(4)) nums
ANY LEFT JOIN (
    SELECT number * 2 AS n, number + 10 AS j
    FROM numbers(4000)
) js2
USING n
ORDER BY n;
