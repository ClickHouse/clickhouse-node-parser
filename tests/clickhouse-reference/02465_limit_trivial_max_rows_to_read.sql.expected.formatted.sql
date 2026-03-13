SELECT number
FROM numbers(30); -- { serverError TOO_MANY_ROWS }

SELECT number
FROM numbers(30)
LIMIT 21; -- { serverError TOO_MANY_ROWS }

SELECT number
FROM numbers(30)
LIMIT 1;

SELECT number
FROM numbers(5);

SELECT a
FROM t_max_rows_to_read
LIMIT 1;

SELECT a
FROM t_max_rows_to_read
LIMIT 11
OFFSET 11; -- { serverError TOO_MANY_ROWS }

SELECT a
FROM t_max_rows_to_read
WHERE a > 50
LIMIT 1; -- { serverError TOO_MANY_ROWS }