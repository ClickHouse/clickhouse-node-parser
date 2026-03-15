CREATE TABLE t_leading_zeroes(id Int64, input String, val Int64, expected Int64, comment String) ENGINE=MergeTree ORDER BY id;
CREATE TABLE t_leading_zeroes_f(id Int64, input String, val Float64, expected Float64, comment String) ENGINE=MergeTree ORDER BY id;
SET input_format_values_interpret_expressions = 0;
SET input_format_values_interpret_expressions = 1;
SELECT t.val == t.expected AS ok, * FROM t_leading_zeroes t ORDER BY id;
SELECT t.val == t.expected AS ok, * FROM t_leading_zeroes_f t ORDER BY id;
