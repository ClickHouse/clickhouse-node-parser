SELECT reverse((1, 'Hello', [2, 3]));
CREATE TABLE t_tuple(tuple Tuple(a Int32, b String)) engine = MergeTree order by tuple();
SELECT reverse(tuple) FROM t_tuple;
SELECT reverse(tuple).a, reverse(tuple).b FROM t_tuple;
