SET enable_analyzer=1;
SET optimize_functions_to_subcolumns=1;
CREATE TABLE test (a Tuple(x Array(UInt64)));
INSERT INTO test SELECT tuple(range(number % 1000)) FROM numbers_mt(1000);
SELECT count() FROM test WHERE notEmpty(a.x);
