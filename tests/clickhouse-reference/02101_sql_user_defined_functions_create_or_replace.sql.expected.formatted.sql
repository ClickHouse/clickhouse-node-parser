-- Tags: no-parallel
CREATE FUNCTION `02101_test_function` AS x -> x + 1;

SELECT create_query
FROM `system`.functions
WHERE name = '02101_test_function';

SELECT `02101_test_function`(1);

CREATE FUNCTION `02101_test_function` AS x -> x + 2;

DROP FUNCTION `02101_test_function`;