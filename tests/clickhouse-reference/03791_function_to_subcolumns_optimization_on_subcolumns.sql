SET enable_analyzer=1;
SET optimize_functions_to_subcolumns=1;
CREATE TABLE test (a Tuple(x Array(UInt64)));
SELECT count() FROM test WHERE notEmpty(a.x);
