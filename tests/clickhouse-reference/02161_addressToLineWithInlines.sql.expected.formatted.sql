SELECT addressToLineWithInlines(1);

SELECT count()
FROM numbers_mt(10000000000)
SETTINGS log_comment = '02161_test_case';