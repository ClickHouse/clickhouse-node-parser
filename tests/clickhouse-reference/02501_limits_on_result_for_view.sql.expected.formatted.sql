-- test
SELECT *
FROM `02501_view`
SETTINGS max_result_rows = 1; -- { serverError TOO_MANY_ROWS_OR_BYTES }

SELECT sum(a)
FROM `02501_view`
SETTINGS max_result_rows = 1;