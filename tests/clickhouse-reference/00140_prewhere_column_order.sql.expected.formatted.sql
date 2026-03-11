SELECT
    d,
    a,
    a1,
    b
FROM `prewhere`
PREWHERE like(a, 'hello%')
ORDER BY a1 ASC;