SELECT count() FROM system.numbers FORMAT Null SETTINGS max_rows_to_read = 1, read_overflow_mode = 'break';
SELECT max(x) - min(x) FROM t;
SELECT count() FROM system.numbers SETTINGS max_rows_to_read = 1, read_overflow_mode = 'throw'; -- { serverError TOO_MANY_ROWS }
SELECT number, count() FROM numbers(100000) GROUP BY number FORMAT Null SETTINGS max_rows_to_group_by = 1, group_by_overflow_mode = 'any';
