SELECT count()
FROM remote('127.0.0.1', numbers(10))
GROUP BY and(isNull(9), row_number(1) OVER (ORDER BY 1 ASC));