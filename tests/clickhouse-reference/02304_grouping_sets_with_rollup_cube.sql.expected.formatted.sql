SELECT number
FROM numbers(10)
GROUP BY GROUPING SETS ((number), (number % 2));

SELECT number
FROM numbers(10)
GROUP BY GROUPING SETS ((number), (number % 2));