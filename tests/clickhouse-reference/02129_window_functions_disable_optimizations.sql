SELECT if(number % 10 = 0, 1, 0) AS dummy,
sum(dummy) OVER w
FROM numbers(10)
WINDOW w AS (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW);
SELECT
    *,
    if((number % 2) = 0, 0.5, 1) AS a,
    30 AS b,
    sum(a * b) OVER (ORDER BY number ASC) AS s
FROM numbers(10);
SELECT
    *,
    if(number = 1, 1, 0) as a,
    max(a) OVER (ORDER BY number ASC) AS s
FROM numbers(10);
SELECT round(sum(log(2) * number), 6) AS k FROM numbers(10000)
GROUP BY (number % 2) * (number % 3), number % 3, number % 2
HAVING sum(log(2) * number) > 346.57353 ORDER BY k;
SELECT round(sum(log(2) * number), 6) AS k FROM numbers(10000)
GROUP BY (number % 2) * (number % 3), number % 3, number % 2
HAVING sum(log(2) * number) > 346.57353 ORDER BY k
SETTINGS enable_analyzer=1;
