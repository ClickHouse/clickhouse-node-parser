SELECT
    x,
    sum(number),
    count()
FROM (
        SELECT
            t1.x,
            t2.number
        FROM
            t1
        CROSS JOIN numbers_mt(10000000) AS t2
        WHERE number <= x
    )
GROUP BY ALL
ORDER BY x ASC;