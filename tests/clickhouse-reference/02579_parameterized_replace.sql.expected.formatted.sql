SET param_test_a = 30;

SELECT * REPLACE ({test_a:UInt32} AS number)
FROM numbers(2);