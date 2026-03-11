SELECT count() FROM test WHERE x >= 10 AND x <= 20 AND y >= 20 AND y <= 30;
-- Various other conditions

SELECT count() FROM test WHERE x = 10 SETTINGS max_rows_to_read = 64;
SELECT count() FROM test WHERE x = 10 AND y > 10 SETTINGS max_rows_to_read = 42;
SELECT count() FROM test WHERE x = 10 AND y < 10 SETTINGS max_rows_to_read = 20;
SELECT count() FROM test WHERE y = 10 SETTINGS max_rows_to_read = 48;
SELECT count() FROM test WHERE x >= 10 AND y = 10 SETTINGS max_rows_to_read = 33;
SELECT count() FROM test WHERE y = 10 AND x <= 10 SETTINGS max_rows_to_read = 17;
SELECT count() FROM test PREWHERE x >= 10 WHERE x < 11 AND y = 10 SETTINGS max_rows_to_read = 3;
