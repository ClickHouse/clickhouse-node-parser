SELECT
    date_trunc('month', d),
    SUM(c)
FROM t FINAL
WHERE f2 = 'x'
GROUP BY 1;

SELECT count()
FROM t FINAL;