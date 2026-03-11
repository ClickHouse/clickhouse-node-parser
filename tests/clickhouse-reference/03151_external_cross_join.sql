SELECT x, sum(number), count(), FROM (
    SELECT t1.x, t2.number
    FROM t1
    CROSS JOIN numbers_mt(10_000_000) t2
    WHERE number <= x
)
GROUP BY ALL
ORDER BY x
;
