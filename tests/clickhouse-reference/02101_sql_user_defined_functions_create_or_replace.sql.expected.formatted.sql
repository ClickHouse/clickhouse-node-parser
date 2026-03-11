SELECT create_query
FROM `system`.functions
WHERE name = '02101_test_function';

SELECT `02101_test_function`(1);