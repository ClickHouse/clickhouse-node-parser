SELECT test_function(number, number) AS a
FROM numbers(10)
GROUP BY a
ORDER BY a ASC;