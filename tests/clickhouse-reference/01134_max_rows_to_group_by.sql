SELECT 'test1', number FROM system.numbers GROUP BY number; -- { serverError TOO_MANY_ROWS }
SELECT 'test2', number FROM system.numbers GROUP BY number ORDER BY number;
SELECT 'test3', number FROM system.numbers GROUP BY number ORDER BY number;
SELECT 'test4', number FROM numbers(1000) GROUP BY number ORDER BY number; -- { serverError TOO_MANY_ROWS }
SELECT 'test5', number FROM numbers(1000) GROUP BY number ORDER BY number;
