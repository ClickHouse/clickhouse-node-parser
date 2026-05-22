SELECT number
FROM numbers(10)
GROUP BY GROUPING SETS ((number), (number % 2)); -- { serverError NOT_IMPLEMENTED }

SELECT number
FROM numbers(10)
GROUP BY GROUPING SETS ((number), (number % 2)); -- { serverError NOT_IMPLEMENTED }