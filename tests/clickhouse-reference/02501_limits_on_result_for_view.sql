-- test
SELECT * from 02501_view settings max_result_rows = 1; -- { serverError TOO_MANY_ROWS_OR_BYTES }
SELECT sum(a) from 02501_view settings max_result_rows = 1;
