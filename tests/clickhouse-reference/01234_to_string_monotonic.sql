SELECT s FROM test1 WHERE toString(s) = '1234' SETTINGS max_rows_to_read = 2;
SELECT s FROM test2 WHERE toString(s) = '1234' SETTINGS max_rows_to_read = 2;
