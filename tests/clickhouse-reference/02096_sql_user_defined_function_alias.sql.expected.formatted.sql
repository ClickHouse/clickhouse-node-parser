-- Tags: no-parallel
CREATE FUNCTION `02096_test_function` AS x -> x + 1;

SYSTEM DROP  FUNCTION 02096_test_function;