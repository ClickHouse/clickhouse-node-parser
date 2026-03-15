-- Tags: no-parallel
CREATE FUNCTION `02101_test_function` AS x -> x + 1;

SELECT `02101_test_function`(1);