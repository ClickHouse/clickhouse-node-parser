SELECT
    s,
    sum(n)
FROM v
GROUP BY s
FORMAT Null;