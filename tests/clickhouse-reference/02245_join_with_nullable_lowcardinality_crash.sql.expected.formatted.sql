SELECT if(isNull(t0.country), t2.country, t0.country) AS country
FROM
    without_nullable AS t0
RIGHT JOIN with_nullable AS t2
    ON t0.country = t2.country
ORDER BY 1 DESC;